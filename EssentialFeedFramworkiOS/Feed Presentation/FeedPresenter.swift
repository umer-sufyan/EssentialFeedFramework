//
//  FeedPresenter.swift
//  EssentialFeedFramworkiOS
//
//  Created by Apple on 15/01/2022.
//

import EssentialFeedFramework

protocol FeedLoadingView: class {
    func display(isLoading: Bool)
}
protocol FeedView {
    func display(feed: [FeedImage])
}

final class FeedPresenter {
    typealias Observer<T> = (T)-> Void
    private let feedLoader: FeedLoader
    
    init(feedLoader: FeedLoader) {
        self.feedLoader = feedLoader
    }
    
    var feedview : FeedView?
    weak var loadingView: FeedLoadingView?
    
    
    func loadFeed() {
        loadingView?.display(isLoading:true)
        feedLoader.load { [weak self] result in
            if let feed = try? result.get() {
                self?.feedview?.display(feed:feed)
            }
            self?.loadingView?.display(isLoading:false)
            
        }
    }
}
