//
//  Icons.swift
//  Battle Royale 2
//
//  Created by Kyle Schneider on 12/3/18.
//  Copyright © 2018 Kyle Schneider›‹. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit







var teamIconPath = CGMutablePath()
var teamIconNode = SKShapeNode()
var teamIconPath2 = CGMutablePath()
var teamIconNode2 = SKShapeNode()

var eventOnePath = CGMutablePath()
var eventOneNode = SKShapeNode()
var eventTwoPath = CGMutablePath()
var eventTwoNode = SKShapeNode()
var eventThreePath = CGMutablePath()
var eventThreeNode = SKShapeNode()
var eventFourPath = CGMutablePath()
var eventFourNode = SKShapeNode()

var eventOnePath2 = CGMutablePath()
var eventOneNode2 = SKShapeNode()
var eventTwoPath2 = CGMutablePath()
var eventTwoNode2 = SKShapeNode()
var eventThreePath2 = CGMutablePath()
var eventThreeNode2 = SKShapeNode()
var eventFourPath2 = CGMutablePath()
var eventFourNode2 = SKShapeNode()

var poisonGasPath = CGMutablePath()
var poisonGasNode = SKShapeNode()
var poisonGasPath2 = CGMutablePath()
var poisonGasNode2 = SKShapeNode()
var poisonGasRadius = CGFloat(876)

//var poisonGasPath2 = CGMutablePath()
//var poisonGasNode2 = SKShapeNode()

let eventRadius = CGFloat(336)

var background = SKSpriteNode()
var background2 = SKSpriteNode()

//var backgroundGasNode = SKSpriteNode(imageNamed: "backgroundImageGas")
//var backgroundGasCropNode = SKCropNode()

//var backgroundGreenPath = CGMutablePath()
//var backgroundGreenNode = SKShapeNode()

func createIcons () {
    background = SKSpriteNode(imageNamed: "backgroundImage")
    background.position = CGPoint.zero
    background.size.width = 1242
    background.size.height = 720
    background.zPosition = 0
    background.position.x = 0
    background.position.y = 0
    
    teamIconPath.addArc(center: CGPoint.zero,
                           radius: 15,
                           startAngle: 0,
                           endAngle: CGFloat.pi * 2,
                           clockwise: true)
    teamIconNode = SKShapeNode(path:    teamIconPath)
    teamIconNode.lineWidth = 0
    teamIconNode.fillColor = .red
    teamIconNode.strokeColor = .clear
    teamIconNode.zPosition = 2
    teamIconNode.position.x = 0
    teamIconNode.position.y = 0
    

    
    eventOnePath.addArc(center: CGPoint.zero,
                        radius: eventRadius,
                        startAngle: 0,
                        endAngle: CGFloat.pi * 2,
                        clockwise: true)
    eventOneNode = SKShapeNode(path:    eventOnePath)
    eventOneNode.lineWidth = 5
    eventOneNode.fillColor = .clear
    eventOneNode.strokeColor = .clear
    eventOneNode.zPosition = 1
    
    eventTwoPath.addArc(center: CGPoint.zero,
                        radius: (eventRadius/2),
                        startAngle: 0,
                        endAngle: CGFloat.pi * 2,
                        clockwise: true)
    eventTwoNode = SKShapeNode(path:    eventTwoPath)
    eventTwoNode.lineWidth = 5
    eventTwoNode.fillColor = .clear
    eventTwoNode.strokeColor = .clear
    eventTwoNode.zPosition = 1
    
    eventThreePath.addArc(center: CGPoint.zero,
                        radius: (eventRadius/4),
                        startAngle: 0,
                        endAngle: CGFloat.pi * 2,
                        clockwise: true)
    eventThreeNode = SKShapeNode(path:    eventThreePath)
    eventThreeNode.lineWidth = 5
    eventThreeNode.fillColor = .clear
    eventThreeNode.strokeColor = .clear
    eventThreeNode.zPosition = 1
    
    eventFourPath.addArc(center: CGPoint.zero,
                        radius: (eventRadius/8),
                        startAngle: 0,
                        endAngle: CGFloat.pi * 2,
                        clockwise: true)
    eventFourNode = SKShapeNode(path:    eventFourPath)
    eventFourNode.lineWidth = 5
    eventFourNode.fillColor = .clear
    eventFourNode.strokeColor = .clear
    eventFourNode.zPosition = 1
    
    

    
//    backgroundGreenPath.addArc(center: CGPoint.zero,
//                         radius: (1024),
//                         startAngle: 0,
//                         endAngle: CGFloat.pi * 2,
//                         clockwise: true)
//    backgroundGreenNode = SKShapeNode(path:    backgroundGreenPath)
//    backgroundGreenNode.lineWidth = 0
//    backgroundGreenNode.fillColor = .green
//    backgroundGreenNode.strokeColor = .green
//    backgroundGreenNode.alpha = 0.2
//    backgroundGreenNode.zPosition = 1
    
    poisonGasPath.addArc(center: CGPoint.zero,
                         radius: (poisonGasRadius),
                         startAngle: 0,
                         endAngle: CGFloat.pi * 2,
                         clockwise: true)
    poisonGasNode = SKShapeNode(path:    poisonGasPath)
    poisonGasNode.lineWidth = 0
    poisonGasNode.fillColor = .clear
    poisonGasNode.strokeColor = .green
    poisonGasNode.alpha = 0.2
    poisonGasNode.zPosition = 1
    

    
//    poisonGasPath2.addArc(center: CGPoint.zero,
//                         radius: (eventRadius + 20),
//                         startAngle: 0,
//                         endAngle: CGFloat.pi * 2,
//                         clockwise: true)
//    poisonGasNode2 = SKShapeNode(path:    poisonGasPath2)
//    poisonGasNode2.lineWidth = 0
//    poisonGasNode2.fillColor = .clear
//    poisonGasNode2.strokeColor = .green
//    poisonGasNode2.alpha = 0.2
//    poisonGasNode2.zPosition = 1
    
//    backgroundGasCropNode.position = CGPoint(x: 0, y: 0)
//    backgroundGasCropNode.zPosition = 1
//    backgroundGasCropNode.addChild(backgroundGreenNode)
//    backgroundGasCropNode.maskNode = poisonGasNode
    

}

