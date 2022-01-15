//
//  FeedLoadingViewModel.swift
//  EssentialFeedFramworkiOS
//
//  Created by Apple on 15/01/2022.
//

import EssentialFeedFramework

struct FeedLoadingViewModel {
    let isLoading: Bool
}

protocol FeedLoadingView {
    func display(_ viewModel: FeedLoadingViewModel)
}
