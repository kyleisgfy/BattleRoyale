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
    var entities = [GKEntity]()
    var graphs = [String : GKGraph]()
    private var lastUpdateTime : TimeInterval = 0
    
    var restrictionTimerLabel2:SKLabelNode = SKLabelNode()
    var restrictionLabel2:SKLabelNode = SKLabelNode()
    
    var playersLeftLabel2:SKLabelNode = SKLabelNode()
    var aliveLabel2:SKLabelNode = SKLabelNode()
    
    var broadcastLineOneLabel2:SKLabelNode = SKLabelNode()
    var broadcastLineTwoLabel2:SKLabelNode = SKLabelNode()
    var broadcastLineThreeLabel2:SKLabelNode = SKLabelNode()
    var broadcastLineFourLabel2:SKLabelNode = SKLabelNode()
    var broadcastLineFiveLabel2:SKLabelNode = SKLabelNode()
    
    override func sceneDidLoad() {
        
        self.addChild(background2)
        self.addChild(eventOneNode2)
        self.addChild(eventTwoNode2)
        self.addChild(eventThreeNode2)
        self.addChild(eventFourNode2)
        self.addChild(teamIconNode2)
        self.addChild(poisonGasNode2)
        
        
        if let RestrictionTimer2:SKLabelNode = self.childNode(withName: "restrictionTimerLabel2") as? SKLabelNode {
            restrictionTimerLabel2 = RestrictionTimer2
            time.restrictionTimeInSeconds = time.restrictionTimeInSecondsSetup
            restrictionTimerLabel2.text = ""
            print ("Restriction timer label inicialized")
        } else {
            print ("Restriction timer label Failed")
        }
        
        if let restriction2:SKLabelNode = self.childNode(withName: "restrictionLabel2") as? SKLabelNode {
            restrictionLabel2 = restriction2
            restrictionLabel2.alpha = 0.0
            restrictionLabel2.text = "RESTRICT IN..."
            print ("Restriction label inicialized")
        } else {
            print ("Restriction label Failed")
        }
        
        if let PlayersLeft2:SKLabelNode = self.childNode(withName: "playersLeftLabel2") as? SKLabelNode {
            playersLeftLabel2 = PlayersLeft2
            print ("players left label inicialized")
            playersLeftLabel2.text = "\(char.playersLeft)"
        } else {
            print ("Players left label Failed")
        }
        
        if let alive2:SKLabelNode = self.childNode(withName: "aliveLabel2") as? SKLabelNode {
            aliveLabel2 = alive2
            print ("Alive label inicialized")
            aliveLabel2.text = "ALIVE"
        } else {
            print ("Alive left label Failed")
        }
        
        if let BroadcastOne2:SKLabelNode = self.childNode(withName: "broadcastLineOneLabel2") as? SKLabelNode {
            broadcastLineOneLabel2 = BroadcastOne2
            print ("Broadcast line one label inicialized")
            broadcastLineOneLabel2.text = ""
        } else {
            print ("Broadcast line one label Failed")
        }
        
        if let BroadcastTwo2:SKLabelNode = self.childNode(withName: "broadcastLineTwoLabel2") as? SKLabelNode {
            broadcastLineTwoLabel2 = BroadcastTwo2
            print ("Broadcast line two inicialized")
            broadcastLineTwoLabel2.text = ""
        } else {
            print ("Broadcast line two label Failed")
        }
        
        if let BroadcastThree2:SKLabelNode = self.childNode(withName: "broadcastLineThreeLabel2") as? SKLabelNode {
            broadcastLineThreeLabel2 = BroadcastThree2
            print ("Broadcast line three label inicialized")
            broadcastLineThreeLabel2.text = ""
        } else {
            print ("Broadcast line three label Failed")
        }
        
        if let BroadcastFour2:SKLabelNode = self.childNode(withName: "broadcastLineFourLabel2") as? SKLabelNode {
            broadcastLineFourLabel2 = BroadcastFour2
            print ("Broadcast line four label inicialized")
            broadcastLineFourLabel2.text = ""
        } else {
            print ("Broadcast line four label Failed")
        }
        
        if let BroadcastFive2:SKLabelNode = self.childNode(withName: "broadcastLineFiveLabel2") as? SKLabelNode {
            broadcastLineFiveLabel2 = BroadcastFive2
            print ("Broadcast line five inicialized")
            broadcastLineFiveLabel2.text = ""
        } else {
            print ("Broadcast line five label Failed")
        }
        
        self.lastUpdateTime = 0
    }
    
    override func update(_ currentTime: TimeInterval) {
        if (self.lastUpdateTime == 0) {
            self.lastUpdateTime = currentTime
        }
        let dt = currentTime - self.lastUpdateTime
        for entity in self.entities {
            entity.update(deltaTime: dt)
        }
        self.lastUpdateTime = currentTime
        
//        restrictionLabel2.alpha = game.restrictionLabel.alpha
//        restrictionTimerLabel2.text = game.restrictionTimerLabel.text
        
        
    }
}
