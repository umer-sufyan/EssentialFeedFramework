//
//  FeedImagePresenterTests.swift
//  EssentialFeedFrameworkTests
//
//  Created by Apple on 11/02/2022.
//

import XCTest
import EssentialFeedFramework

class FeedImagePresenterTests: XCTestCase {

    func test_map_createsViewModel() {
        let image = uniqueImage()
        
        let viewModel = FeedImagePresenter.map(image)
        
        XCTAssertEqual(viewModel.description, image.description)
        XCTAssertEqual(viewModel.location, image.location)
    }
    
}
