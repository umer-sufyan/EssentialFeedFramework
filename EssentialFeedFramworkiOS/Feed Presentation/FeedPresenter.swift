//
//  FeedPresenter.swift
//  EssentialFeedFramworkiOS
//
//  Created by Apple on 15/01/2022.
//
import Foundation
import EssentialFeedFramework


final class FeedPresenter {
    
   private var feedView : FeedView
   private var loadingView: FeedLoadingView
    
    
    init(feedView: FeedView, loadingView: FeedLoadingView) {
        self.feedView = feedView
        self.loadingView = loadingView
    }
    
    static var title: String {
        return NSLocalizedString("FEED_VIEW_TITLE",
                                 tableName: "Feed",
                                 bundle: Bundle(for: FeedPresenter.self),
                                 comment: "Title for the feed view")
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
