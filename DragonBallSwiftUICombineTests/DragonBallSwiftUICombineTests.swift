//
//  DragonBallSwiftUICombineTests.swift
//  DragonBallSwiftUICombineTests
//
//  Created by Roberto Rojo Sahuquillo on 12/11/22.
//

import SwiftUI
import Combine
import ViewInspector

@testable import DragonBallSwiftUICombine

import XCTest

//View to test
extension LoginView: Inspectable{}


final class DragonBallSwiftUICombineTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLoginView() throws {
       XCTAssertEqual("1", "1")
    }

   

}
