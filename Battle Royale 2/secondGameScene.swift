//
//  secondGameScene.swift
//  Battle Royale 2
//
//  Created by Kyle Schneider on 1/6/19.
//  Copyright © 2019 Kyle Schneider›‹. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

var SecondGame: SecondGameScene = SecondGameScene ()

class SecondGameScene: SKScene {
    var secondEntities = [GKEntity]()
    var secondGraphs = [String : GKGraph]()
    private var lastUpdateTime : TimeInterval = 0
    
    var testPath = CGMutablePath()
    var testNode = SKShapeNode()
    
    override func sceneDidLoad() {
        
        print ("second scene loaded")
        testPath.addArc(center: CGPoint.zero,
                            radius: 15,
                            startAngle: 0,
                            endAngle: CGFloat.pi * 2,
                            clockwise: true)
        testNode = SKShapeNode(path:    testPath)
        testNode.lineWidth = 0
        testNode.fillColor = .red
        testNode.strokeColor = .clear
        testNode.zPosition = 2
        testNode.position.x = 0
        testNode.position.y = 0
        
        self.lastUpdateTime = 0
    }
    //****************************************************************************************
    // Keyboard and mouse input functions.
    //****************************************************************************************
    
    func touchDown(atPoint pos : CGPoint) {
    }
    
    func touchMoved(toPoint pos : CGPoint) {
    }
    
    func touchUp(atPoint pos : CGPoint) {
    }
    
    override func mouseDown(with event: NSEvent) {
        self.touchDown(atPoint: event.location(in: self))

        
    }
    
    override func mouseDragged(with event: NSEvent) {
        self.touchMoved(toPoint: event.location(in: self))
    }
    
    override func mouseUp(with event: NSEvent) {
        self.touchUp(atPoint: event.location(in: self))
    }
    
    override func keyDown(with event: NSEvent) {
        
        
    }
}
