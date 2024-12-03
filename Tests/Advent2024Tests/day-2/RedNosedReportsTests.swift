//
//  Untitled.swift
//  advent-of-code
//
//  Created by Woodrow Melling on 12/2/24.
//

import Testing
@testable import Advent2024

struct RedNosedReportsTests {
    @Test
    func testExample() throws {
        let input = """
        7 6 4 2 1
        1 2 7 8 9
        9 7 6 2 1
        1 3 2 4 5
        8 6 4 4 1
        1 3 6 7 9
        1 1 1 1 1
        1 0 1 1 1
        9 6 4 3 2
        9 5 4 3 2
        1 2 3 4 19
        1 2 3 4 7
        """

        let result = try RedNosedReports.countSafeReports(from: input)

        #expect(result == 4)
    }



    @Test
    func testRealInput() throws {
        let input = try getPuzzleInput("red-nosed-reports-input")

        let result = try RedNosedReports.countSafeReports(from: input)

        #expect(result == 246)
    }

    @Test
    func exampleWithProblemDampener() throws {
        let input = """
        7 6 4 2 1
        1 2 7 8 9
        9 7 6 2 1
        1 3 2 4 5
        8 6 4 4 1
        1 3 6 7 9
        """

        let result = try RedNosedReports.countSafeReportsWithProblemDampener(from: input)

        #expect(result == 4)
    }


    @Test
    func realInputWithProblemDampener() throws {
        let input = try getPuzzleInput("red-nosed-reports-input")

        let result = try RedNosedReports.countSafeReportsWithProblemDampener(from: input)

        print("Result \(result)")
        #expect(result == 318)
    }
}
