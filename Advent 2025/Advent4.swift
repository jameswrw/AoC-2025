//
//  Advent4.swift
//  Advent 2025
//
//  Created by James Weatherley on 04/12/2025.
//

class Advent4 {
    
    let test =
    """
    ..@@.@@@@.
    @@@.@.@.@@
    @@@@@.@.@@
    @.@@@@..@.
    @@.@@@@.@@
    .@@@@@@@.@
    .@.@.@.@@@
    @.@@@.@@@@
    .@@@@@@@@.
    @.@.@@@.@.
    """
    
    var grid: [[Character]]
    
    init() {
        grid = Utilities.readFile(input: "4a.txt")
            .split(separator: "\n")
            .map { Array($0) }
    }
     // MARK: Helper functions
    func markAccessibleItems() {
        for (i, row) in grid.enumerated() {
            for (j, _) in row.enumerated() {
                adjacentItems(row: i, col: j)
            }
        }
    }
    
    func removeAccessibleItems() {
        for (i, row) in grid.enumerated() {
            for (j, _) in row.enumerated() {
                if grid[i][j] == "x" {
                    grid[i][j] = "."
                }
            }
        }
    }
    
    func adjacentItems(row: Int, col:Int) {
        var items = [Character?]()
        
        if item(row: row, col: col) == "@" {
            items.append(item(row: row-1, col: col-1))
            items.append(item(row: row-1, col: col))
            items.append(item(row: row-1, col: col+1))
            
            items.append(item(row: row, col: col-1))
            items.append(item(row: row, col: col+1))
            
            items.append(item(row: row+1, col: col-1))
            items.append(item(row: row+1, col: col))
            items.append(item(row: row+1, col: col+1))
            
            if items
                .filter({$0 == "@" || $0 == "x"}).count < 4 {
                grid[row][col] = "x"
            }
        }
    }
    
    func item(row: Int, col:Int) -> Character? {
        var item: Character? = nil
        if row >= 0, row < grid.count, col >= 0, col < grid[row].count {
            item = grid[row][col]
        }
        return item
    }
    
    // MARK: Solutions
    /// Expected answer: 1467
    func advent4a() {
        
        markAccessibleItems()
        
        let accessibleRolls = grid.flatMap {$0}
            .filter { $0 == "x" }
            .count
        
        print("4a - Answer is: \(accessibleRolls)")
    }
    
    /// Expected answer:
    func advent4b() {
        
        var accessibleRolls = 0
        
        while true {
            markAccessibleItems()
            let newAccessibleRolls = grid.flatMap {$0}
                .filter { $0 == "x" }
                .count
            if newAccessibleRolls == 0 { break }
            removeAccessibleItems()
            accessibleRolls += newAccessibleRolls
        }
        
        print("4b - Answer is: \(accessibleRolls)")
    }
    
}
