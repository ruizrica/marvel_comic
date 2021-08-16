//
//  marvel_comicTests.swift
//  marvel-comicTests
//
//  Created by Ricardo Ruiz on 8/15/21.
//

import XCTest
@testable import marvel_comic

class marvel_comicTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testAPIKeys() throws {
        
        // Helper Function
        func infoForKey(_ key: String) -> String? {
                return (Bundle.main.infoDictionary?[key] as? String)?
                    .replacingOccurrences(of: "\\", with: "")
         }
        
        let publicKey = infoForKey("kAPI_PublicKey");
        let privateKey = infoForKey("kAPI_PrivateKey");
        XCTAssertTrue(publicKey!.count > 0)
        XCTAssertTrue(privateKey!.count > 0)
    }
    
    func testAPIConntection() throws {
        
        // Block From Objetive-C
        API.loadComic { comic in
            let comicbook = comic as NSDictionary
            XCTAssertTrue(comicbook.count > 0)
        }
    }
}
