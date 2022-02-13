//
//  FeedItemsMapper.swift
//  EssentialFeedFramework
//
//  Created by Apple on 22/12/2021.
//

import Foundation



 final class FeedItemMapper {
    
    // be careful of decodable design because it can couple
    private struct Root: Decodable {
        let items : [RemoteFeedItem]
    }
    
     static func map(_ data: Data, from response: HTTPURLResponse) throws -> [RemoteFeedItem] {
        
        guard response.isOK, let root = try? JSONDecoder().decode(Root.self, from: data) else {
            throw RemoteFeedLoader.Error.invalidData
        }
        
        return root.items
        
    }
}
