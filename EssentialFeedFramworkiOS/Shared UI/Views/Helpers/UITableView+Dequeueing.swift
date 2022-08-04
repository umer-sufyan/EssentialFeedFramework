//
//  UITableView+Dequeueing.swift
//  EssentialFeedFramworkiOS
//
//  Created by Apple on 16/01/2022.
//

import UIKit

extension UITableView {
    func dequeueReusableCell<T: UITableViewCell>() -> T {
        let identifier = String(describing: T.self)
        return dequeueReusableCell(withIdentifier: identifier) as! T
    }
}
