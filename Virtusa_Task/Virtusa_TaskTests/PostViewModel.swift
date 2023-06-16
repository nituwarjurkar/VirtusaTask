//
//  PostViewModel.swift
//  Virtusa_TaskTests
//
//  Created by Nitu Warjurkar on 16/06/23.
//

import XCTest
@testable import Virtusa_Task

final class PostViewModel: XCTestCase {
    var viewModel: ViewModel!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewModel = ViewModel(httpClient: HttpClientMockProtocol())
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        viewModel = nil
    }
    func testfetchData() async throws {
        let posts: Posts = try await viewModel.fetchDetails()!
        
       XCTAssertNotNil(posts)
        XCTAssertEqual(posts.count, 100)
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
