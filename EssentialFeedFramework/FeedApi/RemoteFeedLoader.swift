//
//  RemoteFeedLoader.swift
//  EssentialFeedFramework
//
//  Created by Apple on 18/12/2021.
//

import Foundation

public final class RemoteFeedLoader {
    private let url : URL
    private let client : HTTPClient
    
    public enum Error: Swift.Error {
        case connectivity
        case invalidData
    }
    
    public enum Result:Equatable{
        case success([FeedItem])
        case failure(Error)
    }
  
    
   public init(url: URL, client: HTTPClient) {
        self.url = url
        self.client = client
    }
    
    
    public func load(completion: @escaping (Result)->Void)  {
        
        client.get(from: url){ result in
            
            switch result {
            case let .success(data, response):
                do{
                    
                    completion(FeedItemMapper.map(data, from: response))
                } catch  {
                    completion(.failure(.invalidData))
                }
            case .failure:
                completion(.failure(.connectivity))
            }
        }
    }
    
    
}






