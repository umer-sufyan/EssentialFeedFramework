//
//  FeedPresenter.swift
//  EssentialFeedFramworkiOS
//
//  Created by Apple on 15/01/2022.
//

import EssentialFeedFramework

struct FeedLoadingViewModel {
    let isLoading: Bool
}

protocol FeedLoadingView {
    func display(_ viewModel: FeedLoadingViewModel)
}

struct FeedViewModel {
    let feed: [FeedImage]
}

protocol FeedView {
    func display(_ viewModel: FeedViewModel)
}

final class FeedPresenter {
    typealias Observer<T> = (T)-> Void
    private let feedLoader: FeedLoader
    
    init(feedLoader: FeedLoader) {
        self.feedLoader = feedLoader
    }
    
    var feedview : FeedView?
    var loadingView: FeedLoadingView?
    
    
    func loadFeed() {
        loadingView?.display(FeedLoadingViewModel(isLoading:true))
        feedLoader.load { [weak self] result in
            if let feed = try? result.get() {
                self?.feedview?.display(FeedViewModel(feed:feed))
            }
            self?.loadingView?.display(FeedLoadingViewModel(isLoading:false))
        }
    }
}
