//
//  RemoteLoader.swift
//  EssentialFeedFramework
//
//  Created by Apple on 06/06/2022.
//

import Foundation

public final class RemoteLoader: FeedLoader {
    private let url : URL
    private let client : HTTPClient
    
    public enum Error: Swift.Error {  //The RemoteFeedLoader domain-specific Error type is a lower level implementation
        //detail of the Feed API module. Thus we don't want it in the higher-level Feed Feature module.
        case connectivity
        case invalidData
    }
    
    public typealias Result = FeedLoader.Result
    
    
    public init(url: URL, client: HTTPClient) {
        self.url = url
        self.client = client
    }
    
    
    public func load(completion: @escaping (Result)->Void)  {
        
        client.get(from: url){ [weak self] result in
            
            guard self != nil else { return }
            
            switch result {
            case let .success((data, response)):
                completion(RemoteLoader.map(data, from: response))
            case .failure:
                completion(.failure(Error.connectivity))
            }
        }
    }
    private static func map(_ data: Data, from response: HTTPURLResponse) -> Result {
        do {
            let items = try FeedItemMapper.map(data, from: response)
            return .success(items)
        } catch {
            return .failure(Error.invalidData)
        }
    }
}
