//
//  FeedCache.swift
//  EssentialFeedFramework
//
//  Created by Apple on 19/02/2022.
//
import Foundation

public protocol FeedCache {
    func save(_ feed: [FeedImage]) throws
}
