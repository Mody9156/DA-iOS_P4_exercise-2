//
//  ViewModel.swift
//  UserListTests
//
//  Created by KEITA on 04/03/2024.
//

import XCTest
import SwiftUI
@testable import UserList
final class ViewModelTests: XCTestCase {


    func testShouldLoadMoreDataSuccess() async throws {
        // Given
        let viewModel = UserListViewModel()
        //When
        viewModel.fetchUsers()
        viewModel.users.append(contentsOf: viewModel.users)
        //Then
        XCTAssertTrue(viewModel.isLoading)
        XCTAssertTrue(viewModel.isLoading)
        
    }

   
    func testshouldLoadDataSuccess() async throws {
        //Given
        let viewModel = UserListViewModel()
        //When
        let DobUSer = UserListResponse.User.Dob(date: "Vendredi", age: 25)
        let nameU = UserListResponse.User.Name(title: "Modibo", first: "Micke", last: "KEITA")
        let PictureUSer = UserListResponse.User.Picture(large: "larg", medium: "medium", thumbnail: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR87fG1bTCYL6ZJhjPPGkLO351MNYqyX3xxOEWhTVNI47pczZIuGp7powwehFRxnX9irdY&usqp=CAU")
     
        let BoolTrue = true
        let result = viewModel.shouldLoadMoreData(currentItem: User(user: UserListResponse.User(name: nameU, dob: DobUSer, picture: PictureUSer)))
        //Then
        XCTAssertEqual(result, false)
    }
    func testreloadUsersSuccess() async throws {
        //Given
        let viewmodel = UserListViewModel()
        //When
        viewmodel.reloadUsers()
        //Then
        XCTAssertEqual(viewmodel.users.isEmpty, true)
       
    }

}
