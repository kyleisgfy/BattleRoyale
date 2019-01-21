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
    
    var alequaLabel:SKLabelNode = SKLabelNode()
    var tokobetteLabel:SKLabelNode = SKLabelNode()
    var auranLabel:SKLabelNode = SKLabelNode()
    var zinnekahnLabel:SKLabelNode = SKLabelNode()
    var metaLabel:SKLabelNode = SKLabelNode()
    var snaraNarkeLabel:SKLabelNode = SKLabelNode()
    
    var officeLabel:SKLabelNode = SKLabelNode()
    var youTubeLabel:SKLabelNode = SKLabelNode()
    var harryPotterLabel:SKLabelNode = SKLabelNode()
    var beastsLabel:SKLabelNode = SKLabelNode()
    var terribleFoeLabel:SKLabelNode = SKLabelNode()
    var specialNPCLabel:SKLabelNode = SKLabelNode()
    
    var sub1Label:SKLabelNode = SKLabelNode()
    var sub2Label:SKLabelNode = SKLabelNode()
    var sub3Label:SKLabelNode = SKLabelNode()
    var sub4Label:SKLabelNode = SKLabelNode()
    var sub5Label:SKLabelNode = SKLabelNode()
    var sub6Label:SKLabelNode = SKLabelNode()
    
    var x: CGFloat = 0.0
    var y: CGFloat = 0.0
    
    var eventNumber = 1
    var phaseNumber = 0
    
    var timeModifier = 30
    var freeTime = 90
    var restrictInTime = 30
    var restrictTime = 60
    
    var totalGameTime = 5
    var timeIndicator = CGFloat(0)
    
    var pauseIsActive = false
    
    var chance = 4
    
    let alarmSound = SKAudioNode(fileNamed: "alarmSound.mp3")
    let bombSound = SKAudioNode(fileNamed: "bombSound.mp3")
    let bellSound = SKAudioNode(fileNamed: "bellSound.mp3")
    let freeTimeSound = SKAudioNode(fileNamed: "solemnVow.mp3")
    let restrictInSound = SKAudioNode(fileNamed: "darkContinent.mp3")
    let restrictSound = SKAudioNode(fileNamed: "fieldOfHeroes.mp3")

    
    override func sceneDidLoad() {
        freeTime = (3 * timeModifier)
        restrictInTime = (1 * timeModifier)
        restrictTime = (2 * timeModifier)
        
        createIcons()
        
        var i = 0
        while i < 6 {
            self.addChild(characterButtons[i]!)
            self.addChild(typeButtons[i]!)
            self.addChild(subListButtons[i]!)
            i += 1
        }
        
        self.addChild(clickZoneNode)
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
        
        self.addChild(freeTimeSound)
        self.addChild(restrictInSound)
        self.addChild(restrictSound)
        
        self.addChild(alarmSound)
        self.addChild(bombSound)
        self.addChild(bellSound)
        
        freeTimeSound.run(SKAction.stop())
        restrictInSound.run(SKAction.stop())
        restrictSound.run(SKAction.stop())
        alarmSound.run(SKAction.stop())
        bombSound.run(SKAction.stop())
        bellSound.run(SKAction.stop())
        
        totalGameTime = ((freeTime * 5) + (restrictInTime * 4) + (restrictTime * 4))
        timeIndicator = (CGFloat(barWidth * 27) / CGFloat(totalGameTime))
        
        runGameTimer()
        runPhase()
        pauseGame()
        inicializeLabels()
        
         self.lastUpdateTime = 0
        }
    
    func inicializeLabels() {
        if let GameTimer:SKLabelNode = self.childNode(withName: "gameTimerLabel") as? SKLabelNode {
            gameTimerLabel = GameTimer
            gameTimerLabel.text = ""
            print ("Game time in seconds inicialized")
        } else {
            print ("Game time label Failed")
        }
        
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
        
        if let alequa:SKLabelNode = self.childNode(withName: "alequaLabel") as? SKLabelNode {
            alequaLabel = alequa
            print ("Alequa Label inicialized")
            alequaLabel.text = "Alequa"
            alequaLabel.position.x = (characterButtons[0]!.position.x + 20)
            alequaLabel.position.y = (characterButtons[0]!.position.y - 10)
        } else {
            print ("Alequa label Failed")
        }
        
        if let tokobette:SKLabelNode = self.childNode(withName: "tokobetteLabel") as? SKLabelNode {
            tokobetteLabel = tokobette
            print ("Tokobette Label inicialized")
            tokobetteLabel.text = "Tokobette"
            tokobetteLabel.position.x = (characterButtons[1]!.position.x + 20)
            tokobetteLabel.position.y = (characterButtons[1]!.position.y - 10)
        } else {
            print ("Tokobette label Failed")
        }
        
        if let auran:SKLabelNode = self.childNode(withName: "auranLabel") as? SKLabelNode {
            auranLabel = auran
            print ("auran Label inicialized")
            auranLabel.text = "Auran"
            auranLabel.position.x = (characterButtons[2]!.position.x + 20)
            auranLabel.position.y = (characterButtons[2]!.position.y - 10)
        } else {
            print ("Auran label Failed")
        }
        
        if let zinnekahn:SKLabelNode = self.childNode(withName: "zinnekahnLabel") as? SKLabelNode {
            zinnekahnLabel = zinnekahn
            print ("Zinnekahn Label inicialized")
            zinnekahnLabel.text = "Zinnekahn"
            zinnekahnLabel.position.x = (characterButtons[3]!.position.x + 20)
            zinnekahnLabel.position.y = (characterButtons[3]!.position.y - 10)
        } else {
            print ("Zinnekahn label Failed")
        }
        
        if let meta:SKLabelNode = self.childNode(withName: "metaLabel") as? SKLabelNode {
            metaLabel = meta
            print ("Meta Label inicialized")
            metaLabel.text = "Meta"
            metaLabel.position.x = (characterButtons[4]!.position.x + 20)
            metaLabel.position.y = (characterButtons[4]!.position.y - 10)
        } else {
            print ("Meta label Failed")
        }
        
        if let snaraNarke:SKLabelNode = self.childNode(withName: "snaraNarkeLabel") as? SKLabelNode {
            snaraNarkeLabel = snaraNarke
            print ("Snara Narke Label inicialized")
            snaraNarkeLabel.text = "Snara Narke"
            snaraNarkeLabel.position.x = (characterButtons[5]!.position.x + 20)
            snaraNarkeLabel.position.y = (characterButtons[5]!.position.y - 10)
        } else {
            print ("Snara Narke label Failed")
        }
        
        if let office:SKLabelNode = self.childNode(withName: "officeLabel") as? SKLabelNode {
            officeLabel = office
            print ("Office Label inicialized")
            officeLabel.text = "Office"
            officeLabel.position.x = (typeButtons[0]!.position.x + 20)
            officeLabel.position.y = (typeButtons[0]!.position.y - 10)
        } else {
            print ("Office label Failed")
        }
        
        if let youTube:SKLabelNode = self.childNode(withName: "youTubeLabel") as? SKLabelNode {
            youTubeLabel = youTube
            print ("You Tube Label inicialized")
            youTubeLabel.text = "You Tube"
            youTubeLabel.position.x = (typeButtons[1]!.position.x + 20)
            youTubeLabel.position.y = (typeButtons[1]!.position.y - 10)
        } else {
            print ("You Tube label Failed")
        }
        
        if let harryPotter:SKLabelNode = self.childNode(withName: "harryPotterLabel") as? SKLabelNode {
            harryPotterLabel = harryPotter
            print ("Harry Potter Label inicialized")
            harryPotterLabel.text = "harryPotter"
            harryPotterLabel.position.x = (typeButtons[2]!.position.x + 20)
            harryPotterLabel.position.y = (typeButtons[2]!.position.y - 10)
        } else {
            print ("Harry Potter label Failed")
        }
        
        if let beasts:SKLabelNode = self.childNode(withName: "beastsLabel") as? SKLabelNode {
            beastsLabel = beasts
            print ("Beasts Label inicialized")
            beastsLabel.text = "Beasts"
            beastsLabel.position.x = (typeButtons[3]!.position.x + 20)
            beastsLabel.position.y = (typeButtons[3]!.position.y - 10)
        } else {
            print ("Beasts label Failed")
        }
        
        if let terribleFoe:SKLabelNode = self.childNode(withName: "terribleFoeLabel") as? SKLabelNode {
            terribleFoeLabel = terribleFoe
            print ("Terrible Foe Label inicialized")
            terribleFoeLabel.text = "Terrible Foe"
            terribleFoeLabel.position.x = (typeButtons[4]!.position.x + 20)
            terribleFoeLabel.position.y = (typeButtons[4]!.position.y - 10)
        } else {
            print ("Terrible Foe label Failed")
        }
        
        if let specialNPC:SKLabelNode = self.childNode(withName: "specialNPCLabel") as? SKLabelNode {
            specialNPCLabel = specialNPC
            print ("Special NPC Label inicialized")
            specialNPCLabel.text = "Special NPCs"
            specialNPCLabel.position.x = (typeButtons[5]!.position.x + 20)
            specialNPCLabel.position.y = (typeButtons[5]!.position.y - 10)
        } else {
            print ("Special NPC label Failed")
        }
        
        if let sub1:SKLabelNode = self.childNode(withName: "sub1Label") as? SKLabelNode {
            sub1Label = sub1
            print ("Sub 1 Label inicialized")
            sub1Label.text = ""
            sub1Label.position.x = (subListButtons[0]!.position.x + 20)
            sub1Label.position.y = (subListButtons[0]!.position.y - 10)
        } else {
            print ("Sub 1 label Failed")
        }
        
        if let sub2:SKLabelNode = self.childNode(withName: "sub2Label") as? SKLabelNode {
            sub2Label = sub2
            print ("Sub 2 Label inicialized")
            sub2Label.text = ""
            sub2Label.position.x = (subListButtons[1]!.position.x + 20)
            sub2Label.position.y = (subListButtons[1]!.position.y - 10)
        } else {
            print ("Sub 2 label Failed")
        }
        
        if let sub3:SKLabelNode = self.childNode(withName: "sub3Label") as? SKLabelNode {
            sub3Label = sub3
            print ("Sub 3 Label inicialized")
            sub3Label.text = ""
            sub3Label.position.x = (subListButtons[2]!.position.x + 20)
            sub3Label.position.y = (subListButtons[2]!.position.y - 10)
        } else {
            print ("Sub 3 label Failed")
        }
        
        if let sub4:SKLabelNode = self.childNode(withName: "sub4Label") as? SKLabelNode {
            sub4Label = sub4
            print ("Sub 4 Label inicialized")
            sub4Label.text = ""
            sub4Label.position.x = (subListButtons[3]!.position.x + 20)
            sub4Label.position.y = (subListButtons[3]!.position.y - 10)
        } else {
            print ("Sub 4 label Failed")
        }
        
        if let sub5:SKLabelNode = self.childNode(withName: "sub5Label") as? SKLabelNode {
            sub5Label = sub5
            print ("Sub 5 Label inicialized")
            sub5Label.text = ""
            sub5Label.position.x = (subListButtons[4]!.position.x + 20)
            sub5Label.position.y = (subListButtons[4]!.position.y - 10)
        } else {
            print ("Sub 5 label Failed")
        }
        
        if let sub6:SKLabelNode = self.childNode(withName: "sub6Label") as? SKLabelNode {
            sub6Label = sub6
            print ("Sub 6 Label inicialized")
            sub6Label.text = ""
            sub6Label.position.x = (subListButtons[5]!.position.x + 20)
            sub6Label.position.y = (subListButtons[5]!.position.y - 10)
        } else {
            print ("Sub 6 label Failed")
        }
        
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
    
    func characterButtonSelection(location: CGPoint) {
        var i = 0
        while i < 6 {
            if characterButtons[i]!.contains(location) {
                if buttons.characterButtonActive[i] == true {
                    characterButtons[i]!.color = .gray
                    buttons.characterButtonActive[i] = false
                } else if buttons.characterButtonActive[i] == false {
                    for index in characterButtons {
                        index!.color = .gray
                    }
                    for index in 0...5 {
                        buttons.characterButtonActive[index] = false
                    }
                    characterButtons[i]!.color = .red
                    buttons.characterButtonActive[i] = true
                }
            }
            i += 1
        }
    }
    
    func typeButtonSelection(location: CGPoint) {
        var i = 0
        while i < 6 {
            if typeButtons[i]!.contains(location) {
                if buttons.typeListButtonActive[i] == true {
                    typeButtons[i]!.color = .gray
                    buttons.typeListButtonActive[i] = false
                    hideButtons(array: subListButtons as! Array<SKSpriteNode>)
                } else if buttons.typeListButtonActive[i] == false {
                    showButtons(array: subListButtons as! Array<SKSpriteNode>)
                    for index in typeButtons {
                        index!.color = .gray
                    }
                    for index in 0...5 {
                        buttons.typeListButtonActive[index] = false
                    }
                    typeButtons[i]!.color = .red
                    buttons.typeListButtonActive[i] = true
                }
            }
            i += 1
        }
            setupSubText()
    }
    
    func subListButtonSelection(location: CGPoint) {
        var i = 0
        while i < 6 {
            if subListButtons[i]!.contains(location) {
                if buttons.subListButtonActive[i] == true {
                    subListButtons[i]!.color = .gray
                    buttons.subListButtonActive[i] = false
                } else if buttons.subListButtonActive[i] == false {
                    for index in subListButtons {
                        index!.color = .gray
                    }
                    for index in 0...5 {
                        buttons.subListButtonActive[index] = false
                    }
                    subListButtons[i]!.color = .red
                    buttons.subListButtonActive[i] = true
                }
            }
            i += 1
        }
    }
    
    override func mouseDown(with event: NSEvent) {
        self.touchDown(atPoint: event.location(in: self))
        
        characterButtonSelection(location: event.location(in: self))
        typeButtonSelection(location: event.location(in: self))
        subListButtonSelection(location: event.location(in: self))
        
        if clickZoneNode.contains(event.location(in: self)) {
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
                if time.phaseTimerInSeconds >= 60 {
                    time.phaseTimerInSeconds -= 60
                    eventBoarder.position.x = eventBoarder.position.x + CGFloat((60 * timeIndicator))
                }
            } else {
                print ("cannot decrease time")
            }
            
        case 24: //plus key
            if phaseNumber == 0 || phaseNumber == 1 {
                if time.phaseTimerInSeconds <= freeTime - 120 {
                    time.phaseTimerInSeconds += 120
                    eventBoarder.position.x = eventBoarder.position.x - CGFloat((120 * timeIndicator))
                }
            } else {
                print ("cannot increase time")
            }
            
        case 36: //return
            forceKill()
            resetButtons()
//            characterKills()
        
        case 49: //spacebar
            pauseLabel.text = "Game is Paused"
            if phaseLabel.text == "" {
                phaseLabel.text = "Game introduction"
            }
            pauseGame()
            
        case 33: //open bracket {
            alarmSound.run(SKAction.changeVolume(by: -0.1, duration: 0))
            bombSound.run(SKAction.changeVolume(by: -0.1, duration: 0))
            bellSound.run(SKAction.changeVolume(by: -0.1, duration: 0))
        
        case 30: //close bracket }
            alarmSound.run(SKAction.changeVolume(by: 0.1, duration: 0))
            bombSound.run(SKAction.changeVolume(by: 0.1, duration: 0))
            bellSound.run(SKAction.changeVolume(by: 0.1, duration: 0))
            
        case 51: //delete
            alarmSound.run(SKAction.stop())
            bombSound.run(SKAction.stop())
            bellSound.run(SKAction.stop())
            
        case 44: //question mark
            eventBoarder.position.x = eventBoarder.position.x + (CGFloat(timeIndicator) * (CGFloat(time.phaseTimerInSeconds) - 1.0))
            time.phaseTimerInSeconds = 0
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
            if eventBoarder.position.x < CGFloat(barWidth * 27 / 2) {
                    eventBoarder.position.x = eventBoarder.position.x + CGFloat(timeIndicator)
            }
            randomChance()
            runAudio()
            runSoundFX()
            stopFX()
            gameTimerLabel.text = timeString(time: TimeInterval(time.gameTimeInSeconds))
            if time.restrictionTimer.isValid == true {
                if restrictionLabel.alpha == 0.0 {
                    restrictionLabel.alpha = 1.0
                } else {
                    restrictionLabel.alpha = 0.0
                }
            }
            restrictTheScreen()
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
            restrictInSound.run(SKAction.stop())
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
            restrictSound.run(SKAction.stop())
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
            freeTimeSound.run(SKAction.stop())
            time.phaseTimerInSeconds = restrictTime
            runPhaseTimer()
        default:
            print ("Phase number is out of scope to move forward.")
        }
    }
    
    func pauseGame() {
        if pauseIsActive == true {
            pauseLabel.alpha = 0.0
            pauseIsActive = false
            splash.removeFromParent()
        } else {
            pauseLabel.alpha = 1.0
            pauseIsActive = true
        }
    }
    
    func runAudio() {
        if phaseNumber == 1 && time.phaseTimerInSeconds == freeTime {
            freeTimeSound.run(SKAction.changeVolume(to: 1.0, duration: 0))
            freeTimeSound.run(SKAction.play())
            restrictSound.run(SKAction.changeVolume(to: 0.0, duration: 2))
        } else if phaseNumber == 2 && time.phaseTimerInSeconds == restrictInTime {
            restrictInSound.run(SKAction.changeVolume(to: 1.0, duration: 0))
            restrictInSound.run(SKAction.play())
            freeTimeSound.run(SKAction.changeVolume(to: 0.0, duration: 4))
        } else if phaseNumber == 3 && time.phaseTimerInSeconds == restrictTime {
            restrictSound.run(SKAction.changeVolume(to: 1.0, duration: 0))
            restrictSound.run(SKAction.play())
            restrictInSound.run(SKAction.changeVolume(to: 0.0, duration: 2))
        }
    }
    
    func runSoundFX() {
        if phaseNumber == 1 && time.phaseTimerInSeconds <= 1 {
            alarmSound.run(SKAction.play())
        } else if phaseNumber == 2 && time.phaseTimerInSeconds <= 1 {
            bombSound.run(SKAction.play())
        } else if phaseNumber == 3 && time.phaseTimerInSeconds <= 1 {
            bellSound.run(SKAction.play())
        } else if phaseNumber == 4 && time.phaseTimerInSeconds <= 1 {
            bellSound.run(SKAction.play())
        }
    }
    
    func stopFX() {
        if phaseNumber == 2 && time.phaseTimerInSeconds == (restrictInTime - 7) {
            alarmSound.run(SKAction.stop())
        } else if phaseNumber == 3 && time.phaseTimerInSeconds == (restrictTime - 10) {
            bombSound.run(SKAction.stop())
        } else if phaseNumber == 1 && time.phaseTimerInSeconds == (freeTime - 4) {
            bellSound.run(SKAction.stop())
        } else if phaseNumber == 4 && time.phaseTimerInSeconds == (freeTime - 4) {
            bellSound.run(SKAction.stop())
        }
    }
    
    func resetButtons() {
        var i = 0
        while i < 6 {
            characterButtons[i]!.color = .gray
            buttons.characterButtonActive[i] = false
            typeButtons[i]!.color = .gray
            buttons.typeListButtonActive[i] = false
            subListButtons[i]!.color = .gray
            buttons.subListButtonActive[i] = false
            i += 1
        }
    }
    
    func hideButtons(array: Array<SKSpriteNode>) {
        for i in 0...5 {
            array[i].alpha = 0.0
        }
    }
    
    func showButtons(array: Array<SKSpriteNode>) {
        for i in 0...5 {
            array[i].alpha = 1.0
        }
    }
    
    
    
