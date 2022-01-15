//
//  FeedViewModel.swift
//  EssentialFeedFramworkiOS
//
//  Created by Apple on 13/01/2022.
//

import EssentialFeedFramework

final class FeedViewModel {
    typealias Observer<T> = (T)-> Void
    private let feedLoader: FeedLoader
    
    init(feedLoader: FeedLoader) {
        self.feedLoader = feedLoader
    }
    
    
    var onLoadStateChange : Observer<Bool>?
    var onFeedLoad: Observer<[FeedImage]>?
    
    
    func loadFeed() {
        onLoadStateChange?(true)
        feedLoader.load { [weak self] result in
            if let feed = try? result.get() {
                self?.onFeedLoad?(feed)
            }
            self?.onLoadStateChange?(false)
            
        }
    }
}
