//
//  GameScene.swift
//  Battle Royale 2
//
//  Created by Kyle Schneider on 11/30/18.
//  Copyright © 2018 Kyle Schneider›‹. All rights reserved.
//

import SpriteKit
import GameplayKit

var game: GameScene = GameScene ()

class GameScene: SKScene {
    var entities = [GKEntity]()
    var graphs = [String : GKGraph]()
    private var lastUpdateTime : TimeInterval = 0
    
    
    var gameTimerLabel:SKLabelNode = SKLabelNode()
    var restrictionTimerLabel:SKLabelNode = SKLabelNode()
    
    var playersLeftLabel:SKLabelNode = SKLabelNode()
    
    var broadcastLineOneLabel:SKLabelNode = SKLabelNode()
    var broadcastLineTwoLabel:SKLabelNode = SKLabelNode()
    var broadcastLineThreeLabel:SKLabelNode = SKLabelNode()
    var broadcastLineFourLabel:SKLabelNode = SKLabelNode()
    var broadcastLineFiveLabel:SKLabelNode = SKLabelNode()
    
    var x: CGFloat = 0.0
    var y: CGFloat = 0.0
    
    var eventNumber = 1
    var phaseNumber = 0
    var freeTime = 5
    var restrictInTime = 5
    var restrictTime = 20
    
    override func sceneDidLoad() {
        createIcons()
        self.addChild(background)
        self.addChild(eventOneNode)
        self.addChild(eventTwoNode)
        self.addChild(eventThreeNode)
        self.addChild(eventFourNode)
        self.addChild(teamIconNode)
        self.addChild(poisonGasNode)
//        self.addChild(poisonGasNode2)
//        self.addChild(backgroundGreenNode)
//        self.addChild(backgroundGasCropNode)
        
        runGameTimer()
        runPhase()
       
        if let GameTimer:SKLabelNode = self.childNode(withName: "gameTimerLabel") as? SKLabelNode {
            gameTimerLabel = GameTimer
            gameTimerLabel.text = ""
            print ("Game time in seconds inicialized")
        } else {
            print ("Game time label Failed")
        }
        
        if let RestrictionTimer:SKLabelNode = self.childNode(withName: "restrictionTimerLabel") as? SKLabelNode {
            restrictionTimerLabel = RestrictionTimer
            time.restrictionTimeInSeconds = time.restrictionTimeInSecondsSetup
            restrictionTimerLabel.text = ""
            print ("Restriction timer label inicialized")
        } else {
            print ("Restriction timer label Failed")
        }
        
        if let PlayersLeft:SKLabelNode = self.childNode(withName: "playersLeftLabel") as? SKLabelNode {
            playersLeftLabel = PlayersLeft
            print ("players left label inicialized")
            playersLeftLabel.text = "\(char.playersLeft)"
        } else {
            print ("Players left label Failed")
        }
        
        if let BroadcastOne:SKLabelNode = self.childNode(withName: "broadcastLineOneLabel") as? SKLabelNode {
            broadcastLineOneLabel = BroadcastOne
            print ("Broadcast line one label inicialized")
            broadcastLineOneLabel.text = ""
        } else {
            print ("Broadcast line one label Failed")
        }
        
        if let BroadcastTwo:SKLabelNode = self.childNode(withName: "broadcastLineTwoLabel") as? SKLabelNode {
            broadcastLineTwoLabel = BroadcastTwo
            print ("Broadcast line two inicialized")
            broadcastLineTwoLabel.text = ""
        } else {
            print ("Broadcast line two label Failed")
        }
        
        if let BroadcastThree:SKLabelNode = self.childNode(withName: "broadcastLineThreeLabel") as? SKLabelNode {
            broadcastLineThreeLabel = BroadcastThree
            print ("Broadcast line three label inicialized")
            broadcastLineThreeLabel.text = ""
        } else {
            print ("Broadcast line three label Failed")
        }
        
        if let BroadcastFour:SKLabelNode = self.childNode(withName: "broadcastLineFourLabel") as? SKLabelNode {
            broadcastLineFourLabel = BroadcastFour
            print ("Broadcast line four label inicialized")
            broadcastLineFourLabel.text = ""
        } else {
            print ("Broadcast line four label Failed")
        }
        
        if let BroadcastFive:SKLabelNode = self.childNode(withName: "broadcastLineFiveLabel") as? SKLabelNode {
            broadcastLineFiveLabel = BroadcastFive
            print ("Broadcast line five inicialized")
            broadcastLineFiveLabel.text = ""
        } else {
            print ("Broadcast line five label Failed")
        }
        
         self.lastUpdateTime = 0
        }

// Keyboard and mouse input functions.
    
