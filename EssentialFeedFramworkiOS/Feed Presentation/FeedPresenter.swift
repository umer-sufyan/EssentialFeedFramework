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
    
    var feedview : FeedView?
    var loadingView: FeedLoadingView?
    
    
    func didStartLoadingFeed() {
        loadingView?.display(FeedLoadingViewModel(isLoading:true))
    }
    func didFinishLoadingFeed(with feed:[FeedImage]) {
        feedview?.display(FeedViewModel(feed:feed))
        loadingView?.display(FeedLoadingViewModel(isLoading:false))
    }
    func didFinishLoadingFeed(with error:Error) {
        
        loadingView?.display(FeedLoadingViewModel(isLoading:false))
    }
    
}
