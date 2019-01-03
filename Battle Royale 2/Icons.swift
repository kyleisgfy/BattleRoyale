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

var eventOnePath = CGMutablePath()
var eventOneNode = SKShapeNode()
var eventTwoPath = CGMutablePath()
var eventTwoNode = SKShapeNode()
var eventThreePath = CGMutablePath()
var eventThreeNode = SKShapeNode()
var eventFourPath = CGMutablePath()
var eventFourNode = SKShapeNode()

var poisonGasPath = CGMutablePath()
var poisonGasNode = SKShapeNode()
var poisonGasRadius = CGFloat(876)

var poisonGasPath2 = CGMutablePath()
var poisonGasNode2 = SKShapeNode()

let eventRadius = CGFloat(336)

var background = SKSpriteNode()
var backgroundGasNode = SKSpriteNode(imageNamed: "backgroundImageGas")
var backgroundGasCropNode = SKCropNode()

var backgroundGreenPath = CGMutablePath()
var backgroundGreenNode = SKShapeNode()

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
    eventOneNode.lineWidth = 10
    eventOneNode.fillColor = .clear
    eventOneNode.strokeColor = .clear
    eventOneNode.zPosition = 1
    
    eventTwoPath.addArc(center: CGPoint.zero,
                        radius: (eventRadius/2),
                        startAngle: 0,
                        endAngle: CGFloat.pi * 2,
                        clockwise: true)
    eventTwoNode = SKShapeNode(path:    eventTwoPath)
    eventTwoNode.lineWidth = 10
    eventTwoNode.fillColor = .clear
    eventTwoNode.strokeColor = .clear
    eventTwoNode.zPosition = 1
    
    eventThreePath.addArc(center: CGPoint.zero,
                        radius: (eventRadius/4),
                        startAngle: 0,
                        endAngle: CGFloat.pi * 2,
                        clockwise: true)
    eventThreeNode = SKShapeNode(path:    eventThreePath)
    eventThreeNode.lineWidth = 10
    eventThreeNode.fillColor = .clear
    eventThreeNode.strokeColor = .clear
    eventThreeNode.zPosition = 1
    
    eventFourPath.addArc(center: CGPoint.zero,
                        radius: (eventRadius/6),
                        startAngle: 0,
                        endAngle: CGFloat.pi * 2,
                        clockwise: true)
    eventFourNode = SKShapeNode(path:    eventFourPath)
    eventFourNode.lineWidth = 10
    eventFourNode.fillColor = .clear
    eventFourNode.strokeColor = .clear
    eventFourNode.zPosition = 1
    
    backgroundGreenPath.addArc(center: CGPoint.zero,
                         radius: (1024),
                         startAngle: 0,
                         endAngle: CGFloat.pi * 2,
                         clockwise: true)
    backgroundGreenNode = SKShapeNode(path:    backgroundGreenPath)
    backgroundGreenNode.lineWidth = 0
    backgroundGreenNode.fillColor = .green
    backgroundGreenNode.strokeColor = .green
    backgroundGreenNode.alpha = 0.2
    backgroundGreenNode.zPosition = 1
    
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
    
    poisonGasPath2.addArc(center: CGPoint.zero,
                         radius: (eventRadius + 20),
                         startAngle: 0,
                         endAngle: CGFloat.pi * 2,
                         clockwise: true)
    poisonGasNode2 = SKShapeNode(path:    poisonGasPath2)
    poisonGasNode2.lineWidth = 0
    poisonGasNode2.fillColor = .clear
    poisonGasNode2.strokeColor = .green
    poisonGasNode2.alpha = 0.2
    poisonGasNode2.zPosition = 1
    
//    backgroundGasCropNode.position = CGPoint(x: 0, y: 0)
//    backgroundGasCropNode.zPosition = 1
//    backgroundGasCropNode.addChild(backgroundGreenNode)
//    backgroundGasCropNode.maskNode = poisonGasNode
    

}
