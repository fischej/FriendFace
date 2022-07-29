//
//  UserView.swift
//  FriendFace
//
//  Created by Jeff Fischer on 7/29/22.
//

import SwiftUI

struct UserView: View {
    let user: User
    let columns = [GridItem(.adaptive(minimum: 80, maximum: 90), alignment: .topLeading), GridItem(.adaptive(minimum: 300), alignment: .topLeading)]

    var body: some View {
        List {
            Section {
                Text("Age: ") + Text("\(user.age)").bold()
                    Text("Company: ") + Text("\(user.company)").bold()
                    Text("Email: ") + Text("\(user.email)").bold()
                    Text("Address: ") + Text("\(user.address)").bold()
                Text("Registered: ") + Text("\(user.registered, format: Date.FormatStyle().month().day().year())").bold()

            }

            Section("About") {
                Text(user.about)
            }

            Section("Friends") {
                ForEach(user.friends) { friend in
                    Text(friend.name)
                }
            }
        }
        .listStyle(.grouped)
        .navigationTitle(user.name)
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView(user: User.example)
    }
}
