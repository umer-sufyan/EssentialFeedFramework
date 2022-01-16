//
//  FeedPresenter.swift
//  EssentialFeedFramworkiOS
//
//  Created by Apple on 15/01/2022.
//

import EssentialFeedFramework


final class FeedPresenter {
    
   private var feedView : FeedView
   private var loadingView: FeedLoadingView
    
    
    init(feedView: FeedView, loadingView: FeedLoadingView) {
        self.feedView = feedView
        self.loadingView = loadingView
    }
    
    static var title: String {
        return "My Feed"
    }
    
    func didStartLoadingFeed() {
        loadingView.display(FeedLoadingViewModel(isLoading:true))
    }
    func didFinishLoadingFeed(with feed:[FeedImage]) {
        feedView.display(FeedViewModel(feed:feed))
        loadingView.display(FeedLoadingViewModel(isLoading:false))
    }
    func didFinishLoadingFeed(with error:Error) {
        
        loadingView.display(FeedLoadingViewModel(isLoading:false))
    }
    
}
