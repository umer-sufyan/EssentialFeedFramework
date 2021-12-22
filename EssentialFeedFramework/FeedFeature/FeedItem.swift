//
//  FeedItem.swift
//  EssentialFeedFramework
//
//  Created by Apple on 18/12/2021.
//

import Foundation

public struct FeedItem : Equatable {
   public let id: UUID
   public let description: String?
   public let location: String?
   public let imageURL: URL
    
   public init(id: UUID, description: String?, location: String?, imageURL: URL) {
        self.id = id
        self.description = description
        self.location = location
        self.imageURL = imageURL
    }
}

extension FeedItem: Decodable {
    private enum CodingKeys: String, CodingKey {
        case id
        case description
        case location
        case imageURL = "image" // Red flag! An API detail leaked into our feature module , this make strong dependency, while this should be agnostic , A seemingly harmless string in the wrong module can end up our abstractions!
    }
}
