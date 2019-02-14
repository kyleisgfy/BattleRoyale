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

var clickZone = CGMutablePath()
var clickZoneNode = SKShapeNode()

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

let barHeight = 5
let barWidth = 35
let barY = CGFloat(340)

let eventBoarder = SKShapeNode(rectOf: CGSize(width: (2), height: (barHeight + 10)))
let eventBarZero = SKShapeNode(rectOf: CGSize(width: (barWidth * 3), height: barHeight))
let eventBarOne = SKShapeNode(rectOf: CGSize(width: (barWidth * 3), height: barHeight))
let eventBarTwo = SKShapeNode(rectOf: CGSize(width: (barWidth * 1), height: barHeight))
let eventBarThree = SKShapeNode(rectOf: CGSize(width: (barWidth * 2), height: barHeight))
let eventBarFour = SKShapeNode(rectOf: CGSize(width: (barWidth * 3), height: barHeight))
let eventBarFive = SKShapeNode(rectOf: CGSize(width: (barWidth * 1), height: barHeight))
let eventBarSix = SKShapeNode(rectOf: CGSize(width: (barWidth * 2), height: barHeight))
let eventBarSeven = SKShapeNode(rectOf: CGSize(width: (barWidth * 3), height: barHeight))
let eventBarEight = SKShapeNode(rectOf: CGSize(width: (barWidth * 1), height: barHeight))
let eventBarNine = SKShapeNode(rectOf: CGSize(width: (barWidth * 2), height: barHeight))
let eventBarTen = SKShapeNode(rectOf: CGSize(width: (barWidth * 3), height: barHeight))
let eventBarEleven = SKShapeNode(rectOf: CGSize(width: (barWidth * 1), height: barHeight))
let eventBarTwelve = SKShapeNode(rectOf: CGSize(width: (barWidth * 2), height: barHeight))

var characterButtons = [SKSpriteNode?](repeating: nil, count: 6)
var typeButtons = [SKSpriteNode?](repeating: nil, count: 6)
var subListButtons = [SKSpriteNode?](repeating: nil, count: 6)

var createPlayerButton = SKShapeNode(rectOf: CGSize(width: 200, height: 50))

var safeZone = SKSpriteNode()
var safeZone2 = SKSpriteNode()

let eventRadius = CGFloat(359)

var splashBackground = SKSpriteNode()
var splashLogo = SKSpriteNode()
var splashText = SKSpriteNode()

var background = SKSpriteNode()
var background2 = SKSpriteNode()

let cropImage = SKSpriteNode(imageNamed: "backgroundImage")
let cropNode = SKCropNode()

let cropImage2 = SKSpriteNode(imageNamed: "backgroundImage")
let cropNode2 = SKCropNode()

let textBackgroundNode = SKSpriteNode()
var textBackgroundBorderNode = SKSpriteNode()
let textNodeTab = SKSpriteNode()
var textNodeTabBorder = SKSpriteNode()
let buttonLabelBackgroundSize = CGSize(width: 210, height: 420)
var textTabOpen = true

func createCharacterButtons() {
    var i = 0
    var yLocation = 300
    while i < 6 {
        characterButtons[i] = SKSpriteNode()
        characterButtons[i]!.color = .gray
        characterButtons[i]!.alpha = 0.5
        characterButtons[i]!.zPosition = 4
        characterButtons[i]!.size.width = 20
        characterButtons[i]!.size.height = 20
        characterButtons[i]!.position = CGPoint(x:-600 , y: yLocation)
        yLocation -= 30
        i += 1
    }
}
    
func createTypeButtons() {
    var i = 0
    var yLocation = 80
    while i < 6 {
        typeButtons[i] = SKSpriteNode()
        typeButtons[i]!.color = .gray
        typeButtons[i]!.alpha = 0.5
        typeButtons[i]!.zPosition = 4
        typeButtons[i]!.size.width = 20
        typeButtons[i]!.size.height = 20
        typeButtons[i]!.position = CGPoint(x:-600 , y: yLocation)
        yLocation -= 30
        i += 1
    }
}
    
func createSubListButtons() {
    var i = 0
    var yLocation = -120
    while i < 6 {
        subListButtons[i] = SKSpriteNode()
        subListButtons[i]!.color = .gray
        subListButtons[i]!.alpha = 0.0
        subListButtons[i]!.zPosition = 4
        subListButtons[i]!.size.width = 20
        subListButtons[i]!.size.height = 20
        subListButtons[i]!.position = CGPoint(x:-600 , y: yLocation)
        yLocation -= 30
        i += 1
    }
}

