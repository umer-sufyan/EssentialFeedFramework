//
//  FeedImageDataStore.swift
//  EssentialFeedFramework
//
//  Created by Apple on 14/02/2022.
//

import Foundation


public protocol FeedImageDataStore {
    func insert(_ data: Data, for url: URL) throws
    func retrieve(dataForURL url: URL) throws -> Data?
}
