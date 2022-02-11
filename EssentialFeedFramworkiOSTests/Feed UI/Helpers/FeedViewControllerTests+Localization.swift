//
//  FeedViewControllerTests+Localization.swift
//  EssentialFeedFramworkiOSTests
//
//  Created by Apple on 17/01/2022.
//

import Foundation
import XCTest
import EssentialFeedFramework

extension FeedUIIntegrationTests {
    func localized(_ key: String, file: StaticString = #file, line: UInt = #line) -> String {
        let table = "Feed"
        let bundle = Bundle(for: FeedPresenter.self)
        let value = bundle.localizedString(forKey: key, value: nil, table: table)
        if value == key {
            XCTFail("Missing localized string for key: \(key) in table: \(table)", file: file, line: line)
        }
        return value
    }
}
