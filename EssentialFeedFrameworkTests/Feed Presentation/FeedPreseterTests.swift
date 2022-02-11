//
//  FeedPreseterTests.swift
//  EssentialFeedFrameworkTests
//
//  Created by Apple on 11/02/2022.
//

import XCTest

final class FeedPresenter {
    init(view: Any) {
        
    }
}

class FeedPreseterTests: XCTestCase {

    func test_init_doesNotSendMessagesToView() {
        let view = ViewSpy()
        
        _ = FeedPresenter(view: view)
        
        XCTAssertTrue(view.messages.isEmpty, "Expected no view messages")
    }
    
    // MARK: - Helpers
    private class ViewSpy {
        let messages = [Any]()
    }

}
