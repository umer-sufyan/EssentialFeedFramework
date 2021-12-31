//
//  CacheFeedUseCaseTests.swift
//  EssentialFeedFrameworkTests
//
//  Created by Apple on 31/12/2021.
//

import XCTest

class LocalFeedLoader {
     init(store: FeedStore) {

     }
 }

 class FeedStore {
     var deleteCachedFeedCallCount = 0
 }

class CacheFeedUseCaseTests: XCTestCase {
    

    func test_init_doesNotDeleteCacheUponCreation() {
             let store = FeedStore()
             _ = LocalFeedLoader(store: store)

             XCTAssertEqual(store.deleteCachedFeedCallCount, 0)
         }
}
