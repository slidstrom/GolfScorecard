//
//  Golfer.swift
//  GolfScorecard
//
//  Created by Spencer Lidstrom on 6/2/22.
//

import Foundation

class Golfer{
    
    
    var name:String?
    var score:Int = 0
    
    
}

class Hole{
    
    var distance:Int = 0
    var par:Int = 0
    
}

class Course {
    
    var holes:[Hole] = [Hole]()
    var golfers:[Golfer]?
    var courseName:String?
    var currentHole = 0
    var totalPar = 0
    var totalDistance = 0
    
    
}
