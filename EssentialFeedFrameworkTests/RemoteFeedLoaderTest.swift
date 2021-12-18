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
    
    let client : HTTPClient
    let url : URL
    
    init(url: URL, client: HTTPClient) {
        self.url = url
        self.client = client
    }
    
    
    func load()  {
        client.get(from: url)
    }
}

protocol HTTPClient {
     
    func get(from url: URL)
    
}

class HTTPClientSpy: HTTPClient {
    
    
    func get(from url: URL) {
        requestedURL = url
    }
    
    var requestedURL : URL?
}

class RemoteFeedLoaderTest: XCTestCase {
    
    
    func test_init_doesNotRequestRequestDataFromURL()  {
        
        //Arrange or Given client and sut (system under test)
        let client = HTTPClientSpy()
        
        let url = URL(string: "https://a-url.com")!
        
        _ = RemoteFeedLoader(url:url, client: client)
        
        //Act or when , so far nothing
        
        //Assert or Then, the client would have no URL
        XCTAssertNil(client.requestedURL)
    }
    
    func test_load_requestDataFromURL() {
        
        let url = URL(string: "https://a-given-url.com")!
        //Arrange or Given client and sut (system under test)
        let client = HTTPClientSpy()
        
        let sut = RemoteFeedLoader(url: url,  client: client)
        
        //Act or when we invoke sut.load()
        sut.load()
        
        //then or Assert, then assert that a URL request was initiated in the client
        XCTAssertNotNil(client.requestedURL)
        
    }
    
    
}
