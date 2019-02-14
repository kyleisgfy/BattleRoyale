//
//  buttons.swift
//  Battle Royale 2
//
//  Created by Kyle Schneider on 1/20/19.
//  Copyright © 2019 Kyle Schneider›‹. All rights reserved.
//

import Foundation

var buttons: buttonsClass = buttonsClass()

class buttonsClass: NSObject {
    
    var editCharacter = 0
    
    var characterButtonActive = [false, false, false, false, false, false]
    var characterExists = [true, true, true, true, true, true]
    var typeListButtonActive = [false, false, false, false, false, false]
    var subListButtonActive = [false, false, false, false, false, false]
    var typeListButtonsDead = [false, false, false, false, false, false]
    var subListButtonsDead =  [[false, false, false, false, false, false],
                               [false, false, false, false, false, false],
                               [false, false, false, false, false, false],
                               [false, false, false, false, false, false],
                               [false, false, false, false, false, false],
                               [false, false, false, false, false, false], 
                               [false, false, false, false, false, false]
                               ]
}
