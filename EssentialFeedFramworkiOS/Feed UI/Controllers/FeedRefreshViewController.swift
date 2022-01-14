//
//  FeedRefreshViewController.swift
//  EssentialFeedFramworkiOS
//
//  Created by Apple on 11/01/2022.
//
import UIKit
//import EssentialFeedFramework


final class FeedRefreshViewController: NSObject {
    private(set) lazy var view = binded(UIRefreshControl())
    
    private let viewModel: FeedViewModel
    
    init(viewModel: FeedViewModel) {
        self.viewModel = viewModel
        
    }
    
    //Binding Logic , can be better done with combine
    @objc func refresh() {
        viewModel.loadFeed()
    }
    private func binded(_ view: UIRefreshControl) -> UIRefreshControl{
        viewModel.onLoadStateChange = { [weak view] isLoading in

            if isLoading {
                view?.beginRefreshing()
            }else {
                view?.endRefreshing()
            }
            
        }
        view.addTarget(self, action: #selector(refresh), for: .valueChanged)
        
        return view
    }
}
