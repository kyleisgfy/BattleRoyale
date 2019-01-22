//
//  Timer.swift
//  Battle Royale 2
//
//  Created by Kyle Schneider on 12/3/18.
//  Copyright © 2018 Kyle Schneider›‹. All rights reserved.
//

import Foundation

var time: Time = Time ()

class Time: NSObject {
    
    var gameTimer = Timer()
    var restrictionTimer = Timer()
    
    var phaseTimer = Timer()
    
    var phaseTimerInSeconds = 15
    
    var gameTimeInSeconds  = 0
    var restrictionTimeInSeconds = 5
    var restrictionTimeInSecondsSetup = 5
    var restrictionTimeString = ""
    var restrictionLabelString = ""

}







