import SwiftUI

struct UserListView: View {
    @StateObject private var userListViewModel = UserListViewModel()
    
    var body: some View {
        NavigationView {
            if !userListViewModel.isGridView {
                List(userListViewModel.users) { user in
                    ViewtypeList(user: user)
                        .onAppear {
                            if userListViewModel.shouldLoadMoreData(currentItem: user) {
                                userListViewModel.fetchUsers()
                            }
                        }
                }
                .navigationTitle("Users")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        UserPickerView(userListViewModel: userListViewModel)
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        UserButtonView(userListViewModel: userListViewModel)
                    }
                }
            } else {
                ScrollView {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))]) {
                        ForEach(userListViewModel.users) { user in
                            ViewtypeGrid(user: user)
                                .onAppear {
                                    if userListViewModel.shouldLoadMoreData(currentItem: user) {
                                        userListViewModel.fetchUsers()
                                    }
                                }
                        }
                    }
                }
                .navigationTitle("Users")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        UserPickerView(userListViewModel: userListViewModel)
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        UserButtonView(userListViewModel: userListViewModel)
                    }
                }
            }
        }
        .onAppear {
            userListViewModel.fetchUsers()
        }
    }
}





