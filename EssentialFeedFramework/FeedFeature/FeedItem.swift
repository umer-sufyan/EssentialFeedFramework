//
//  FeedItem.swift
//  EssentialFeedFramework
//
//  Created by Apple on 18/12/2021.
//

import Foundation

public struct FeedItem : Equatable {
    let id: UUID
    let description: String?
    let location: String?
    let imageURL: URL
}
