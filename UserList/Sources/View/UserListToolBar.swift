//
//  UserListToolBar.swift
//  UserList
//
//  Created by KEITA on 07/03/2024.
//

import SwiftUI

struct UserPickerView: View {
    @ObservedObject var userListViewModel: UserListViewModel
    
    var body: some View {
        Picker(selection: $userListViewModel.isGridView, label: Text("Display")) {
            Image(systemName: "rectangle.grid.1x2.fill")
                .tag(true)
                .accessibilityLabel(Text("Grid view"))
            Image(systemName: "list.bullet")
                .tag(false)
                .accessibilityLabel(Text("List view"))
        }
        .pickerStyle(SegmentedPickerStyle())
    }
}

struct UserButtonView: View {
    @ObservedObject var userListViewModel: UserListViewModel
    
    var body: some View {
        Button(action: {
            userListViewModel.reloadUsers()
        }) {
            Image(systemName: "arrow.clockwise")
                .imageScale(.large)
        }
    }
}
