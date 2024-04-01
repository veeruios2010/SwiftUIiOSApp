//
//  UserListView.swift
//  TestApp
//
//  Created by Apple on 3/23/24.
//

import SwiftUI

struct UserListView: View {
    
    @ObservedObject var viewModel = UserListViewModel()
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                Color.white.ignoresSafeArea()
                
                VStack() {
                    List(viewModel.users ?? [], id: \.id) { user in
                        NavigationLink(destination: UserDetailView(userInfo: user)) {
                            HStack {
                                AsyncImage(url: URL(string: user.avatar )) { image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .clipShape(Circle())
                                } placeholder: {
                                    Circle()
                                        .foregroundColor(.teal)
                                }
                                .frame(width: Constants.frameHeightAndWidth70, height: Constants.frameHeightAndWidth70)
                                
                                HStack() {
                                    Text(user.firstName.capitalized )
                                        .font(.headline)
                                    Text(user.lastName )
                                        .font(.subheadline)
                                }
                            }
                        }
                    }
                    .listStyle(.insetGrouped)
                    .listRowInsets(EdgeInsets())
                    .background(Color.white)
                    .navigationTitle(LocalizedStringKey(Constants.navigationTitle))

                    if viewModel.isLoading {
                        LoaderView()
                    }
                    
                    HStack() {
                        Spacer()
                            .frame(width: Constants.spacerHeightorWidth)
                        Button(LocalizedStringKey(Constants.ButtonTitles.previousBtn)) {
                            viewModel.pageDecrement()
                        }
                        Spacer()
                        Button(LocalizedStringKey( Constants.ButtonTitles.nextBtn)) {
                            viewModel.pageIncrement()
                        }
                        Spacer()
                            .frame(width: Constants.spacerHeightorWidth)
                    }
                }
            }
        }
        .task {
            await viewModel.getUsers()
        }
        .alert(isPresented: $viewModel.shouldShowAlert) {
            return Alert(
                // Constants.AlertTitles.error
                title: Text(LocalizedStringKey(Constants.AlertTitles.error)),
                message: Text(viewModel.userError?.errorDescription ?? "")
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView()
            .environment(\.locale, .init(identifier: "ja"))
        // Japanese
        // .environment(\.locale, .init(identifier: "ja"))
    }
}
