//
//  Utilties.swift
//  advent-of-code
//
//  Created by Woodrow Melling on 12/2/24.
//

extension Collection {
    public subscript(safe index: Index) -> Element? {
        self.indices.contains(index) ? self[index] : nil
    }

    public var hasElements: Bool {
        !isEmpty
    }
}
