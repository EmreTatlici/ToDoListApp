//
//  User.swift
//  ToDo
//
//  Created by Mustafa Emre Tatlıcı on 15.09.2024.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
