//
//  FeedPresenter.swift
//  EssentialFeedFramework
//
//  Created by Apple on 11/02/2022.
//
import Foundation



public final class FeedPresenter {
    
    public static var title: String {
        return NSLocalizedString("FEED_VIEW_TITLE",
                                 tableName: "Feed",
                                 bundle: Bundle(for: FeedPresenter.self),
                                 comment: "Title for the feed view")
    }
    
}
