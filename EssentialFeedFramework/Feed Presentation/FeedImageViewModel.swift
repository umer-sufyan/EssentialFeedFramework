//
//  FeedImageViewModel.swift
//  EssentialFeedFramework
//
//  Created by Apple on 11/02/2022.
//
public struct FeedImageViewModel {
    public let description: String?
    public let location: String?
    
    
    public var hasLocation: Bool {
        return location != nil
    }
}
