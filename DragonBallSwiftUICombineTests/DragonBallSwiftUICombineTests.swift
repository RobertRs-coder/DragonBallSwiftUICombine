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
    
    //Testing views
    func testViews() throws {
        let rootViewModel = RootViewModel()
       let view = LoginView()
            .environmentObject(rootViewModel)
        
        let numItems = try view.inspect().count
        XCTAssertEqual(numItems, 1)  //one root view
        
        //Image
        let image = try view.inspect().find(viewWithId: 1)
        XCTAssertNotNil(image)
        
        //Text
        let text = try view.inspect().find(viewWithId: 3)
        XCTAssertNotNil(text)
        let textString = try text.text().string()
        XCTAssertEqual(textString, "Login")
        
        //Button
        let button = try view.inspect().find(viewWithId: 2)
        XCTAssertNotNil(button)
        try button.button().tap() //Execute button
        
        //
        XCTAssertEqual(rootViewModel.tokenJWT, "")
    }

   

}
