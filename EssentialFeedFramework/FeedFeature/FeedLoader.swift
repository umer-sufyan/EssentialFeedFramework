//
//  FeedLoader.swift
//  EssentialFeedFramework
//
//  Created by Apple on 18/12/2021.
//

import Foundation

public typealias LoadFeedResult = Result<[FeedImage],Error>  

public protocol FeedLoader {
    
    func load(completion: @escaping (LoadFeedResult)->Void)
}
