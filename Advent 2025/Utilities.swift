//
//  Utilities.swift
//  Advent 2025
//
//  Created by James Weatherley on 01/12/2025.
//

import Foundation

struct Utilities {
    static let resourceDirectory = FileManager
        .default
        .homeDirectoryForCurrentUser
        .appending(component: "Documents/Code/Advent 2025/Inputs/")
    
    static func readFile(input: String) -> String {
        let data = FileManager.default.contents(atPath: Utilities.resourceDirectory.appending(components: input).path)!
        return String(data: data, encoding: .utf8)!
    }
    
    static func readLines(input: String) -> [String.SubSequence] {
        readFile(input: input).split(separator: "\n")
    }
}

extension String {
    func split(by length: Int) -> [Substring] {
        var startIndex = self.startIndex
        var results = [Substring]()
        results.reserveCapacity(self.count / length)
        
        while startIndex < self.endIndex {
            let endIndex = self.index(startIndex, offsetBy: length, limitedBy: self.endIndex) ?? self.endIndex
            results.append(self[startIndex..<endIndex])
            startIndex = endIndex
        }
        return results
    }
}

extension Collection where Self.Iterator.Element: RandomAccessCollection {
    // PRECONDITION: `self` must be rectangular, i.e. every row has equal size.
    func transposed() -> [[Self.Iterator.Element.Iterator.Element]] {
        guard let firstRow = self.first else { return [] }
        return firstRow.indices.map { index in
            self.map{ $0[index] }
        }
    }
}

