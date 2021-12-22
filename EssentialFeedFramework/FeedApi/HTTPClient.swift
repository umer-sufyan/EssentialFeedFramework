//
//  HTTPClient.swift
//  EssentialFeedFramework
//
//  Created by Apple on 22/12/2021.
//

import Foundation

public enum HTTPClientResult {
    case success(Data,HTTPURLResponse)
    case failure(Error)
}

public protocol HTTPClient {
    
    func get(from url: URL, completion:@escaping (HTTPClientResult) -> Void)
}
