//
//  FeedImageDataLoader.swift
//  EssentialFeedFramworkiOS
//
//  Created by Apple on 11/01/2022.
//

public protocol FeedImageDataLoader {
    
    func loadImageData(from url: URL) throws -> Data
}
