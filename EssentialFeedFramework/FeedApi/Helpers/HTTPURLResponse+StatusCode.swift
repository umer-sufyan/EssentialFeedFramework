//
//  HTTPURLResponse+StatusCode.swift
//  EssentialFeedFramework
//
//  Created by Apple on 13/02/2022.
//
import Foundation

extension HTTPURLResponse {
    private static var OK_200: Int { return 200 }
    
    var isOK: Bool {
        return statusCode == HTTPURLResponse.OK_200
    }
}
