//
//  RemoteFeedLoaderTest.swift
//  EssentialFeedFrameworkTests
//
//  Created by Apple on 18/12/2021.
//


//Load Feed Use Cases (happy path)
//Data URL  (covered)
//1. Execute "Load Feed Items" command with above data.(covered)
//2. System downloads data from the URL.(covered)
//3. Sysem validate downloaded data.
//4. System creates feed item from valid data.
//5. Systen delivers feed items.

//Invalid data - errors course (sad path)
//1. System delivers error.

//No connectivity - error course (sad path)


import XCTest

import EssentialFeedFramework



class RemoteFeedLoaderTest: XCTestCase {
    
    
    func test_init_doesNotRequestRequestDataFromURL()  {
        
        //Arrange or Given client and sut (system under test)
        
        
       let (_, client) = makeSUT()
        
        //Act or when , so far nothing
        
        //Assert or Then, the client would have no URL
        XCTAssert(client.requestedURLs.isEmpty)
    }
    
    func test_load_requestDataFromURL() {
        
        let url = URL(string: "https://a-given-url.com")!
        //Arrange or Given client and sut (system under test)
        
        let (sut, client) = makeSUT(url: url)
        
        //Act or when we invoke sut.load()
        sut.load{ _ in }
       
        //then or Assert, then assert that a URL request was initiated in the client
        XCTAssertEqual(client.requestedURLs, [url])
    }
    func test_load_requestDataFromURLTwice() {
        
        let url = URL(string: "https://a-given-url.com")!
        //Arrange or Given client and sut (system under test)
        
        let (sut, client) = makeSUT(url: url)
        
        //Act or when we invoke sut.load()
        sut.load{ _ in }
        sut.load{ _ in }
        
        //then or Assert, then assert that a URL request was initiated in the client
        XCTAssertEqual(client.requestedURLs, [url, url])
        
    }
    func test_load_deliversErrorsOnClientError()  {
        let (sut, client) = makeSUT()
        
        var capturedError = [RemoteFeedLoader.Error]()
        sut.load {
            capturedError.append($0)
        }
        
       let clientError = NSError(domain: "Test", code: 0)
        
        client.complete(with: clientError)
        
        XCTAssertEqual(capturedError, [.connectivity])
        
    }
    func test_load_deliversErrorsOnNon200HTTPResponse()  {
        let (sut, client) = makeSUT()
        
        
        let samples = [199,201,300,400,500]
        
        samples.enumerated().forEach{
            index, code in
            
            var capturedError = [RemoteFeedLoader.Error]()
            sut.load {
                capturedError.append($0)
            }
            
            client.complete(withStatusCode: code, at: index)
            
            XCTAssertEqual(capturedError, [.invalidData])
            
        }
    
    }
    
    
    //MARK:  Helpers
    private func makeSUT(url: URL = URL(string: "https://a-url.com")!)->(sut: RemoteFeedLoader,client : HTTPClientSpy ) {
        let client = HTTPClientSpy()
        let sut = RemoteFeedLoader(url: url, client: client)
        return (sut, client)
    }
    
    private class HTTPClientSpy: HTTPClient {
        
        private var messages = [(url: URL, completion: (HTTPClientResult)-> Void)]()
        
        var requestedURLs : [URL] {
            return messages.map { $0.url }
        }
        
        func get(from url: URL, completion: @escaping (HTTPClientResult) -> Void) {
            
            messages.append((url, completion))
        }
        func complete(with error: Error, at index: Int = 0)  {
            messages[index].completion(.failure(error))
        }
        func complete(withStatusCode code: Int, at index: Int = 0)  {
            
            let response = HTTPURLResponse(url: requestedURLs[index],
                statusCode: code,
                httpVersion: nil,
                headerFields: nil)!
            
            messages[index].completion(.success(response))
        }
    }
    
    

    
    
}