func setTextBackground() {
    textBackgroundNode.size = buttonLabelBackgroundSize
    textBackgroundNode.alpha = 0.3
    textBackgroundNode.zPosition = 3
    textBackgroundNode.color = .white
    textBackgroundNode.position = CGPoint(x: -516, y: 115)
    
    textNodeTab.size = CGSize(width: 30, height: 100)
    textNodeTab.alpha = 0.3
    textNodeTab.zPosition = 3
    textNodeTab.color = .white
    textNodeTab.position = CGPoint(x: -396,y: 235)
    
    textBackgroundBorderNode.size.width = textBackgroundNode.size.width + 5
    textBackgroundBorderNode.size.height = textBackgroundNode.size.height + 10
    textBackgroundBorderNode.position.y = textBackgroundNode.position.y
    textBackgroundBorderNode.position.x = textBackgroundNode.position.x + 2.5
    textBackgroundBorderNode.color = .black
    textBackgroundBorderNode.alpha = 0.9
    textBackgroundBorderNode.zPosition = 3
    
    textNodeTabBorder.size.width = textNodeTab.size.width + 5
    textNodeTabBorder.size.height = textNodeTab.size.height + 10
    textNodeTabBorder.position.y = textNodeTab.position.y
    textNodeTabBorder.position.x = textNodeTab.position.x + 2.5
    textNodeTabBorder.color = .black
    textNodeTabBorder.alpha = 0.9
    textNodeTabBorder.zPosition = 3
    
}

