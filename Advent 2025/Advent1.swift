//
//  Advent1.swift
//  Advent 2025
//
//  Created by James Weatherley on 01/12/2025.
//


struct Advent1 {
    
    /// Expected result: 1118
    func advent1a() {
        let input = Utilities.readLines(input: "1a.txt")
        
        var code = 0
        var position = 50
        
        for rotation in input {
            var value = String(rotation)
            let prefix = value.removeFirst()
            let numericValue = Int(value)!
            
            if prefix == "R" {
                position += numericValue
            } else {
                position -= numericValue
            }
            
            position %= 100
            if position < 0 { position += 100 }
            if position == 0 { code += 1 }
        }
        print("1a - Answer is: \(code)")
    }
    
    /// Expected result: 6289
    func advent1b() {
        let input = Utilities.readLines(input: "1a.txt")
        
        var zeroPassed = 0
        var position = 50
        
        for rotation in input {
            var value = String(rotation)
            let prefix = value.removeFirst()
            let numericValue = Int(value)!
            
            zeroPassed += numericValue / 100
            let lastPosition = position
            
            if prefix == "R" {
                position += numericValue
            } else {
                position -= numericValue
            }
            
            position %= 100
            if position < 0 { position += 100 }
            
            if prefix == "R" {
                if position < lastPosition {
                    zeroPassed += 1
                }
            } else {
                if position == 0 || (lastPosition != 0 && position > lastPosition) {
                    zeroPassed += 1
                }
            }
        }
        print("1b - Answer is: \(zeroPassed)")
    }
    
}
