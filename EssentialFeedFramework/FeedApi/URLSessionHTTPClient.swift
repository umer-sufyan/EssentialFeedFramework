//
//  URLSessionHTTPClient.swift
//  EssentialFeedFramework
//
//  Created by Apple on 25/12/2021.
//

import Foundation

public class URLSessionHTTPClient: HTTPClient {
    private let session : URLSession
    
    public init(session: URLSession = .shared) {
        self.session = session
    }
    
    struct UnexpectedValuesRepresentation : Error {}
    public func get(from url: URL, completion:@escaping (HTTPClient.Result)-> Void)  {
        session.dataTask(with: url){ data,response, error in
            if let error = error {
                completion(.failure(error))
            } else if let data = data, let response = response as? HTTPURLResponse {
                completion(.success((data, response)))
            }else {
                completion(.failure(UnexpectedValuesRepresentation()))
            }
        }.resume()
    }
}
