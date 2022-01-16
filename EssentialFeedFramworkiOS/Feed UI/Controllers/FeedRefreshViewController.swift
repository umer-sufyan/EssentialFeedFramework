//
//  FeedRefreshViewController.swift
//  EssentialFeedFramworkiOS
//
//  Created by Apple on 11/01/2022.
//
import UIKit

protocol FeedRefreshViewControllerDelegate {
    func didRequestFeedRefresh()
}

final class FeedRefreshViewController: NSObject,  FeedLoadingView {
    
    @IBOutlet private var view : UIRefreshControl?
    
    var delegate: FeedRefreshViewControllerDelegate?
    
    
    @IBAction func refresh() {
        delegate?.didRequestFeedRefresh()
    }
    
    func display(_ viewModel: FeedLoadingViewModel) {
        if viewModel.isLoading {
            view?.beginRefreshing()
        }else {
            view?.endRefreshing()
        }
    }
    
}
