//
//  ImageCommentsMapper.swift
//  EssentialFeedFramework
//
//  Created by Apple on 05/06/2022.
//

import Foundation

final class ImageCommentsMapper {
    
    // be careful of decodable design because it can couple
    private struct Root: Decodable {
        let items : [RemoteFeedItem]
    }
    
    static func map(_ data: Data, from response: HTTPURLResponse) throws -> [RemoteFeedItem] {
        
        guard response.isOK, let root = try? JSONDecoder().decode(Root.self, from: data) else {
            throw RemoteImageCommentLoader.Error.invalidData
        }
        
        return root.items
        
    }
}
