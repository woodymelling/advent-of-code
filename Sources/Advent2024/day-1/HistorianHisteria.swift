//
//  HistorianHisteria.swift
//  advent-of-code
//
//  Created by Woodrow Melling on 12/1/24.
//

/**

 */

import Parsing

enum HistorianHisteria {

    struct ListParser: Parser {
        var body: some Parser<Substring, [(Int, Int)]> {
            Many {
                Int.parser()
                Whitespace()
                Int.parser()
            } separator: {
                Whitespace(1, .vertical)
            } terminator: {
                Whitespace(1, .vertical)
            }

        }
    }

    static func computeTotalDistance(from text: String) throws -> Int {
        let list = try ListParser().parse(text)

        // Sort the lists so we can compare the smallest number with smallest number
        let leftList = list.map(\.0).sorted()
        let rightList = list.map(\.1).sorted()

        // get all the distances
        let sums = zip(leftList, rightList).map { abs($0.0 - $0.1) }


        return sums.reduce(0, +)
    }

    static func computeSimilarityScore(from text: String) throws -> Int {
        let list = try ListParser().parse(text)

        let leftList = list.map(\.0)
        let rightList = list.map(\.1)

        let counts: [Int: Int] = rightList.reduce(into: [:]) { partialResult, number in
            partialResult[number, default: 0] += 1
        }

        return leftList.reduce(into: 0) { partialResult, number in
            partialResult += (counts[number] ?? 0) * number
        }
    }
}
