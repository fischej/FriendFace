//
//  ContentView.swift
//  FriendFace
//
//  Created by Jeff Fischer on 7/29/22.
//

import SwiftUI

struct ContentView: View {
    enum LoadState {
        case loading, success, failed
    }

    @State private var loadState = LoadState.loading
    @State private var users: [User] = []

    var body: some View {
            Group {
                switch loadState {
                    case .loading:
                        VStack {
                            Text("Downloading…")
                            ProgressView()
                        }
                    case .success:
                        NavigationView {
                            List {
                                ForEach(users) { user in
                                    NavigationLink(destination: UserView(user: user)) {
                                        HStack {
                                            Text(user.name)
                                            Image(systemName: user.isActive ? "person.crop.circle.badge.checkmark" : "person.crop.circle.badge.xmark")
                                                .foregroundColor(user.isActive ? .green : .secondary)
                                        }
                                    }
                                }
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom)
                            .navigationTitle("FriendFace")
                        }
                    case .failed:
                        VStack {
                            Text("Failed to download articles")

                            Button("Retry") {
                                loadState = .loading
                                Task {
                                    try await Task.sleep(nanoseconds: 500_000_000)
                                    await downloadUsers()
                                }
                            }
                            .buttonStyle(.borderedProminent)
                        }
                }
            }
        .task(downloadUsers)
    }

    @Sendable func downloadUsers() async {
        guard users.isEmpty else { return }

        do {
            let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
            let (data, _) = try await URLSession.shared.data(from: url)

            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601

            users = try decoder.decode([User].self, from: data).sorted()
            loadState = .success
        }
        catch {
            loadState = .failed
            print(error.localizedDescription)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
