//
//  FeedImageDataCache.swift
//  EssentialFeedFramework
//
//  Created by Apple on 19/02/2022.
//
import Foundation

public protocol FeedImageDataCache {
    typealias Result = Swift.Result<Void, Error>
    
    func save(_ data: Data, for url: URL, completion: @escaping (Result) -> Void)
}
