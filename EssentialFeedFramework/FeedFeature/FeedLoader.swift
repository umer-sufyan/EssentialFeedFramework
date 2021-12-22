//
//  FeedLoader.swift
//  EssentialFeedFramework
//
//  Created by Apple on 18/12/2021.
//

import Foundation

public enum LoadFeedResult {
    case success([FeedItem])
    case failure(Error)
}

public protocol FeedLoader {
    
    func load(completion: @escaping (LoadFeedResult)->Void)
}
