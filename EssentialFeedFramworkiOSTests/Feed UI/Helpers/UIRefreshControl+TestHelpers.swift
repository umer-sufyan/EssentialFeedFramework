//
//  UIRefreshControl+TestHelpers.swift
//  EssentialFeedFramworkiOSTests
//
//  Created by Apple on 11/01/2022.
//

import UIKit

extension UIRefreshControl {
    func simulatePullToRefresh() {
        simulate(event: .valueChanged)
    }
}
