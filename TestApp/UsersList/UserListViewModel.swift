//
//  UserListViewModel.swift
//  TestApp
//
//  Created by Apple on 3/23/24.
//

import Foundation

@MainActor
final class UserListViewModel: ObservableObject {
    
    
    @Published var pageCount: Int = 1
    @Published var users: [User]?
    @Published var userError: UserError?
    @Published var shouldShowAlert = false
    @Published var isLoading = false
    
    init(users: [User]? = nil, userError: UserError? = nil, shouldShowAlert: Bool = false, isLoading: Bool = false) {
        self.pageCount = pageCount
        self.users = users
        self.userError = userError
        self.shouldShowAlert = shouldShowAlert
        self.isLoading = isLoading
    }
    
    func getUsers() async {
        isLoading = true
        do {
            self.users = try await WebService.shared.getUsers()
            self.isLoading = false
        } catch(let error) {
            userError = UserError.custom(error: error)
            shouldShowAlert = true
            isLoading = false
        }
    }
    
    func pageIncrement() {
        pageCount += 1
    }

    func pageDecrement() {
        pageCount -= 1
    }
    
}
