//
//  FeedEndpoint.swift
//  EssentialFeedFramework
//
//  Created by Apple on 10/08/2022.
//

import Foundation

public enum FeedEndpoint {
    case get
    
    public func url(baseURL: URL) -> URL {
        switch self {
        case .get:
            return baseURL.appendingPathComponent("/v1/feed")
        }
    }
}
