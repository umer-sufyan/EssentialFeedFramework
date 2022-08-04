//
//  ImageCommentsLocalizationTests.swift
//  EssentialFeedFrameworkTests
//
//  Created by Apple on 04/08/2022.
//

import XCTest
import EssentialFeedFramework

class ImageCommentsLocalizationTests: XCTestCase {

    func test_localizedStrings_haveKeysAndValuesForAllSupportedLocalizations() {
        let table = "ImageComments"
        let bundle = Bundle(for: ImageCommentsPresenter.self)
        
        assertLocalizedKeyAndValuesExist(in: bundle, table)
    }

}
