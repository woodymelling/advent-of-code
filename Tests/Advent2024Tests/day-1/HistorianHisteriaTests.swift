//
//  Day1.swift
//  advent-of-code
//
//  Created by Woodrow Melling on 12/1/24.
//

@testable import Advent2024
import Testing
import Foundation

struct HistorianHisteriaTests {
    @Test
    func distanceExample() throws {
        let exampleText = """
        3   4
        4   3
        2   5
        1   3
        3   9
        3   3

        """
        let result = try HistorianHisteria.computeTotalDistance(from: exampleText)
        #expect(result == 11)
    }

    @Test
    func distanceRealInput() throws {
        let text = try getPuzzleInput("historian-histeria-input")

        let result = try HistorianHisteria.computeTotalDistance(from: text)

        #expect(result == 1151792)
    }

    @Test
    func similarityExample() throws {
        let exampleText = """
        3   4
        4   3
        2   5
        1   3
        3   9
        3   3

        """

        let result = try HistorianHisteria.computeSimilarityScore(from: exampleText)

        #expect(result == 31)
    }

    @Test
    func similarityRealInput() throws {
        let text = try getPuzzleInput("historian-histeria-input")

        let result = try HistorianHisteria.computeSimilarityScore(from: text)

        #expect(result == 21790168)
    }
}