    func touchDown(atPoint pos : CGPoint) {
    }
    
    func touchMoved(toPoint pos : CGPoint) {
    }
    
    func touchUp(atPoint pos : CGPoint) {
    }
    
    override func mouseDown(with event: NSEvent) {
        self.touchDown(atPoint: event.location(in: self))
        if eventNumber == 1 && phaseNumber == 1 {
            eventOneNode.position = event.location(in: self)
        } else if eventNumber == 2 && phaseNumber == 1 {
            eventTwoNode.position = event.location(in: self)
        } else if eventNumber == 3 && phaseNumber == 1 {
            eventThreeNode.position = event.location(in: self)
        } else if eventNumber == 4 && phaseNumber == 1 {
            eventFourNode.position = event.location(in: self)
        } else {
            print ("Event out of scope for touch position to occur.")
        }
        
        
        
    }
    
    override func mouseDragged(with event: NSEvent) {
        self.touchMoved(toPoint: event.location(in: self))
    }
    
    override func mouseUp(with event: NSEvent) {
        self.touchUp(atPoint: event.location(in: self))
    }
    
    override func keyDown(with event: NSEvent) {
        let keycode = event.keyCode
        
        switch keycode {
        case 126: //up arrow
            teamIconNode.position.y = teamIconNode.position.y + 28.8
        case 125: //down arrow
            teamIconNode.position.y = teamIconNode.position.y - 28.8
        case 124: //right arrow
            teamIconNode.position.x = teamIconNode.position.x + 28.8
        case 123: //left arrow
            teamIconNode.position.x = teamIconNode.position.x - 28.8
        case 34: //plus key
            if phaseNumber == 1 {
                time.phaseTimerInSeconds += 5
            } else {
                print ("cannot increase time")
            }
        case 36:
            print ("kill rando")
            
        default:
            print("keyDown: \(event.characters!) keyCode: \(event.keyCode)")
        }
        
       
    }
    
    
    

    
 // Timer functions
    
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
    
