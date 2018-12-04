//
//  GameScene.swift
//  Battle Royale 2
//
//  Created by Kyle Schneider on 11/30/18.
//  Copyright © 2018 Kyle Schneider›‹. All rights reserved.
//

import SpriteKit
import GameplayKit


class GameScene: SKScene {
    var entities = [GKEntity]()
    var graphs = [String : GKGraph]()
    private var lastUpdateTime : TimeInterval = 0
    
    
    
    
    
    
    
    override func sceneDidLoad() {
        createIcons()
        self.addChild(teamIconNode)
        self.addChild(nextEventNode)
        runTimer()
       
        
        
        
        
        
        
        
        
         self.lastUpdateTime = 0
        }
    
    func touchDown(atPoint pos : CGPoint) {
    }
    
    func touchMoved(toPoint pos : CGPoint) {
    }
    
    func touchUp(atPoint pos : CGPoint) {
    }
    
    override func mouseDown(with event: NSEvent) {
        self.touchDown(atPoint: event.location(in: self))
        nextEventNode.position = event.location(in: self)
    }
    
    override func mouseDragged(with event: NSEvent) {
        self.touchMoved(toPoint: event.location(in: self))
    }
    
    override func mouseUp(with event: NSEvent) {
        self.touchUp(atPoint: event.location(in: self))
    }
    
    override func keyDown(with event: NSEvent) {
        switch event.keyCode {
        case 0x31:
            print ("keydown")
            
        default:
            print("keyDown: \(event.characters!) keyCode: \(event.keyCode)")
        }
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
    }
    
    
    
    
    
    func runTimer() {
        gameTimer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(GameScene.updateTimer)), userInfo: nil, repeats: true)
        print("Run timer iniciated")
    }
    
    func runRestrictionTimer () {
        restrictionTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(GameScene.updateRestrictionTimer)), userInfo: nil, repeats: true)
        print("Restriction Timer Started")
    }
    
    @objc func updateRestrictionTimer() {
        restrictionTimeInSeconds -= 1
//            restrictionTimerLabel.text = timeString(time: TimeInterval(restrictionTimeInSeconds))
        print(restrictionTimeInSeconds)
    }
    
    func updatePlayersLeft () {
        //    playersLeftLabel.text = "\(playersLeft)"
        print(playersLeft)
    }
    
    @objc func updateTimer() {
        gameTimeInSeconds -= 1     //This will decrement(count down)the seconds.
        //    gameTimeInSecondsLabel.text = timeString(time: TimeInterval(gameTimeInSeconds))
                print (gameTimeInSeconds)
    }



}
