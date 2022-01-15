//
//  FeedViewModel.swift
//  EssentialFeedFramworkiOS
//
//  Created by Apple on 15/01/2022.
//

import EssentialFeedFramework

struct FeedViewModel {
    let feed: [FeedImage]
}

protocol FeedView {
    func display(_ viewModel: FeedViewModel)
}
