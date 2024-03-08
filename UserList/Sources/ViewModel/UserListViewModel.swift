// UserLogic.swift
// UserList
//
// Created by KEITA on 23/02/2024.
//

import SwiftUI

class UserListViewModel: ObservableObject {
    @Published var users: [User] = []
    @Published var isLoading = false
    @Published var isGridView = false
    let repository = UserListRepository()
    
    func fetchUsers() {
        
        isLoading = true
        Task {
            do {
                let users = try await repository.fetchUsers(quantity: 20)
                DispatchQueue.main.async {
                    self.users.append(contentsOf: users)
                    self.isLoading = false
                }
            } catch {
                print("Error fetching users: \(error.localizedDescription)")
            }
        }
    }
    
    // TODO: - Should be an OutPut
    func shouldLoadMoreData(currentItem item: User) -> Bool {
        guard let lastItem = users.last else { return false }
        return !isLoading && item.id == lastItem.id
    }
    
    // TODO: - Should be a viewModel's input
    func reloadUsers() {
        users.removeAll()
        fetchUsers()
    }
}