func createIcons() {
    createCharacterButtons()
    createTypeButtons()
    createSubListButtons()
    
    cropNode.addChild(cropImage)
    cropNode.position = CGPoint(x: 0, y: 0)
    cropNode.zPosition = 2
    
    cropImage.size.width = 1242
    cropImage.size.height = 720
    
    safeZone = SKSpriteNode(imageNamed: "safeZone")
    safeZone.size.width = 1436
    safeZone.size.height = 1436
    safeZone.zPosition = 2
    
    cropNode.maskNode = safeZone
    
    background = SKSpriteNode(imageNamed: "backgroundImage")
    background.position = CGPoint.zero
    background.size.width = 1242
    background.size.height = 720
    background.zPosition = 0
    background.position.x = 0
    background.position.y = 0
    
    teamIconPath.addArc(center: CGPoint.zero,
                           radius: 12,
                           startAngle: 0,
                           endAngle: CGFloat.pi * 2,
                           clockwise: true)
    teamIconNode = SKShapeNode(path:    teamIconPath)
    teamIconNode.lineWidth = 0
    teamIconNode.fillColor = .red
    teamIconNode.strokeColor = .clear
    teamIconNode.zPosition = 4
    teamIconNode.position.x = 0.7
    teamIconNode.position.y = -0.7
    
    clickZone.addArc(center: CGPoint.zero,
                        radius: eventRadius,
                        startAngle: 0,
                        endAngle: CGFloat.pi * 2,
                        clockwise: true)
    clickZoneNode = SKShapeNode(path:    clickZone)
    clickZoneNode.lineWidth = 5
    clickZoneNode.fillColor = .clear
    clickZoneNode.strokeColor = .clear
    clickZoneNode.zPosition = 1
    
    eventOnePath.addArc(center: CGPoint.zero,
                        radius: eventRadius,
                        startAngle: 0,
                        endAngle: CGFloat.pi * 2,
                        clockwise: true)
    eventOneNode = SKShapeNode(path:    eventOnePath)
    eventOneNode.lineWidth = 3
    eventOneNode.fillColor = .clear
    eventOneNode.strokeColor = .clear
    eventOneNode.zPosition = 4
    
    eventTwoPath.addArc(center: CGPoint.zero,
                        radius: (eventRadius/2),
                        startAngle: 0,
                        endAngle: CGFloat.pi * 2,
                        clockwise: true)
    eventTwoNode = SKShapeNode(path:    eventTwoPath)
    eventTwoNode.lineWidth = 3
    eventTwoNode.fillColor = .clear
    eventTwoNode.strokeColor = .clear
    eventTwoNode.zPosition = 4
    
    eventThreePath.addArc(center: CGPoint.zero,
                        radius: (eventRadius/4),
                        startAngle: 0,
                        endAngle: CGFloat.pi * 2,
                        clockwise: true)
    eventThreeNode = SKShapeNode(path:    eventThreePath)
    eventThreeNode.lineWidth = 3
    eventThreeNode.fillColor = .clear
    eventThreeNode.strokeColor = .clear
    eventThreeNode.zPosition = 4
    
    eventFourPath.addArc(center: CGPoint.zero,
                        radius: (eventRadius/8),
                        startAngle: 0,
                        endAngle: CGFloat.pi * 2,
                        clockwise: true)
    eventFourNode = SKShapeNode(path:    eventFourPath)
    eventFourNode.lineWidth = 3
    eventFourNode.fillColor = .clear
    eventFourNode.strokeColor = .clear
    eventFourNode.zPosition = 4
    
    let totalBarLength = (barWidth * 27)
    let firstEvent = CGFloat((barWidth) * 3)
    let singleEvent = CGFloat((barWidth) * 2)
    let doubleEvent = CGFloat((barWidth) * 3 / 2)
    let trippleEvent = CGFloat((barWidth) * 5 / 2)
    
    eventBoarder.fillColor = .black
    eventBoarder.strokeColor = .black
    eventBoarder.zPosition = 4
    eventBoarder.position = CGPoint(x: 0 - (totalBarLength / 2) , y: Int(barY))
    
    eventBarZero.fillColor = .white
    eventBarZero.zPosition = 3
    eventBarZero.position = CGPoint(x:(CGFloat(0 - (totalBarLength / 2)) + CGFloat(barWidth * 3 / 2)) , y: barY)
    
    eventBarOne.fillColor = .green
    eventBarOne.zPosition = 3
    eventBarOne.position = CGPoint(x:(CGFloat(eventBarZero.position.x) + firstEvent) , y: barY)
    
    eventBarTwo.fillColor = .yellow
    eventBarTwo.zPosition = 3
    eventBarTwo.position = CGPoint(x:(CGFloat(eventBarOne.position.x) + singleEvent) , y: barY)
    
    eventBarThree.fillColor = .red
    eventBarThree.zPosition = 3
    eventBarThree.position = CGPoint(x:(CGFloat(eventBarTwo.position.x) + doubleEvent) , y: barY)
    
    eventBarFour.fillColor = .green
    eventBarFour.zPosition = 3
    eventBarFour.position = CGPoint(x:(CGFloat(eventBarThree.position.x) + trippleEvent) , y: barY)
    
    eventBarFive.fillColor = .yellow
    eventBarFive.zPosition = 3
    eventBarFive.position = CGPoint(x:(CGFloat(eventBarFour.position.x) + singleEvent) , y: barY)
    
    eventBarSix.fillColor = .red
    eventBarSix.zPosition = 3
    eventBarSix.position = CGPoint(x:(CGFloat(eventBarFive.position.x) + doubleEvent) , y: barY)
    
    eventBarSeven.fillColor = .green
    eventBarSeven.zPosition = 3
    eventBarSeven.position = CGPoint(x:(CGFloat(eventBarSix.position.x) + trippleEvent) , y: barY)
    
    eventBarEight.fillColor = .yellow
    eventBarEight.zPosition = 3
    eventBarEight.position = CGPoint(x:(CGFloat(eventBarSeven.position.x) + singleEvent) , y: barY)
    
    eventBarNine.fillColor = .red
    eventBarNine.zPosition = 3
    eventBarNine.position = CGPoint(x:(CGFloat(eventBarEight.position.x) + doubleEvent) , y: barY)
    
    eventBarTen.fillColor = .green
    eventBarTen.zPosition = 3
    eventBarTen.position = CGPoint(x:(CGFloat(eventBarNine.position.x) + trippleEvent) , y: barY)
    
    eventBarEleven.fillColor = .yellow
    eventBarEleven.zPosition = 3
    eventBarEleven.position = CGPoint(x:(CGFloat(eventBarTen.position.x) + singleEvent) , y: barY)
    
    eventBarTwelve.fillColor = .red
    eventBarTwelve.zPosition = 3
    eventBarTwelve.position = CGPoint(x:(CGFloat(eventBarEleven.position.x) + doubleEvent) , y: barY)
    
    splashBackground = SKSpriteNode(imageNamed: "splashBackground")
    splashBackground.position = CGPoint.zero
    splashBackground.size.width = 1242
    splashBackground.size.height = 720
    splashBackground.zPosition = 6
    splashBackground.position.x = 0
    splashBackground.position.y = 0
    
    splashLogo = SKSpriteNode(imageNamed: "splashLogo")
    splashLogo.position = CGPoint.zero
    splashLogo.size.width = 655
    splashLogo.size.height = 655
    splashLogo.zPosition = 7
    splashLogo.position.x = 0
    splashLogo.position.y = 0
    
    createPlayerButton.fillColor = .gray
    createPlayerButton.strokeColor = .clear
    createPlayerButton.zPosition = 10
    createPlayerButton.position.x = 0
    createPlayerButton.position.y = -200
    
    
}

