//
//  FeedErrorViewModel.swift
//  EssentialFeedFramworkiOS
//
//  Created by Apple on 11/02/2022.
//
struct FeedErrorViewModel {
    let message: String?
    
    
    static var noError: FeedErrorViewModel {
        return FeedErrorViewModel(message: nil)
    }
    
    static func error(message: String) -> FeedErrorViewModel {
        return FeedErrorViewModel(message: message)
    }
}
