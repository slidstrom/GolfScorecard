//
//  Golfer.swift
//  GolfScorecard
//
//  Created by Spencer Lidstrom on 6/2/22.
//

import Foundation

class Golfer{
    
    
    var name:String?
    var score:Int?
    
    
}

class Hole{
    
    var distance:Int?
    var par:Int?
    
}

class Course {
    
    var holes:[Hole]?
    var golfers:[Golfer]?
    var courseName:String?
    
    
}
