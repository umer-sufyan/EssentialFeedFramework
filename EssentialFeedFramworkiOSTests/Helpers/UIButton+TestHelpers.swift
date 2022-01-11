//
//  UIButton+TestHelpers.swift
//  EssentialFeedFramworkiOSTests
//
//  Created by Apple on 11/01/2022.
//

import UIKit

extension UIButton {
    func simulateTap() {
        simulate(event: .touchUpInside)
    }
}
