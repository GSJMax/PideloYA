//
//  MLApiServiceTest.swift
//  pideloyaTests
//
//  Created by GSJ on 16/06/23.
//

import XCTest
@testable import pideloya

class MLApiServiceTest: XCTestCase {

    var sut : MLApiService!
    
    override func setUpWithError() throws {
        sut = MLApiService()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_getSanitizedString()  {
        
        let userInputString = "test string %"
        let expectedSanitizedString = "test%20string"
        let result = sut.getSanitizedString(query:userInputString)
        print(result)
        XCTAssertTrue(result == expectedSanitizedString)

    }
}