//****************************************************************************************
// functions for broadcast and label text
//****************************************************************************************
    
    func updatePlayersLeft () {
        playersLeftLabel.text = "\(char.playersLeft)"
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
        let roll3 = Int.random(in: 0...24)
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
    
    func characterKills(playerName: Int) {
        characterKillRando(character: "\(char.characterListPlain[playerName])")
        resetButtons()
    }
    
    func returnBoolNumber(array: Array<Bool>) -> Int {
        var i = 0
        var number = 6
        while i < 6 {
            if array[i] == true {
                number = i
                return number
//                i += 1
            } else {
                i += 1
            }
        }
        return number
    }
    
    func forceKill() {
        let characterIndex = returnBoolNumber(array: buttons.characterButtonActive)
        let typeIndex = returnBoolNumber(array: buttons.typeListButtonActive)
        let subIndex = returnBoolNumber(array: buttons.subListButtonActive)
        if characterIndex == 6 {
            forceKillRando()
        } else if typeIndex == 6 {
            characterKills(playerName: characterIndex)
        } else if typeIndex != 6 && characterIndex != 6 && subIndex != 6 {
            characterKillsType(playerName: characterIndex, type: typeIndex, subName: subIndex)
        }
        
    }
    
    func characterKillsType(playerName: Int, type: Int, subName: Int) {
        updateBroadcast()
        switch type {
        case 0:
            broadcastLineOneLabel.text = ("\(char.characterListPlain[playerName]) killed \(char.officeGroup[subName])")
            char.playersLeft -= 1
        case 1:
            broadcastLineOneLabel.text = ("\(char.characterListPlain[playerName]) killed \(char.youTubeGroup[subName])")
            char.playersLeft -= 1
        case 2:
            broadcastLineOneLabel.text = ("\(char.characterListPlain[playerName]) killed \(char.harryPotterGroup[subName])")
            char.playersLeft -= 1
        case 3:
            broadcastLineOneLabel.text = ("\(char.characterListPlain[playerName]) killed \(char.beasts[subName])")
        case 4:
            broadcastLineOneLabel.text = ("\(char.characterListPlain[playerName]) killed \(char.terribleFoes[subName])")
        case 5:
            broadcastLineOneLabel.text = ("\(char.characterListPlain[playerName]) killed \(char.specialNPCs[subName])")
            char.playersLeft -= 1
        default:
            print ("error")
        }
            char.broadcastLineOne = "\(broadcastLineOneLabel.text ?? "")"
            updatePlayersLeft()
    }
    
    func setupSubText() {
        let typeIndex = returnBoolNumber(array: buttons.typeListButtonActive)
        switch typeIndex {
        case 0:
            writeSubText(array: char.officeGroup)
        case 1:
            writeSubText(array: char.youTubeGroup)
        case 2:
            writeSubText(array: char.harryPotterGroup)
        case 3:
            writeSubText(array: char.beasts)
        case 4:
            writeSubText(array: char.terribleFoes)
        case 5:
            writeSubText(array: char.specialNPCs)
        default:
            writeSubText(array: char.blank)
        }
    }
    
    func writeSubText(array: Array<String>) {
        sub1Label.text = "\(array[0])"
        sub2Label.text = "\(array[1])"
        sub3Label.text = "\(array[2])"
        sub4Label.text = "\(array[3])"
        sub5Label.text = "\(array[4])"
        sub6Label.text = "\(array[5])"
    }
    
    
    

}
