//
//  Advent5.swift
//  Advent 2025
//
//  Created by James Weatherley on 05/12/2025.
//

struct Advent5 {
    
    let test =
    """
    3-5
    10-14
    16-20
    12-18

    1
    5
    8
    11
    17
    32
    """
    
    /// Expected result: 874
    func advent5a() {
        var freshIDs = RangeSet<Int>()
        var ingredientIDs = [Int]()
        let lines = Utilities.readLines(input: "5a.txt")

        for line in lines {
            if line.contains("-") {
                let range = line.split(separator: "-")
                freshIDs.insert(contentsOf: Int(range[0])!..<Int(range[1])! + 1)
            } else if let id = Int(line) {
                ingredientIDs.append(id)
            }
        }
        
        let count = ingredientIDs.reduce(0) { result, id in
            result + (freshIDs.contains(id) ? 1 : 0)
        }
        
        print("5a - Answer is: \(count)")
    }
    
    /// Expected result: 348548952146313
    func advent5b() {
        var freshIDs = RangeSet<Int>()
        let lines = Utilities.readLines(input: "5a.txt")

        for line in lines {
            if line.contains("-") {
                let range = line.split(separator: "-")
                freshIDs.insert(contentsOf: Int(range[0])!..<Int(range[1])! + 1)
            } else {
                break
            }
        }
        
        let count = freshIDs.ranges
            .map(\.count)
            .reduce(0, +)
        
        print("5b - Answer is: \(count)")
    }
}
