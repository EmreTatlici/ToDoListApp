//
//  NewItemView.swift
//  ToDo
//
//  Created by Mustafa Emre Tatlıcı on 15.09.2024.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewViewModel()
    @State private var showingDatePicker = false
    @Binding var newItemPresented: Bool
    
    var body: some View {
        VStack {
            Text("New Item")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 100)
            
            Form {
                // Title (with auto-expanding height)
                VStack(alignment: .leading) {
                    Text("Title")
                        .font(.headline)
                    
                    ZStack(alignment: .topLeading) {
                        // Placeholder text if empty
                        if viewModel.title.isEmpty {
                            Text("Enter title here...")
                                .foregroundColor(.gray)
                                .padding(.leading, 4)
                                .padding(.top, 8)
                        }
                        
                        TextEditor(text: $viewModel.title)
                            .frame(height: 70) // Fixed height for the title input
                            .border(Color.gray.opacity(0.5), width: 1)
                            .padding(.horizontal, 4)
                    }
                }
                .padding(.vertical, 8)
                
                // Due Date
                Button(action: {
                    showingDatePicker.toggle()
                }) {
                    HStack {
                        Text("Due Date")
                        Spacer()
                        Text("\(viewModel.dueDate, formatter: dateFormatter)")
                            .foregroundColor(.gray)
                    }
                }
                
                // Button
                TLButton(
                    title: "Save",
                    background: .pink
                ) {
                    if viewModel.canSave {
                        viewModel.save()
                        newItemPresented = false
                    } else {
                        viewModel.showAlert = true
                    }
                }
                .padding()
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(
                 title:Text("Error"),
                 message: Text("Please fill in all fields and select due date that is today or newer."))
            }
        }
        .sheet(isPresented: $showingDatePicker) {
            VStack {
                DatePicker("Select a due date", selection: $viewModel.dueDate, displayedComponents: .date)
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .padding()
                
                Button("Done") {
                    showingDatePicker = false
                }
                .padding()
            }
        }
    }
}

private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    return formatter
}()

#Preview {
    NewItemView(newItemPresented: Binding(get: {
        return true
    }, set: {_ in
    }))
}
