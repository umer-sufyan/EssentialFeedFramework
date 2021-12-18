//
//  FeedLoader.swift
//  EssentialFeedFramework
//
//  Created by Apple on 18/12/2021.
//

import Foundation

enum LoadFeedResult {
    case success([FeedItem])
    case error(Error)
}

protocol FeedLoader {
    func load(completion: @escaping ()->Void)
}
