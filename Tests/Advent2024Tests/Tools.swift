//
//  Tools.swift
//  advent-of-code
//
//  Created by Woodrow Melling on 12/1/24.
//

import Foundation

struct PuzzleInputError: Error {
    var description: String
}
func getPuzzleInput(
    _ fileName: String,
    withExtension fileExtension: String = "txt"
) throws -> String {
    guard let fileURL = Bundle.module.url(
        forResource: fileName,
        withExtension: fileExtension
    ) else {
        throw PuzzleInputError(description: "Cannot find file named \(fileName).\(fileExtension)")
    }

    return try String(contentsOf: fileURL, encoding: .utf8)
}
