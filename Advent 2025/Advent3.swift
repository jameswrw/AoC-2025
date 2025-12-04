//
//  Advent3.swift
//  Advent 2025
//
//  Created by James Weatherley on 03/12/2025.
//

import Foundation


struct Advent3 {
    
    let test =
    """
    987654321111111
    811111111111119
    234234234234278
    818181911112111
    """
    
    // MARK: Core
    func advent(batteries: Int) -> Int {
        let banks = Utilities.readLines(input: "3a.txt")
            .map { Array($0) }
        
        var selections = [String]()
        
        for bank in banks {
            var start = 0
            var selection = ""
            var mutableBatteries = batteries

            while mutableBatteries > 0 {
                let end = bank.count - (mutableBatteries - 1)
                let slice = bank[start..<end]
                let battery = slice.sorted().last!
                selection.append(battery)
                start = slice.firstIndex(of: battery)! + 1
                mutableBatteries -= 1
            }
            selections.append(selection)
        }
        
        return selections
            .compactMap { Int($0) }
            .reduce(0, +)
    }

    // MARK: Wrappers
    /// Expected answer: 17445
    func advent3a() {
        print("3a - Answer is: \(advent(batteries: 2))")
    }
    
    
    /// Expected answer: 173229689350551
    func advent3b() {
        print("3b - Answer is: \(advent(batteries: 12))")
    }
    
}
