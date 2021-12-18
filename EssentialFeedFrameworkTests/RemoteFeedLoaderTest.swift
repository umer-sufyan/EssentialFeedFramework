//
//  RemoteFeedLoaderTest.swift
//  EssentialFeedFrameworkTests
//
//  Created by Apple on 18/12/2021.
//


//Load Feed Use Cases (happy path)
//Data URL
//1. Execute "Load Feed Items" command with above data.
//2. System downloads data from the URL.
//3. Sysem validate downloaded data.
//4. System creates feed item from valid data.
//5. Systen delivers feed items.

//Invalid data - errors course (sad path)
//1. System delivers error.

//No connectivity - error course (sad path)


import XCTest

class RemoteFeedLoader {
    func load()  {
        
    }
}

class HTTPClient {
    var requestedURL : URL?
}

class RemoteFeedLoaderTest: XCTestCase {
    
    
    func test_init_doesNotRequestRequestDataFromURL()  {
        
        //Arrange or Given client and sut (system under test)
        let client = HTTPClient()
        
        _ = RemoteFeedLoader()
        
        //Act or when , so far nothing
        
        //Assert or Then, the client would have no URL
        XCTAssertNil(client.requestedURL)
    }
    
   
    
    
}
