//
//  FeedStore.swift
//  EssentialFeedFramework
//
//  Created by Apple on 31/12/2021.
//

import Foundation

 
public typealias CachedFeed = (feed: [LocalFeedImage], timestamp: Date)

public protocol FeedStore {
    func deleteCachedFeed() throws
    func insert(_ feed: [LocalFeedImage], timestamp: Date) throws
    func retrieve() throws -> CachedFeed?
       
}
