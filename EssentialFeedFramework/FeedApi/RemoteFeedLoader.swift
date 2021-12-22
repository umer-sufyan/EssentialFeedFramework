//
//  RemoteFeedLoader.swift
//  EssentialFeedFramework
//
//  Created by Apple on 18/12/2021.
//

import Foundation

public final class RemoteFeedLoader: FeedLoader {
    private let url : URL
    private let client : HTTPClient
    
    public enum Error: Swift.Error {  //The RemoteFeedLoader domain-specific Error type is a lower level implementation
        //detail of the Feed API module. Thus we don't want it in the higher-level Feed Feature module.
        case connectivity
        case invalidData
    }
    
    public typealias Result = LoadFeedResult<Error>
  
    
   public init(url: URL, client: HTTPClient) {
        self.url = url
        self.client = client
    }
    
    
    public func load(completion: @escaping (Result)->Void)  {
        
        client.get(from: url){ [weak self] result in
            
            guard self != nil else { return }
            
            switch result {
            case let .success(data, response):
                completion(FeedItemMapper.map(data, from: response))
            case .failure:
                completion(.failure(.connectivity))
            }
        }
    }
    
    
}






