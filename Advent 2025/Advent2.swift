//
//  Advent2.swift
//  Advent 2025
//
//  Created by James Weatherley on 02/12/2025.
//

struct Advent2 {
    
    let test = "11-22,95-115,998-1012,1188511880-1188511890,222220-222224,1698522-1698528,446443-446449,38593856-38593862,565653-565659,824824821-824824827,2121212118-2121212124"
    
    func advent(minChunkSize: Int) {
        let idRanges = Utilities.readFile(input: "2a.txt").split(separator: ",")
        var invalidValues = [Int]()
        
        for range in idRanges {
            let limits = range.split(separator: "-")
            let first = Int(limits[0])!
            let last = Int(limits[1])!
            
            for x in first...last {
                let s = String(x)
                if s.count > 1 {
                    for len in minChunkSize...s.count / 2 {
                        if s.count.isMultiple(of: len) {
                            let chunks = s.split(by: len)
                            let invalid = chunks.allSatisfy{$0 == chunks.first!}
                            if invalid {
                                invalidValues.append(x)
                                break
                            }
                        }
                    }
                }
            }
        }
    }
    
    /// Expected result: 52316131093
    func advent2a() {
        
        let idRanges = Utilities.readFile(input: "2a.txt").split(separator: ",")
        var invalidValues = [Int]()
        
        for range in idRanges {
            let limits = range.split(separator: "-")
            let first = Int(limits[0])!
            let last = Int(limits[1])!
            
            for x in first...last {
                let s = String(x)
                if s.count.isMultiple(of: 2) && s.prefix(s.count / 2) == s.suffix(s.count / 2) {
                    invalidValues.append(x)
                }
            }
        }
        
        print("2a - Answer is: \(invalidValues.reduce(0, +))")
    }
    
    
    /// Expected result: 69564213293
    func advent2b() {
        let idRanges = Utilities.readFile(input: "2a.txt").split(separator: ",")
        var invalidValues = [Int]()
        
        for range in idRanges {
            let limits = range.split(separator: "-")
            let first = Int(String(limits[0]))!
            let last = Int(String(limits[1]))!
            
            for x in first...last {
                let s = String(x)
                if s.count > 1 {
                    for len in 1...s.count / 2 {
                        if s.count.isMultiple(of: len) {
                            let chunks = s.split(by: len)
                            let invalid = chunks.allSatisfy{$0 == chunks.first!}
                            if invalid {
                                invalidValues.append(x)
                                break
                            }
                        }
                    }
                }
            }
        }
        
        print("2b - Answer is: \(invalidValues.reduce(0, +))")
    }
    
}
