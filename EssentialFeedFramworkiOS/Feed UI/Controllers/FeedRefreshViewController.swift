//
//  FeedRefreshViewController.swift
//  EssentialFeedFramworkiOS
//
//  Created by Apple on 11/01/2022.
//
import UIKit
//import EssentialFeedFramework


final class FeedRefreshViewController: NSObject,  FeedLoadingView {
    
    private(set) lazy var view = loadView()
    
    private let presenter: FeedPresenter
    
    init(presenter: FeedPresenter) {
        self.presenter = presenter
    }
    
    //Binding Logic , can be better done with combine
    @objc func refresh() {
        presenter.loadFeed()
    }
    
    func display(_ viewModel: FeedLoadingViewModel) {
        if viewModel.isLoading {
            view.beginRefreshing()
        }else {
            view.endRefreshing()
        }
    }
    
    private func loadView() -> UIRefreshControl{
        let view = UIRefreshControl()
        view.addTarget(self, action: #selector(refresh), for: .valueChanged)
        
        return view
    }
}
