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
    
    var restrictionLabel:SKLabelNode = SKLabelNode()
    
    var playersLeftLabel:SKLabelNode = SKLabelNode()
    
    var pauseLabel:SKLabelNode = SKLabelNode()
    
    var aliveLabel:SKLabelNode = SKLabelNode()
    
    var phaseLabel:SKLabelNode = SKLabelNode()
    var phaseTimerLabel:SKLabelNode = SKLabelNode()
    
    var broadcastLineOneLabel:SKLabelNode = SKLabelNode()
    var broadcastLineTwoLabel:SKLabelNode = SKLabelNode()
    var broadcastLineThreeLabel:SKLabelNode = SKLabelNode()
    var broadcastLineFourLabel:SKLabelNode = SKLabelNode()
    var broadcastLineFiveLabel:SKLabelNode = SKLabelNode()
    
    var x: CGFloat = 0.0
    var y: CGFloat = 0.0
    
    var eventNumber = 1
    var phaseNumber = 0
    var freeTime = 900
    var restrictInTime = 300
    var restrictTime = 600
    
    var totalGameTime = 5
    
    var pauseIsActive = false
    
    var chance = 5
    
    override func sceneDidLoad() {
        createIcons()
        self.addChild(background)
        self.addChild(eventOneNode)
        self.addChild(eventTwoNode)
        self.addChild(eventThreeNode)
        self.addChild(eventFourNode)
        self.addChild(teamIconNode)
        self.addChild(poisonGasNode)
        self.addChild(eventBoarder)
        self.addChild(eventBarZero)
        self.addChild(eventBarOne)
        self.addChild(eventBarTwo)
        self.addChild(eventBarThree)
        self.addChild(eventBarFour)
        self.addChild(eventBarFive)
        self.addChild(eventBarSix)
        self.addChild(eventBarSeven)
        self.addChild(eventBarEight)
        self.addChild(eventBarNine)
        self.addChild(eventBarTen)
        self.addChild(eventBarEleven)
        self.addChild(eventBarTwelve)
        
        totalGameTime = ((freeTime * 5) + (restrictInTime * 4) + (restrictTime * 4))
        
        runGameTimer()
        runPhase()
        pauseGame()
        
        if let GameTimer:SKLabelNode = self.childNode(withName: "gameTimerLabel") as? SKLabelNode {
            gameTimerLabel = GameTimer
            gameTimerLabel.text = ""
            print ("Game time in seconds inicialized")
        } else {
            print ("Game time label Failed")
        }
        
//        if let RestrictionTimer:SKLabelNode = self.childNode(withName: "restrictionTimerLabel") as? SKLabelNode {
//            restrictionTimerLabel = RestrictionTimer
//            time.restrictionTimeInSeconds = time.restrictionTimeInSecondsSetup
//            restrictionTimerLabel.text = ""
//            print ("Restriction timer label inicialized")
//        } else {
//            print ("Restriction timer label Failed")
//        }
//
//        if let restriction:SKLabelNode = self.childNode(withName: "restrictionLabel") as? SKLabelNode {
//            restrictionLabel = restriction
//            restrictionLabel.alpha = 0.0
//            restrictionLabel.text = "RESTRICT IN..."
//            print ("Restriction label inicialized")
//        } else {
//            print ("Restriction label Failed")
//        }
        
        if let PlayersLeft:SKLabelNode = self.childNode(withName: "playersLeftLabel") as? SKLabelNode {
            playersLeftLabel = PlayersLeft
            print ("players left label inicialized")
            playersLeftLabel.text = "\(char.playersLeft)"
        } else {
            print ("Players left label Failed")
        }
        
        if let alive:SKLabelNode = self.childNode(withName: "aliveLabel") as? SKLabelNode {
            aliveLabel = alive
            print ("Alive label inicialized")
            aliveLabel.text = "ALIVE"
        } else {
            print ("Alive left label Failed")
        }
        
        if let phase:SKLabelNode = self.childNode(withName: "phaseLabel") as? SKLabelNode {
            phaseLabel = phase
            print ("players left label inicialized")
            phaseLabel.text = ""
        } else {
            print ("Phase label Failed")
        }
        
        if let phaseTime:SKLabelNode = self.childNode(withName: "phaseTimerLabel") as? SKLabelNode {
            phaseTimerLabel = phaseTime
            print ("Phase timer label inicialized")
            phaseTimerLabel.text = ""
        } else {
            print ("Phase timer label Failed")
        }
        
        if let BroadcastOne:SKLabelNode = self.childNode(withName: "broadcastLineOneLabel") as? SKLabelNode {
            broadcastLineOneLabel = BroadcastOne
            print ("Broadcast line one label inicialized")
            broadcastLineOneLabel.text = ""
        } else {
            print ("Broadcast line one label Failed for scene one")
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
        
        if let pauseGame:SKLabelNode = self.childNode(withName: "pauseLabel") as? SKLabelNode {
            pauseLabel = pauseGame
            print ("Broadcast line five inicialized")
            pauseLabel.alpha = 1.0
            pauseLabel.text = "Press Spacebar To Begin"
        } else {
            print ("Broadcast line five label Failed")
        }
        
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
        let move = CGFloat(28.9)
        switch keycode {
            
        case 126: //up arrow
            if teamIconNode.position.y < 317 {
                teamIconNode.position.y = teamIconNode.position.y + move
            }
            
        case 125: //down arrow
            if teamIconNode.position.y > -317 {
                teamIconNode.position.y = teamIconNode.position.y - move
            }
            
        case 124: //right arrow
            if teamIconNode.position.x < 576 {
                teamIconNode.position.x = teamIconNode.position.x + move
            }

        case 123: //left arrow
            if teamIconNode.position.x > -576 {
                teamIconNode.position.x = teamIconNode.position.x - move
            }

            
        case 27: //minus key
            if phaseNumber == 1 || phaseNumber == 0 {
                time.phaseTimerInSeconds -= 60
            } else {
                print ("cannot decrease time")
            }
            
        case 34: //plus key
            if phaseNumber == 1 {
                time.phaseTimerInSeconds += 120
            } else {
                print ("cannot increase time")
            }
            
        case 36: //return
            forceKillRando()
        
        case 49: //spacebar
            pauseLabel.text = "Game is Paused"
            phaseLabel.text = "Game introduction"
            pauseGame()
        
        case 18: //1
            characterKillRando(character: "Snara Narke")
            
        case 19: //2
            characterKillRando(character: "Meta")
            
        case 20: //3
            characterKillRando(character: "Zinnakahn")
            
        case 21: //4
            characterKillRando(character: "Auran")
            
        case 23: //5
            characterKillRando(character: "Alaqua")
            
        case 22: //6
            characterKillRando(character: "Tokobette")
            
        default:
            print("keyDown: \(event.characters!) keyCode: \(event.keyCode)")
        }
    }
    
    
    

//****************************************************************************************
// Timer functions
//****************************************************************************************
    
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
    }
    
    func runRestrictionTimer () {
        time.restrictionTimeInSeconds = restrictInTime
        time.restrictionTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(GameScene.updateRestrictionTimer)), userInfo: nil, repeats: true)
    }
    
    @objc func updateRestrictionTimer() {
        if pauseIsActive == false {
            time.restrictionTimeInSeconds -= 1
            if time.restrictionTimeInSeconds <= 0 {
                time.restrictionTimer.invalidate()
                restrictionTimerLabel.text = ""
                restrictionLabel.alpha = 0.0
            }
            restrictionTimerLabel.text = timeString(time: TimeInterval(time.restrictionTimeInSeconds))
        } else {
        }
        time.restrictionTimeString = "\(restrictionTimerLabel.text ?? "")"
    }
    
    @objc func updateGameTimer() {
        if pauseIsActive == false {
            time.gameTimeInSeconds += 1     //This will decrement(count down)the seconds.
            randomChance()
            gameTimerLabel.text = timeString(time: TimeInterval(time.gameTimeInSeconds))
            if time.restrictionTimer.isValid == true {
                if restrictionLabel.alpha == 0.0 {
                    restrictionLabel.alpha = 1.0
                } else {
                    restrictionLabel.alpha = 0.0
                }
            }
            restrictTheScreen()
//            killRando()
        }
    }
    
    func runPhaseTimer() {
        time.phaseTimer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(GameScene.updatePhaseTimer)), userInfo: nil, repeats: true)
    }
    
    @objc func updatePhaseTimer() {
        if pauseIsActive == false {
            time.phaseTimerInSeconds -= 1
            phaseTimerLabel.text = timeString(time: TimeInterval(time.phaseTimerInSeconds))
            if time.phaseTimerInSeconds <= 0 {
                phaseTimerFired()
                restrictionTimerLabel.text = ""
            } else {
            }
        } else {
        }
    }
    
    
    func timeString(time:TimeInterval) -> String {
        //        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i", minutes, seconds)
    }
    
    
    func phaseTimerFired () {
        time.phaseTimer.invalidate()
        if phaseNumber == 1 || phaseNumber == 2 || phaseNumber == 0 {
            phaseNumber += 1
            print ("\(eventNumber).\(phaseNumber)")
        } else if phaseNumber == 3 && eventNumber != 4 {
            phaseNumber = 1
            eventNumber += 1
            print ("\(eventNumber).\(phaseNumber)")
        } else if phaseNumber == 3 && eventNumber == 4 {
            phaseLabel.text = "End game imminant"
            phaseTimerLabel.text = ""
            print (time.gameTimeInSeconds)
            phaseNumber += 1
        } else {
            print ("phase number is out of scope to change phase number.")
        }
        runPhase()
    }
    
