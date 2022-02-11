//
//  UIRefreshControl+Helpers.swift
//  EssentialFeedFramworkiOS
//
//  Created by Apple on 11/02/2022.
//

import UIKit

extension UIRefreshControl {
    func update(isRefreshing: Bool) {
        isRefreshing ? beginRefreshing() : endRefreshing()
    }
}
