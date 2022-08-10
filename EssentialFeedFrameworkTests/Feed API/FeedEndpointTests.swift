//
//  FeedEndpointTests.swift
//  EssentialFeedFrameworkTests
//
//  Created by Apple on 10/08/2022.
//

import XCTest
import EssentialFeedFramework

class FeedEndpointTests: XCTestCase {

    func test_feed_endpointURL() {
        let baseURL = URL(string: "http://base-url.com")!
        
        let received = FeedEndpoint.get.url(baseURL: baseURL)
        let expected = URL(string: "http://base-url.com/v1/feed")!
        
        XCTAssertEqual(received, expected)
    }

}
