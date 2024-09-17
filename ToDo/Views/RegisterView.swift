import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                // Header
                HeaderView(
                    title: "Register",
                    subtitle: "Create your account",
                    angle: 15,
                    background: LinearGradient(
                        gradient: Gradient(colors: [.orange.opacity(0.8), .red.opacity(0.8)]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .padding()
                .foregroundColor(.white)
                
                Form {
                    // Full Name Field
                    TextField("Full Name", text: $viewModel.name)
                        .padding()
                        .background(Color(UIColor.systemGray6))
                        .cornerRadius(8)
                        .foregroundColor(.primary)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                        )
                    
                    // Email Field
                    TextField("Email Address", text: $viewModel.email)
                        .padding()
                        .background(Color(UIColor.systemGray6))
                        .cornerRadius(8)
                        .foregroundColor(.primary)
                        .autocapitalization(.none)
                        .keyboardType(.emailAddress)
                        .disableAutocorrection(true)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                        )
                    
                    // Password Field
                    SecureField("Password", text: $viewModel.password)
                        .padding()
                        .background(Color(UIColor.systemGray6))
                        .cornerRadius(8)
                        .foregroundColor(.primary)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                        )
                    
                    // Register Button
                    TLButton(
                        title: "Register",
                        background: .orange
                    ) {
                        viewModel.register()
                    }
                    .padding()
                }
                .padding(.horizontal)
                .frame(width: 350, height: 400)
                .background(Color.clear) // Ensure Form background is clear to avoid extra white areas
                .cornerRadius(15)
                .shadow(radius: 10)
                
                
                Text("Stay organized and accomplish your tasks effortlessly with our simple to-do list.")
                    .font(.system(size: 15, weight: .medium))
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .padding(.top,50)
                
                Spacer()
                
                
                
            }
            .background(Color(UIColor.systemBackground).ignoresSafeArea())
        }
    }
}

#Preview {
    RegisterView()
        .previewLayout(.sizeThatFits)
        .padding()
}
