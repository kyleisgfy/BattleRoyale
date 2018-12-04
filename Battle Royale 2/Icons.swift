//
//  Icons.swift
//  Battle Royale 2
//
//  Created by Kyle Schneider on 12/3/18.
//  Copyright © 2018 Kyle Schneider›‹. All rights reserved.
//

import Foundation
import SpriteKit


var broadcastLineOneLabel:SKLabelNode = SKLabelNode()
var broadcastLineTwoLabel:SKLabelNode = SKLabelNode()
var broadcastLineThreeLabel:SKLabelNode = SKLabelNode()
var broadcastLineFourLabel:SKLabelNode = SKLabelNode()
var broadcastLineFiveLabel:SKLabelNode = SKLabelNode()




var teamIconPath = CGMutablePath()
var teamIconNode = SKShapeNode()

var nextEventPath = CGMutablePath()
var nextEventNode = SKShapeNode()

var currentEventPath = CGMutablePath()
var currentEventNode = SKShapeNode()


func createIcons () {
    teamIconPath.addArc(center: CGPoint.zero,
                           radius: 100,
                           startAngle: 0,
                           endAngle: CGFloat.pi * 2,
                           clockwise: true)
    teamIconNode = SKShapeNode(path:    teamIconPath)
    teamIconNode.lineWidth = 0
    teamIconNode.fillColor = .red
    teamIconNode.strokeColor = .clear
    
    nextEventPath.addArc(center: CGPoint.zero,
                        radius: 336,
                        startAngle: 0,
                        endAngle: CGFloat.pi * 2,
                        clockwise: true)
    nextEventNode = SKShapeNode(path:    nextEventPath)
    nextEventNode.lineWidth = 10
    nextEventNode.fillColor = .clear
    nextEventNode.strokeColor = .blue
    
    currentEventPath.addArc(center: CGPoint.zero,
                        radius: 336,
                        startAngle: 0,
                        endAngle: CGFloat.pi * 2,
                        clockwise: true)
    currentEventNode = SKShapeNode(path:    currentEventPath)
    currentEventNode.lineWidth = 0
    currentEventNode.fillColor = .clear
    currentEventNode.strokeColor = .clear
    

}
