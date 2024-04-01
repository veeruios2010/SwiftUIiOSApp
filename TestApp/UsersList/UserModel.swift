//
//  UserModel.swift
//  TestApp
//
//  Created by Apple on 3/23/24.
//

import Foundation

// MARK: - UsersList
struct UsersList: Codable {
    let page, perPage, total, totalPages: Int
    let users: [User]
    let support: Support

    enum CodingKeys: String, CodingKey {
        case page
        case perPage = "per_page"
        case users = "data"
        case total
        case totalPages = "total_pages"
        case support
    }
}

// MARK: - User
struct User: Codable {
    let id: Int
    let email, firstName, lastName: String
    let avatar: String

    enum CodingKeys: String, CodingKey {
        case id, email
        case firstName = "first_name"
        case lastName = "last_name"
        case avatar
    }
}

// MARK: - Support
struct Support: Codable {
    let url: String
    let text: String
}
