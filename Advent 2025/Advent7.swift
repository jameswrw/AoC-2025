//
//  Advent7.swift
//  Advent 2025
//
//  Created by James Weatherley on 07/12/2025.
//

struct Advent7 {
    
    let test =
    """
    .......S.......
    ...............
    .......^.......
    ...............
    ......^.^......
    ...............
    .....^.^.^.....
    ...............
    ....^.^...^....
    ...............
    ...^.^...^.^...
    ...............
    ..^...^.....^..
    ...............
    .^.^.^.^.^...^.
    ...............
    """
    
    /// Expected result: 1687
    func advent7a() {
        let lines = Utilities.readLines(input: "7a.txt")
            .map { Array($0) }
        
        var beams = Set(
            lines[0]
                .indices(of: "S")
                .ranges
                .map { lines[0].distance(from: 0, to: $0.lowerBound) }
        )
        
        var splits = 0
        for (row, line) in lines.enumerated() {
            if row == 0 { continue }
            let intersections = beams
                .intersection(
                    line.indices(of: "^")
                        .ranges
                        .map { lines[0].distance(from: 0, to: $0.lowerBound) }
                )
            
            splits += intersections.count
            for intersection in intersections {
                beams.remove(intersection)
                beams.insert(intersection - 1)
                beams.insert(intersection + 1)
            }

        }
        print("7a - Answer is: \(splits)")
    }
    
    /// Expected result: 390684413472684
    func advent7b() {
        let lines = Utilities.readLines(input: "7a.txt")
            .map { Array($0) }
        
        var totals = Array(repeating: Array(repeating: 0, count: lines[0].count), count: lines.count)
        totals[0][lines[0].distance(from: 0, to: lines[0].indices(of: "S").ranges.first!.lowerBound)] += 1
        
        for (row, line) in lines.enumerated() {
            if row == 0 { continue }
            
            for (col, char) in line.enumerated() {
                if char == "^" {
                    totals[row][col-1] += totals[row-1][col]
                    totals[row][col+1] += totals[row-1][col]
                    totals[row][col] = 0
                } else {
                    totals[row][col] += totals[row-1][col]
                }
            }
        }
        let answer = totals.last!.reduce(0, +)

        print("7b - Answer is: \(answer)")
    }
    
}
