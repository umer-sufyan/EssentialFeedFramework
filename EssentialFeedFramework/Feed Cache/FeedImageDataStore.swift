//
//  FeedImageDataStore.swift
//  EssentialFeedFramework
//
//  Created by Apple on 14/02/2022.
//

import Foundation

public protocol FeedImageDataStore {
    typealias Result = Swift.Result<Data?, Error>
    
    func retrieve(dataForURL url: URL, completion: @escaping (Result) -> Void)
}