    func runGameTimer() {
        time.gameTimer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(GameScene.updateGameTimer)), userInfo: nil, repeats: true)
        print("Run timer iniciated")
    }
    
    func runRestrictionTimer () {
        time.restrictionTimeInSeconds = 5
        time.restrictionTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(GameScene.updateRestrictionTimer)), userInfo: nil, repeats: true)
        print("Restriction Timer Started")
    }
    
    @objc func updateRestrictionTimer() {
        time.restrictionTimeInSeconds -= 1
        if time.restrictionTimeInSeconds == 0 {
            time.restrictionTimer.invalidate()
            restrictionTimerLabel.text = ""
        }
            restrictionTimerLabel.text = timeString(time: TimeInterval(time.restrictionTimeInSeconds))
    }
    
    @objc func updateGameTimer() {
        time.gameTimeInSeconds += 1     //This will decrement(count down)the seconds.
            gameTimerLabel.text = timeString(time: TimeInterval(time.gameTimeInSeconds))
        restrictTheScreen()
    }
    
    func runPhaseTimer() {
        time.phaseTimer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(GameScene.updatePhaseTimer)), userInfo: nil, repeats: true)
    }
    
    @objc func updatePhaseTimer() {
        time.phaseTimerInSeconds -= 1
        if time.phaseTimerInSeconds == 0 {
            phaseTimerFired()
            restrictionTimerLabel.text = ""
        } else {
        }
        
    }
    
    
    func timeString(time:TimeInterval) -> String {
        //        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i", minutes, seconds)
    }
    
    func restrictTheScreen() {
        if phaseNumber == 3 && eventNumber == 1 {
            poisonGasNode.lineWidth += 2 * ((poisonGasRadius - eventRadius) / CGFloat(restrictTime))
        } else if phaseNumber == 3 && eventNumber == 2 {
            eventOneNode.alpha = 0.2
            eventOneNode.strokeColor = .green
            eventOneNode.lineWidth += (eventRadius / CGFloat(restrictTime))
            eventOneNode.position.x = eventOneNode.position.x + x
            eventOneNode.position.y = eventOneNode.position.y + y
            
        } else if phaseNumber == 3 && eventNumber == 3 {
            eventTwoNode.alpha = 0.2
            eventTwoNode.strokeColor = .green
            eventTwoNode.lineWidth += (eventRadius / 2) / CGFloat(restrictTime)
            eventTwoNode.position.x = eventTwoNode.position.x + x
            eventTwoNode.position.y = eventTwoNode.position.y + y
        } else if phaseNumber == 3 && eventNumber == 4 {
            eventThreeNode.alpha = 0.2
            eventThreeNode.strokeColor = .green
            eventThreeNode.lineWidth += (eventRadius / 4) / CGFloat(restrictTime)
            eventThreeNode.position.x = eventThreeNode.position.x + x
            eventThreeNode.position.y = eventThreeNode.position.y + y
        }
        
    }
    
    
    func phaseTimerFired () {
        print ("phase timer fired")
        time.phaseTimer.invalidate()
        if phaseNumber == 1 || phaseNumber == 2 || phaseNumber == 0 {
            phaseNumber += 1
            print ("\(eventNumber).\(phaseNumber)")
        } else if phaseNumber == 3 {
            phaseNumber = 1
            eventNumber += 1
            print ("\(eventNumber).\(phaseNumber)")
        } else {
            print ("phase number is out of scope to change phase number.")
        }
        runPhase()
    }
    
    
    

    func runPhase() {
        switch phaseNumber {
        case 0:
            time.phaseTimerInSeconds = 5
            runPhaseTimer()
        case 1:
            if eventNumber == 1 {
                time.phaseTimerInSeconds = 5
                eventOneNode.strokeColor = .blue
            } else if eventNumber == 2 {
                time.phaseTimerInSeconds = 5
                eventOneNode.strokeColor = .clear
                eventTwoNode.strokeColor = .blue
            } else if eventNumber == 3 {
                time.phaseTimerInSeconds = 5
                eventTwoNode.strokeColor = .clear
                eventThreeNode.strokeColor = .blue
            } else if eventNumber == 4 {
                time.phaseTimerInSeconds = 5
                eventThreeNode.strokeColor = .clear
                eventFourNode.strokeColor = .blue
            } else {
                print ("event number is out of scope to change color.")
            }
            runPhaseTimer()
        case 2:
            time.phaseTimerInSeconds = 5
            runRestrictionTimer()
            runPhaseTimer()
            if eventNumber == 1 {
                poisonGasNode.position = eventOneNode.position
            } else if eventNumber == 2 {
                x = ((eventOneNode.position.x - eventTwoNode.position.x) / CGFloat((-1 * restrictTime)))
                y = ((eventOneNode.position.y - eventTwoNode.position.y) / CGFloat((-1 * restrictTime)))
            } else if eventNumber == 3 {
                x = ((eventTwoNode.position.x - eventThreeNode.position.x) / CGFloat((-1 * restrictTime)))
                y = ((eventTwoNode.position.y - eventThreeNode.position.y) / CGFloat((-1 * restrictTime)))
            } else if eventNumber == 4 {
                x = ((eventThreeNode.position.x - eventFourNode.position.x) / CGFloat((-1 * restrictTime)))
                y = ((eventThreeNode.position.y - eventFourNode.position.y) / CGFloat((-1 * restrictTime)))
            }
            
            
        case 3:
            time.phaseTimerInSeconds = restrictTime
            runPhaseTimer()
        default:
            print ("Phase number is out of scope to move forward.")
        }
    }
    
    
    
}