func createIcons2() {
    
    background2 = SKSpriteNode(imageNamed: "backgroundImage")
    background2.position = CGPoint.zero
    background2.size.width = 1242
    background2.size.height = 720
    background2.zPosition = 0
    background2.position.x = 0
    background2.position.y = 0
    
    teamIconPath2.addArc(center: CGPoint.zero,
                         radius: 15,
                         startAngle: 0,
                         endAngle: CGFloat.pi * 2,
                         clockwise: true)
    teamIconNode2 = SKShapeNode(path:    teamIconPath2)
    teamIconNode2.lineWidth = 0
    teamIconNode2.fillColor = .red
    teamIconNode2.strokeColor = .clear
    teamIconNode2.zPosition = 2
    teamIconNode2.position.x = 0
    teamIconNode2.position.y = 0
    
    eventOnePath2.addArc(center: CGPoint.zero,
                         radius: eventRadius,
                         startAngle: 0,
                         endAngle: CGFloat.pi * 2,
                         clockwise: true)
    
    eventOneNode2 = SKShapeNode(path:    eventOnePath2)
    eventOneNode2.lineWidth = 5
    eventOneNode2.alpha = 1.0
    eventOneNode2.fillColor = .clear
    eventOneNode2.strokeColor = .clear
    eventOneNode2.zPosition = 1
    
    eventTwoPath2.addArc(center: CGPoint.zero,
                         radius: (eventRadius/2),
                         startAngle: 0,
                         endAngle: CGFloat.pi * 2,
                         clockwise: true)
    eventTwoNode2 = SKShapeNode(path:    eventTwoPath2)
    eventTwoNode2.lineWidth = 5
    eventTwoNode2.fillColor = .clear
    eventTwoNode2.strokeColor = .clear
    eventTwoNode2.zPosition = 1
    
    eventThreePath2.addArc(center: CGPoint.zero,
                           radius: (eventRadius/4),
                           startAngle: 0,
                           endAngle: CGFloat.pi * 2,
                           clockwise: true)
    eventThreeNode2 = SKShapeNode(path:    eventThreePath2)
    eventThreeNode2.lineWidth = 5
    eventThreeNode2.fillColor = .clear
    eventThreeNode2.strokeColor = .clear
    eventThreeNode2.zPosition = 1
    
    eventFourPath2.addArc(center: CGPoint.zero,
                          radius: (eventRadius/8),
                          startAngle: 0,
                          endAngle: CGFloat.pi * 2,
                          clockwise: true)
    eventFourNode2 = SKShapeNode(path:    eventFourPath2)
    eventFourNode2.lineWidth = 5
    eventFourNode2.fillColor = .clear
    eventFourNode2.strokeColor = .clear
    eventFourNode2.zPosition = 1
    
    poisonGasPath2.addArc(center: CGPoint.zero,
                          radius: (poisonGasRadius),
                          startAngle: 0,
                          endAngle: CGFloat.pi * 2,
                          clockwise: true)
    poisonGasNode2 = SKShapeNode(path:    poisonGasPath2)
    poisonGasNode2.lineWidth = 0
    poisonGasNode2.fillColor = .clear
    poisonGasNode2.strokeColor = .green
    poisonGasNode2.alpha = 0.2
    poisonGasNode2.zPosition = 1
}
