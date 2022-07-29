//
//  User.swift
//  FriendFace
//
//  Created by Jeff Fischer on 7/29/22.
//

import Foundation

struct User: Codable, Identifiable, Comparable {
    let id: UUID
    let isActive: Bool
    let name: String
    let age: Int
    let company: String
    let email: String
    let address: String
    let about: String
    let registered: Date
    let tags: [String]
    let friends: [Friend]

    static func < (lhs: User, rhs: User) -> Bool {
        lhs.name < rhs.name
    }

    static func == (lhs: User, rhs: User) -> Bool {
        lhs.id == rhs.id
    }

    static let example = User(
        id: UUID(),
        isActive: true,
        name: "Bebe Rebozo",
        age: 35,
        company: "Acme Widgets",
        email: "bebe@bozo.com",
        address: "123 Main St., Visalia, CA, 91765",
        about: "Occaecat consequat elit aliquip magna laboris dolore laboris sunt officia adipisicing reprehenderit sunt. Do in proident consectetur labore. Laboris pariatur quis incididunt nostrud labore ad cillum veniam ipsum ullamco. Dolore laborum commodo veniam nisi. Eu ullamco cillum ex nostrud fugiat eu consequat enim cupidatat. Non incididunt fugiat cupidatat reprehenderit nostrud eiusmod eu sit minim do amet qui cupidatat. Elit aliquip nisi ea veniam proident dolore exercitation irure est deserunt.",
        registered: Date(),
        tags: ["Tag 1", "Tag 2", "Tag 3"],
        friends: [
            Friend(id: UUID(), name: "Tilly Headware"),
            Friend(id: UUID(), name: "Allsconce Silicone")
        ]
    )

}