//****************************************************************************************
// functions for the phase and the restriction of the screen
//****************************************************************************************
    
    func copyCircle(circle2: SKShapeNode, circle: SKShapeNode) {
        circle2.alpha = circle.alpha
        circle2.strokeColor = circle.strokeColor
        circle2.lineWidth = circle.lineWidth
        circle2.position.x = circle.position.x
        circle2.position.y = circle.position.y
    }
    
    func restrictTheScreen() {
        if pauseIsActive == false {
            if phaseNumber == 3 && eventNumber == 1 {
                poisonGasNode.lineWidth += 2 * ((poisonGasRadius - eventRadius) / CGFloat(restrictTime))
                copyCircle(circle2: poisonGasNode2, circle: poisonGasNode)
            } else if phaseNumber == 3 && eventNumber == 2 {
                eventOneNode.alpha = 0.2
                eventOneNode.strokeColor = .green
                eventOneNode.lineWidth += (eventRadius / CGFloat(restrictTime))
                eventOneNode.position.x = eventOneNode.position.x + x
                eventOneNode.position.y = eventOneNode.position.y + y
                copyCircle(circle2: eventOneNode2, circle: eventOneNode)
            } else if phaseNumber == 3 && eventNumber == 3 {
                eventTwoNode.alpha = 0.2
                eventTwoNode.strokeColor = .green
                eventTwoNode.lineWidth += (eventRadius / 2) / CGFloat(restrictTime)
                eventTwoNode.position.x = eventTwoNode.position.x + x
                eventTwoNode.position.y = eventTwoNode.position.y + y
                copyCircle(circle2: eventTwoNode2, circle: eventTwoNode)
            } else if phaseNumber == 3 && eventNumber == 4 {
                eventThreeNode.alpha = 0.2
                eventThreeNode.strokeColor = .green
                eventThreeNode.lineWidth += (eventRadius / 4) / CGFloat(restrictTime)
                eventThreeNode.position.x = eventThreeNode.position.x + x
                eventThreeNode.position.y = eventThreeNode.position.y + y
                copyCircle(circle2: eventThreeNode2, circle: eventThreeNode)
            }
        } else {
        }
    }
    
    func runPhase() {
        switch phaseNumber {
        case 0:
            phaseLabel.text = "Game start introduction"
            time.phaseTimerInSeconds = freeTime
            runPhaseTimer()
        case 1:
            phaseLabel.text = "Nothing will occur for"
            if eventNumber == 1 {
                time.phaseTimerInSeconds = freeTime
                eventOneNode.strokeColor = .blue
            } else if eventNumber == 2 {
                time.phaseTimerInSeconds = freeTime
                eventOneNode.strokeColor = .clear
                eventOneNode2.strokeColor = eventOneNode.strokeColor
                eventTwoNode.strokeColor = .blue
            } else if eventNumber == 3 {
                time.phaseTimerInSeconds = freeTime
                eventTwoNode.strokeColor = .clear
                eventTwoNode2.strokeColor = eventTwoNode.strokeColor
                eventThreeNode.strokeColor = .blue
            } else if eventNumber == 4 {
                time.phaseTimerInSeconds = freeTime
                eventThreeNode.strokeColor = .clear
                eventThreeNode2.strokeColor = eventThreeNode.strokeColor
                eventFourNode.strokeColor = .blue
            } else {
                print ("event number is out of scope to change color.")
            }
            runPhaseTimer()
        case 2:
            phaseLabel.text = "Safe zone will restrict in"
            time.phaseTimerInSeconds = restrictInTime
            runRestrictionTimer()
            runPhaseTimer()
            if eventNumber == 1 {
                poisonGasNode.position = eventOneNode.position
                eventOneNode2.position.x = eventOneNode.position.x
                eventOneNode2.position.y = eventOneNode.position.y
                eventOneNode2.strokeColor = eventOneNode.strokeColor
            } else if eventNumber == 2 {
                eventTwoNode2.position.x = eventTwoNode.position.x
                eventTwoNode2.position.y = eventTwoNode.position.y
                eventTwoNode2.strokeColor = eventTwoNode.strokeColor
                x = ((eventOneNode.position.x - eventTwoNode.position.x) / CGFloat((-1 * restrictTime)))
                y = ((eventOneNode.position.y - eventTwoNode.position.y) / CGFloat((-1 * restrictTime)))
            } else if eventNumber == 3 {
                eventThreeNode2.position.x = eventThreeNode.position.x
                eventThreeNode2.position.y = eventThreeNode.position.y
                eventThreeNode2.strokeColor = eventThreeNode.strokeColor
                x = ((eventTwoNode.position.x - eventThreeNode.position.x) / CGFloat((-1 * restrictTime)))
                y = ((eventTwoNode.position.y - eventThreeNode.position.y) / CGFloat((-1 * restrictTime)))
            } else if eventNumber == 4 {
                eventFourNode2.position.x = eventFourNode.position.x
                eventFourNode2.position.y = eventFourNode.position.y
                eventFourNode2.strokeColor = eventFourNode.strokeColor
                x = ((eventThreeNode.position.x - eventFourNode.position.x) / CGFloat((-1 * restrictTime)))
                y = ((eventThreeNode.position.y - eventFourNode.position.y) / CGFloat((-1 * restrictTime)))
            }
            
        case 3:
            phaseLabel.text = "Safe zone is restricting"
            time.phaseTimerInSeconds = restrictTime
            runPhaseTimer()
        default:
            print ("Phase number is out of scope to move forward.")
        }
    }
    
