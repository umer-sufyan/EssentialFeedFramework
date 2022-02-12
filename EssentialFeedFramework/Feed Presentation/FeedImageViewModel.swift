//
//  FeedImageViewModel.swift
//  EssentialFeedFramework
//
//  Created by Apple on 11/02/2022.
//
public struct FeedImageViewModel<Image> {
    public let description: String?
    public let location: String?
    public let image: Image?
    public let isLoading: Bool
    public let shouldRetry: Bool
    
    public var hasLocation: Bool {
        return location != nil
    }
}
