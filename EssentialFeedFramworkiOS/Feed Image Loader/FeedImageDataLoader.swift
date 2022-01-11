//
//  FeedImageDataLoader.swift
//  EssentialFeedFramworkiOS
//
//  Created by Apple on 11/01/2022.
//

public protocol FeedImageDataLoaderTask {
    func cancel()
}

public protocol FeedImageDataLoader {
    
    typealias Result = Swift.Result<Data, Error>
    
    func loadImageData(from url: URL, completion: @escaping (Result) -> Void) -> FeedImageDataLoaderTask
}