//****************************************************************************************
// functions for broadcast and label text
//****************************************************************************************
    
    func updatePlayersLeft () {
        playersLeftLabel.text = "\(char.playersLeft)"
        //        print(playersLeft)
    }
    
    func killRando() {
        if char.playersLeft > 11 && phaseNumber != 0 {
            let roll = Int.random(in: 0...15)
            if roll <= 2 {
                char.playersLeft -= 1
                updatePlayersLeft()
                villainKillsBroadcast()
            } else {
                char.playersLeft -= 1
                updatePlayersLeft()
                randomBroadcast()
            }
        }
    }
    
    func randomChance() {
        let roll = Int.random(in: 0...100)
        let roll2 = Int.random(in: 0...100)
        if roll < chance && roll2 < char.playersLeft {
            killRando()
        }
//        let roll = Int.random(in: 0...(totalGameTime*totalGameTime))
//        if roll < (time.gameTimeInSeconds * time.gameTimeInSeconds) {
//            killRando()
//        }
    }

    func forceKillRando() {
        if char.playersLeft > 11 {
            char.playersLeft -= 1
            updatePlayersLeft()
            randomBroadcast()
        } else {
            print ("No more players to kill")
        }
    }
    
    func characterKillRando(character: String) {
        if char.playersLeft > 11 {
            let roll = Int.random(in: 0...(char.playersLeft-11))
            updateBroadcast()
            broadcastLineOneLabel.text = ("\(character) killed \(char.NPCList[roll])")
            char.broadcastLineOne = "\(broadcastLineOneLabel.text ?? "")"
            char.NPCList.remove(at: roll)
            char.playersLeft -= 1
            updatePlayersLeft()
        }
    }
    
    func randomBroadcast() {
        
        let roll = Int.random(in: 0...(char.playersLeft-11))
        var roll2 = Int.random(in: 0...(char.playersLeft-11))
        let roll3 = Int.random(in: 0...23)
        if (roll == roll2) && (roll != 99) {
            roll2 += 1
        } else if (roll == roll2) && (roll == 99) {
            roll2 -= 1
        }
        
        updateBroadcast()
        broadcastLineOneLabel.text = ("\(char.NPCList[roll]) \(char.killList[roll3]) \(char.NPCList[roll2])")
        char.broadcastLineOne = "\(broadcastLineOneLabel.text ?? "")"
        char.NPCList.remove(at: roll2)
    }
    
    func villainKillsBroadcast() {
        
        let roll = Int.random(in: 0...(char.playersLeft-11))
        let roll2 = Int.random(in: 0...23)
        
        updateBroadcast()
        broadcastLineOneLabel.text = "Evil Rick \(char.killList[roll2]) \(char.NPCList[roll])"
        char.broadcastLineOne = "\(broadcastLineOneLabel.text ?? "")"
        char.NPCList.remove(at: roll)
    }
    
    func updateBroadcast () {
        broadcastLineFiveLabel.text = broadcastLineFourLabel.text
        broadcastLineFourLabel.text = broadcastLineThreeLabel.text
        broadcastLineThreeLabel.text = broadcastLineTwoLabel.text
        broadcastLineTwoLabel.text = broadcastLineOneLabel.text
        
        char.broadcastLineTwo = "\(broadcastLineTwoLabel.text ?? "")"
        char.broadcastLineThree = "\(broadcastLineThreeLabel.text ?? "")"
        char.broadcastLineFour = "\(broadcastLineFourLabel.text ?? "")"
        char.broadcastLineFive = "\(broadcastLineFiveLabel.text ?? "")"
        
        
    }
    
    func pauseGame() {
        if pauseIsActive == true {
            pauseLabel.alpha = 0.0
            pauseIsActive = false
        } else {
            pauseLabel.alpha = 1.0
            pauseIsActive = true
        }
    }
}
