//
//  ImageCommentsEndpoint.swift
//  EssentialFeedFramework
//
//  Created by Apple on 10/08/2022.
//

import Foundation

public enum ImageCommentsEndpoint {
    case get(UUID)
    
    public func url(baseURL: URL) -> URL {
        switch self {
        case let .get(id):
            return baseURL.appendingPathComponent("/v1/image/\(id)/comments")
        }
    }
}
