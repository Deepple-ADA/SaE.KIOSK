//
//  hackertonTests.swift
//  hackertonTests
//
//  Created by sei on 2023/08/26.
//

import XCTest
@testable import hackerton
import WordCorrector

final class hackertonTests: XCTestCase {
    var sut: MenuCreator!

    override func setUpWithError() throws {
        let dictionary =  [
            "후레쉬 베리", "초콜릿", "소시지", "약과", "오트밀 과자", "초코파이", "스키틀즈",
            "레몬 주스", "콜라", "초코 우유", "딸기 우유", "사이다", "사과 주스", "비타민", "식혜", "핫식스", "오렌지 에이드", "게토레이",
            "레쓰비", "아메리카노", "믹스 커피",
            "왕뚜껑", "육개장", "진라면", "튀김우동"
        ]
        sut = MenuCreator(corrector: WordCorrector(wordDictionary: dictionary))
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_숫자있을때() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.

        var test = "12병"
        var a = test.firstDigitsOnly
        XCTAssertEqual(a, 12)
    }

    func test_숫자없을때_1() throws {
        let test = "열 두 병"
        let a = sut.extractDigits(from: test)
        XCTAssertEqual(a, 12)
    }

    func test_숫자없을때_2() throws {
        let test = "열두병"
        let a = sut.extractDigits(from: test)
        XCTAssertEqual(a, 12)
    }

    func test_숫자없을때_3() throws {
        let test = "삼십아홉개"
        let a = sut.extractDigits(from: test)
        XCTAssertEqual(a, 39)
    }
}