func createIcons2() {
    
    cropNode2.addChild(cropImage2)
    
    cropNode2.position = CGPoint(x: 0, y: 0)
    cropNode2.zPosition = 2
    
    cropImage2.size.width = 1242
    cropImage2.size.height = 720
    
    safeZone2 = SKSpriteNode(imageNamed: "safeZone")
    safeZone2.size.width = 1436
    safeZone2.size.height = 1436
    safeZone2.zPosition = 2
    
    cropNode2.maskNode = safeZone2
    
    splashBackground = SKSpriteNode(imageNamed: "splashBackground")
    splashBackground.position = CGPoint.zero
    splashBackground.size.width = 1242
    splashBackground.size.height = 720
    splashBackground.zPosition = 6
    splashBackground.position.x = 0
    splashBackground.position.y = 0
    
    splashLogo = SKSpriteNode(imageNamed: "splashLogo")
    splashLogo.position = CGPoint.zero
    splashLogo.size.width = 655
    splashLogo.size.height = 655
    splashLogo.zPosition = 7
    splashLogo.position.x = 0
    splashLogo.position.y = 0
    
    splashText = SKSpriteNode(imageNamed: "splashText")
    splashText.position = CGPoint.zero
    splashText.size.width = 926
    splashText.size.height = 242
    splashText.zPosition = 8
    splashText.position.x = 0
    splashText.position.y = 0
    
    background2 = SKSpriteNode(imageNamed: "backgroundImage")
    background2.position = CGPoint.zero
    background2.size.width = 1242
    background2.size.height = 720
    background2.zPosition = 0
    background2.position.x = 0
    background2.position.y = 0
    
    teamIconPath2.addArc(center: CGPoint.zero,
                         radius: 12,
                         startAngle: 0,
                         endAngle: CGFloat.pi * 2,
                         clockwise: true)
    teamIconNode2 = SKShapeNode(path:    teamIconPath2)
    teamIconNode2.lineWidth = 0
    teamIconNode2.fillColor = .red
    teamIconNode2.strokeColor = .clear
    teamIconNode2.zPosition = 4
    teamIconNode2.position.x = 0.7
    teamIconNode2.position.y = -0.7
    
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
    eventOneNode2.zPosition = 3
    
    eventTwoPath2.addArc(center: CGPoint.zero,
                         radius: (eventRadius/2),
                         startAngle: 0,
                         endAngle: CGFloat.pi * 2,
                         clockwise: true)
    eventTwoNode2 = SKShapeNode(path:    eventTwoPath2)
    eventTwoNode2.lineWidth = 5
    eventTwoNode2.fillColor = .clear
    eventTwoNode2.strokeColor = .clear
    eventTwoNode2.zPosition = 3
    
    eventThreePath2.addArc(center: CGPoint.zero,
                           radius: (eventRadius/4),
                           startAngle: 0,
                           endAngle: CGFloat.pi * 2,
                           clockwise: true)
    eventThreeNode2 = SKShapeNode(path:    eventThreePath2)
    eventThreeNode2.lineWidth = 5
    eventThreeNode2.fillColor = .clear
    eventThreeNode2.strokeColor = .clear
    eventThreeNode2.zPosition = 3
    
    eventFourPath2.addArc(center: CGPoint.zero,
                          radius: (eventRadius/8),
                          startAngle: 0,
                          endAngle: CGFloat.pi * 2,
                          clockwise: true)
    eventFourNode2 = SKShapeNode(path:    eventFourPath2)
    eventFourNode2.lineWidth = 5
    eventFourNode2.fillColor = .clear
    eventFourNode2.strokeColor = .clear
    eventFourNode2.zPosition = 3
    
//    poisonGasPath2.addArc(center: CGPoint.zero,
//                          radius: (poisonGasRadius),
//                          startAngle: 0,
//                          endAngle: CGFloat.pi * 2,
//                          clockwise: true)
//    poisonGasNode2 = SKShapeNode(path:    poisonGasPath2)
//    poisonGasNode2.lineWidth = 0
//    poisonGasNode2.fillColor = .clear
//    poisonGasNode2.strokeColor = .green
//    poisonGasNode2.alpha = 0.2
//    poisonGasNode2.zPosition = 3
    }

