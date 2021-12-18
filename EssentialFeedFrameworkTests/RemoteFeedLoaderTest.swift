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


class RemoteFeedLoaderTest: XCTestCase {
    
    
    func test_init_doesNotRequestRequestDataFromURL()  {
        
        //Arrange or Given client and sut (system under test)
        let client = HTTPClientSpy()
        
       _ = makeSUT()
        
        //Act or when , so far nothing
        
        //Assert or Then, the client would have no URL
        XCTAssertNil(client.requestedURL)
    }
    
    func test_load_requestDataFromURL() {
        
        let url = URL(string: "https://a-given-url.com")!
        //Arrange or Given client and sut (system under test)
        
        let (sut, client) = makeSUT(url: url)
        
        //Act or when we invoke sut.load()
        sut.load()
        
        //then or Assert, then assert that a URL request was initiated in the client
        XCTAssertNotNil(client.requestedURL)
        
    }
    
    //MARK:  Helpers
    private func makeSUT(url: URL = URL(string: "https://a-url.com")!)->(sut: RemoteFeedLoader,client : HTTPClientSpy ) {
        let client = HTTPClientSpy()
        let sut = RemoteFeedLoader(url: url, client: client)
        return (sut, client)
        
    }
    
   private class HTTPClientSpy: HTTPClient {
        
        var requestedURL : URL?
        
        func get(from url: URL) {
            requestedURL = url
        }
        
        
    }

    
    
}
