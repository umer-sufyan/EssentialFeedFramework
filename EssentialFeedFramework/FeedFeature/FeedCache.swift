//
//  FeedCache.swift
//  EssentialFeedFramework
//
//  Created by Apple on 19/02/2022.
//
import Foundation

public protocol FeedCache {
    typealias Result = Swift.Result<Void, Error>
    
    func save(_ feed: [FeedImage], completion: @escaping (Result) -> Void)
}
