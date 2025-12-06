//
//  Advent6.swift
//  Advent 2025
//
//  Created by James Weatherley on 06/12/2025.
//

import Foundation

struct Advent6 {
    
    let test =
    """
    123 328  51 64 
     45 64  387 23 
      6 98  215 314
    *   +   *   +
    """
    
    
    /// Expected result: 4309240495780
    func advent6a() {
        let answer = Utilities.readLines(input: "6a.txt")
            .map { $0.split(separator: " ") }
            .transposed()
            .map { col in
                var problem = [[String]]()
                problem.append(col[0..<col.count - 1].map { String($0) })
                problem.append(Array(arrayLiteral: String(col.last!)))
                
                switch problem[1].first {
                case "+":
                    return problem[0].compactMap { Int($0) }.reduce(0, +)
                case "*":
                    return problem[0].compactMap { Int($0) }.reduce(1, *)
                default:
                    fatalError("Unknown operator: \(problem[1])")
                }
            }
            .reduce(0, +)
        
        print("6a - Answer is: \(answer)")
    }
    
    /// Expected result: 9170286552289
    func advent6b() {
        
        let rows: [[Character]] = Utilities.readLines(input: "6a.txt")
            .map { Array(String($0)) }
        
        let emptyColumns = rows
            .map { string in
                let row = Array(string)
                return Set(row.indices.filter { row[$0] == " " }.map { Int($0) })
            }
        
        let totallyEmptyColumns = emptyColumns
            .reduce(emptyColumns.first!) { $0.intersection($1) }
                
        let cols = rows
            .map { row in
                var mangledRow = [Character]()
                let _ = row.indices.map { index in
                    if row[index] == " " && !totallyEmptyColumns.contains(index) && row != rows.last! {
                        mangledRow.append("?")
                    } else {
                        mangledRow.append(row[index])
                    }
                }
                return String(mangledRow)
                    .split(separator: " ")
            }
            .transposed()
            .map { col in
                var intermediateData = [[String]]()
                intermediateData.append(col[0..<col.count - 1].map { String($0) })
                intermediateData.append(Array(arrayLiteral: String(col.last!)))
                return intermediateData
            }
        
        let problems = cols
            .map { col in
                let argCount = col[0].count
                let numSize = col[0].first!.count
                
                var verticalValues = [String]()
                for i in 0..<numSize {
                    var verticalValue = ""
                    for j in 0..<argCount {
                        verticalValue.append(Array(col[0][j])[i])
                    }
                    verticalValues.append(verticalValue)
                }
                
                verticalValues = verticalValues.map { $0.replacingOccurrences(of: "?", with: "")}
                return [verticalValues, col[1]]
            }
            .map { problem in
                switch problem[1].first {
                case "+":
                    return problem[0].compactMap { Int($0) }.reduce(0, +)
                case "*":
                    return problem[0].compactMap { Int($0) }.reduce(1, *)
                default:
                    fatalError("Unknown operator: \(problem[1])")
                }
            }
            .reduce(0, +)
        
        print("6b - Answer is: \(problems)")
    }
    
}
