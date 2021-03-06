//
//  GameScene.swift
//  Battle Royale 2
//
//  Created by Kyle Schneider
//  Copyright © 2018 Kyle Schneider›‹. All rights reserved.
//

import SpriteKit
import GameplayKit

var game: GameScene = GameScene ()

class GameScene: SKScene {
    var entities = [GKEntity]()
    var graphs = [String : GKGraph]()
    private var lastUpdateTime : TimeInterval = 0
    
    var inicialSize = CGFloat(1436)
    var currentSize = CGFloat(0)
    var nextSize = CGFloat(0)
    
    var timeModifier = 300
    var freeTime = 3
    var restrictInTime = 1
    var restrictTime = 2
    
    var chance = 2
    let deathRates = [1, 2, 4, 8]
    
    let alarmSoundVolume = Float(0.3)
    let bombSoundVolume = Float(0.5)
    let bellSoundVolume = Float(0.8)
    let introVolume = Float(0.05)
    
    
    var gameTimerLabel:SKLabelNode = SKLabelNode()
    var restrictionTimerLabel:SKLabelNode = SKLabelNode()
    
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
    
    var deathRateLabel:SKLabelNode = SKLabelNode()
    var death1Label:SKLabelNode = SKLabelNode()
    var death2Label:SKLabelNode = SKLabelNode()
    var death3Label:SKLabelNode = SKLabelNode()
    var death4Label:SKLabelNode = SKLabelNode()
    
    var eventLocation = CGPoint(x: 0, y: 0)
    var nextEventLocation = CGPoint(x: 0, y: 0)
    
    var poisonGas = SKEmitterNode()
    
    var x: CGFloat = 0.0
    var y: CGFloat = 0.0
    
    var eventNumber = 0
    var phaseNumber = 0
    
    var totalGameTime = 0
    var timeIndicator = CGFloat(0)
    
    var pauseIsActive = false
    var skipRestrictionBool = false
    
    let introSound = SKAudioNode(fileNamed: "introSound.mp3")
    let alarmSound = SKAudioNode(fileNamed: "alarmSound.mp3")
    let bombSound = SKAudioNode(fileNamed: "bombSound.mp3")
    let bellSound = SKAudioNode(fileNamed: "bellSound.mp3")
    let superHero = SKAudioNode(fileNamed: "superHero")
    let firstSong = SKAudioNode(fileNamed: "weirderThings.mp3")
    let freeTimeSound = SKAudioNode(fileNamed: "solemnVow.mp3")
    let restrictInSound = SKAudioNode(fileNamed: "darkContinent.mp3")
    let restrictSound = SKAudioNode(fileNamed: "fieldOfHeroes.mp3")
    
    var playerCreationIsActive = true
    var editingCharacterNames = false
    var playerCharacterNumber = 0
    
    var startGameLabel = SKLabelNode()
    
    
    
    override func sceneDidLoad() {
        
        freeTime = (3 * timeModifier)
        restrictInTime = (1 * timeModifier)
        restrictTime = (2 * timeModifier)
        totalGameTime = ((freeTime * 5) + (restrictInTime * 4) + (restrictTime * 4))
        timeIndicator = (CGFloat(barWidth * 27) / CGFloat(totalGameTime))
        
        currentSize = inicialSize
        nextSize = (inicialSize/2)
        
        createIcons()
        
        var i = 0
        while i < 6 {
            self.addChild(characterButtons[i]!)
            self.addChild(typeButtons[i]!)
            self.addChild(subListButtons[i]!)
            i += 1
        }
        
        for i in 0...3 {
            self.addChild(deathRateButtons[i]!)
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
        
        self.addChild(superHero)
        self.addChild(firstSong)
        self.addChild(freeTimeSound)
        self.addChild(restrictInSound)
        self.addChild(restrictSound)
        
        self.addChild(introSound)
        self.addChild(alarmSound)
        self.addChild(bombSound)
        self.addChild(bellSound)
        

        self.addChild(cropNode)
        
        self.addChild(splashBackground)
        self.addChild(splashLogo)
        
        self.addChild(startGameButton)
        self.addChild(startGameLabel)
        
        self.addChild(deathRateBoarder)
        
        
        poisonGas = SKEmitterNode(fileNamed: "MyParticle1")!
        poisonGas.position = CGPoint(x: 0, y: 0)
        addChild(poisonGas)
        
        setTextBackground()
        self.addChild(textBackgroundNode)
        self.addChild(textNodeTab)
        self.addChild(textBackgroundBorderNode)
        self.addChild(textNodeTabBorder)
        
        introSound.run(SKAction.stop())
        firstSong.run(SKAction.stop())
        freeTimeSound.run(SKAction.stop())
        restrictInSound.run(SKAction.stop())
        restrictSound.run(SKAction.stop())
        alarmSound.run(SKAction.stop())
        bombSound.run(SKAction.stop())
        bellSound.run(SKAction.stop())
        superHero.run(SKAction.stop())
        
        setFXVolume()
        
        runGameTimer()
        runPhase()
        pauseGame()
        inicializeLabels()
        
        hideButtons(array: typeButtons as! Array<SKSpriteNode>)
        
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
//            alequaLabel.text = "Alequa"
            alequaLabel.text = "Player One"
            alequaLabel.position.x = (characterButtons[0]!.position.x + 20)
            alequaLabel.position.y = (characterButtons[0]!.position.y - 10)
            alequaLabel.zPosition = 9
            alequaLabel.fontColor = .lightGray
        } else {
            print ("Alequa label Failed")
        }
        
        if let tokobette:SKLabelNode = self.childNode(withName: "tokobetteLabel") as? SKLabelNode {
            tokobetteLabel = tokobette
            print ("Tokobette Label inicialized")
//            tokobetteLabel.text = "Tokobette"
            tokobetteLabel.text = "Player Two"
            tokobetteLabel.position.x = (characterButtons[1]!.position.x + 20)
            tokobetteLabel.position.y = (characterButtons[1]!.position.y - 10)
            tokobetteLabel.zPosition = 9
            tokobetteLabel.fontColor = .lightGray
        } else {
            print ("Tokobette label Failed")
        }
        
        if let auran:SKLabelNode = self.childNode(withName: "auranLabel") as? SKLabelNode {
            auranLabel = auran
            print ("auran Label inicialized")
//            auranLabel.text = "Auran"
            auranLabel.text = "Player Three"
            auranLabel.position.x = (characterButtons[2]!.position.x + 20)
            auranLabel.position.y = (characterButtons[2]!.position.y - 10)
            auranLabel.zPosition = 9
            auranLabel.fontColor = .lightGray
        } else {
            print ("Auran label Failed")
        }
        
        if let zinnekahn:SKLabelNode = self.childNode(withName: "zinnekahnLabel") as? SKLabelNode {
            zinnekahnLabel = zinnekahn
            print ("Zinnekahn Label inicialized")
//            zinnekahnLabel.text = "Zinnekahn"
            zinnekahnLabel.text = "Player Four"
            zinnekahnLabel.position.x = (characterButtons[3]!.position.x + 20)
            zinnekahnLabel.position.y = (characterButtons[3]!.position.y - 10)
            zinnekahnLabel.zPosition = 9
            zinnekahnLabel.fontColor = .lightGray
        } else {
            print ("Zinnekahn label Failed")
        }
        
        if let meta:SKLabelNode = self.childNode(withName: "metaLabel") as? SKLabelNode {
            metaLabel = meta
            print ("Meta Label inicialized")
//            metaLabel.text = "Meta"
            metaLabel.text = "Player Five"
            metaLabel.position.x = (characterButtons[4]!.position.x + 20)
            metaLabel.position.y = (characterButtons[4]!.position.y - 10)
            metaLabel.zPosition = 9
            metaLabel.fontColor = .lightGray
        } else {
            print ("Meta label Failed")
        }
        
        if let snaraNarke:SKLabelNode = self.childNode(withName: "snaraNarkeLabel") as? SKLabelNode {
            snaraNarkeLabel = snaraNarke
            print ("Snara Narke Label inicialized")
//            snaraNarkeLabel.text = "Snara Narke"
            snaraNarkeLabel.text = "Player Six"
            snaraNarkeLabel.position.x = (characterButtons[5]!.position.x + 20)
            snaraNarkeLabel.position.y = (characterButtons[5]!.position.y - 10)
            snaraNarkeLabel.zPosition = 9
            snaraNarkeLabel.fontColor = .lightGray
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
            harryPotterLabel.text = "Harry Potter"
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
        
        if let deathRate:SKLabelNode = self.childNode(withName: "deathRate") as? SKLabelNode {
            deathRateLabel = deathRate
            deathRateLabel.zPosition = 10
            print ("deathRateLabel inicialized")
        } else {
            print ("deathRateLabel Failed")
        }
        
        if let death1:SKLabelNode = self.childNode(withName: "death1") as? SKLabelNode {
            death1Label = death1
            death1Label.zPosition = 10
            print ("death1Label inicialized")
        } else {
            print ("death1Label Failed")
        }
        
        if let death2:SKLabelNode = self.childNode(withName: "death2") as? SKLabelNode {
            death2Label = death2
            death2Label.zPosition = 10
            print ("death2Label inicialized")
        } else {
            print ("death2Label Failed")
        }
        
        if let death3:SKLabelNode = self.childNode(withName: "death3") as? SKLabelNode {
            death3Label = death3
            death3Label.zPosition = 10
            print ("death3Label inicialized")
        } else {
            print ("death3Label Failed")
        }
        
        if let death4:SKLabelNode = self.childNode(withName: "death4") as? SKLabelNode {
            death4Label = death4
            death4Label.zPosition = 10
            print ("death4Label inicialized")
        } else {
            print ("death4Label Failed")
        }
        
        startGameLabel.text = "Click To Start Game"
        startGameLabel.position.x = 0
        startGameLabel.position.y = 0
        startGameLabel.zPosition = 10
        startGameLabel.fontColor = .white
        startGameLabel.fontSize = 35
        
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
    
    func deathRateSelection(location: CGPoint) {
        for i in 0...3 {
            if deathRateButtons[i]!.contains(location) {
                for x in 0...3 {
                    deathRateButtons[x]!.color = .clear
                    buttons.deathRateButtonActive[x] = false
                }
                deathRateButtons[i]!.color = .blue
                buttons.deathRateButtonActive[i] = true
            }
        }
        setRateOfDeath()
    }
    
    func characterButtonSelection(location: CGPoint) {
        var i = 0
        while i < 6 {
            if characterButtons[i]!.contains(location) && buttons.characterExists[i] == true {
                
                if buttons.characterButtonActive[i] == true {
                    characterButtons[i]!.color = .gray
                    buttons.characterButtonActive[i] = false
                } else if buttons.characterButtonActive[i] == false {
                    for i in 0...5 {
                        if buttons.characterExists[i] == true {
                            characterButtons[i]!.color = .gray
                        }
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
    
    func characterEditSelection(location: CGPoint) {
        var i = 0
        while i < 6 {
            if characterButtons[i]!.contains(location) {
                buttons.editCharacter = i
                char.characterListPlain[i] = ""
                characterButtons[i]!.color = .blue
                editingCharacterNames = true
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
                    shrinkButtonTab()
                } else if buttons.typeListButtonActive[i] == false && buttons.typeListButtonsDead[i] == false {
                    showButtons(array: subListButtons as! Array<SKSpriteNode>)
                    growButtonTab()
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
        killTypeButtons()
    }
    
    func killSubButtons() {
        let type = returnBoolNumber(array: buttons.typeListButtonActive)
        if type < 6 {
            for i in 0...5 {
                if buttons.subListButtonsDead[type][i] == true {
                    subListButtons[i]!.color = .black
                }
            }
        }
    }
    
    func killTypeButtons() {
        for type in 0...5 {
//        let type = returnBoolNumber(array: buttons.typeListButtonActive)
            var check = 0
            for i in 0...5 {
                if buttons.subListButtonsDead[type][i] == true {
                    check += 1
                }
            }
            if check == 6 {
                buttons.typeListButtonsDead[type] = true
                typeButtons[type]?.color = .black
            }
        }
    }
    
    func subListButtonSelection(location: CGPoint) {
        var i = 0
        let type = returnBoolNumber(array: buttons.typeListButtonActive)
        while i < 6 {
            if subListButtons[i]!.contains(location) {
                if buttons.subListButtonActive[i] == true {
                    subListButtons[i]!.color = .gray
                    buttons.subListButtonActive[i] = false
                } else if buttons.subListButtonActive[i] == false && buttons.subListButtonsDead[type][i] == false {
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
            killSubButtons()
            i += 1
        }
    }
    
    func startGameButtonSelection(location: CGPoint) {
        if startGameButton.contains(location) && playerCreationIsActive == true {
            createPlayerEnd()
        }
        
    }
    
    override func mouseDown(with event: NSEvent) {
        self.touchDown(atPoint: event.location(in: self))
        
        deathRateSelection(location: event.location(in: self))
        
        if playerCreationIsActive == true && editingCharacterNames == false {
            characterEditSelection(location: event.location(in: self))
        }
        
        startGameButtonSelection(location: event.location(in: self))
        if playerCreationIsActive == false {
            characterButtonSelection(location: event.location(in: self))
            typeButtonSelection(location: event.location(in: self))
            subListButtonSelection(location: event.location(in: self))
        }
    
        
        if textNodeTab.contains(event.location(in: self)) {
            moveButtonTab()
            if playerCreationIsActive == false {
                textBackgroundNode.zPosition = 3
                textNodeTab.zPosition = 3
                textBackgroundBorderNode.zPosition = 3
                textNodeTabBorder.zPosition = 3
            }
        }
        
        if clickZoneNode.contains(event.location(in: self)) {
            if phaseNumber == 1 {
                nextEventLocation = event.location(in: self)
            }
 
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
        if editingCharacterNames == true {
            if keycode == 36 {
                characterButtons[buttons.editCharacter]!.color = .gray
                buttons.playerExists[buttons.editCharacter] = true
                editPlayerEnd()
            }
            char.characterListPlain[buttons.editCharacter] = char.characterListPlain[buttons.editCharacter] + (event.characters!)
            updatePlayerButtonText()
            
        }
        let move = CGFloat(28.9)
        if playerCreationIsActive == false {
            switch keycode {
                
            case 126: //up arrow
                if teamIconNode.position.y < 317 {
                    teamIconNode.position.y = teamIconNode.position.y + move
                    teamIconNode2.run(SKAction.move(by: CGVector(dx: 0.0, dy: move), duration: 0.2))
                }
                
            case 125: //down arrow
                if teamIconNode.position.y > -317 {
                    teamIconNode.position.y = teamIconNode.position.y - move
                    teamIconNode2.run(SKAction.move(by: CGVector(dx: 0.0, dy: (move * -1)), duration: 0.2))
                }
                
            case 124: //right arrow
                if teamIconNode.position.x < 576 {
                    teamIconNode.position.x = teamIconNode.position.x + move
                    teamIconNode2.run(SKAction.move(by: CGVector(dx: move, dy: 0.0), duration: 0.2))
                }
                
            case 123: //left arrow
                if teamIconNode.position.x > -576 {
                    teamIconNode.position.x = teamIconNode.position.x - move
                    teamIconNode2.run(SKAction.move(by: CGVector(dx: (move * -1), dy: 0.0), duration: 0.2))
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
                resetCharacterButtons()
                
            case 49: //spacebar
                if eventNumber == 0 {
                    gameIntro()
                    eventNumber += 1
                }
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
                stopFX()
                
            case 44: //question mark
                eventBoarder.position.x = eventBoarder.position.x + (CGFloat(timeIndicator) * (CGFloat(time.phaseTimerInSeconds) - 1.0))
                time.phaseTimerInSeconds = 0
                time.restrictionTimeInSeconds = 0
                if phaseNumber == 3 {
                    skipRestriction()
                    skipRestrictionBool = true
                }
            case 6:
                moveButtonTab()
                
            default:
                print("keyDown: \(event.characters!) keyCode: \(event.keyCode)")
            }
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
            }
            restrictionTimerLabel.text = timeString(time: TimeInterval(time.restrictionTimeInSeconds))
        } else {
        }
        time.restrictionTimeString = "\(restrictionTimerLabel.text ?? "")"
    }
    
    func nodeToSecondView() {
        
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
            gameTimerLabel.text = timeString(time: TimeInterval(time.gameTimeInSeconds))
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
                let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
    }
    
    func phaseTimerFired () {
        time.phaseTimer.invalidate()
        if phaseNumber == 2 {
            setRadius()
        }
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
    
    func setRadius() {
        inicialSize = currentSize
        nextSize = (inicialSize / 2)
        x = ((nextEventLocation.x - eventLocation.x) / CGFloat((restrictTime)))
        y = ((nextEventLocation.y - eventLocation.y) / CGFloat((restrictTime)))
    }
    
    func restrictTheScreen() {
        if pauseIsActive == false {
            if phaseNumber == 3 && skipRestrictionBool == false {
                
                currentSize = (currentSize - ((inicialSize - nextSize) / CGFloat(restrictTime)))
                safeZone.size.width = currentSize
                safeZone.size.height = currentSize
                eventLocation.x = eventLocation.x + x
                eventLocation.y = eventLocation.y + y
                safeZone.position = eventLocation
                
                safeZone2.size = safeZone.size
                safeZone2.position = safeZone.position
            } else if skipRestrictionBool == true {
                skipRestrictionBool = false
            }
        }
        
    }
    
    func skipRestriction() {
        currentSize = nextSize
        eventLocation = nextEventLocation
        
        safeZone.size.width = currentSize
        safeZone.size.height = currentSize
        safeZone.position = eventLocation
        
        safeZone2.size = safeZone.size
        safeZone2.position = safeZone.position
        
    }
    
    func runPhase() {
        switch phaseNumber {
        case 0:
            phaseLabel.text = "Game start introduction"
            time.phaseTimerInSeconds = freeTime
            runPhaseTimer()
        case 1:
            teamIconNode2.alpha = 1.0
            phaseLabel.text = "Nothing will occur for"
            time.restrictionTimeString = ("")
            time.restrictionLabelString = ("")
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
            time.restrictionLabelString = ("RESTRICT IN...")
            restrictSound.run(SKAction.stop())
            superHero.run(SKAction.stop())
            time.phaseTimerInSeconds = restrictInTime
            runRestrictionTimer()
            runPhaseTimer()
            if eventNumber == 1 {
                poisonGasNode.position = eventOneNode.position
                eventOneNode2.position.x = eventOneNode.position.x
                eventOneNode2.position.y = eventOneNode.position.y
                eventOneNode2.strokeColor = eventOneNode.strokeColor
                eventOneNode2.alpha = 1.0
            } else if eventNumber == 2 {
                eventTwoNode2.position.x = eventTwoNode.position.x
                eventTwoNode2.position.y = eventTwoNode.position.y
                eventTwoNode2.strokeColor = eventTwoNode.strokeColor
                eventTwoNode2.alpha = 1.0
            } else if eventNumber == 3 {
                eventThreeNode2.position.x = eventThreeNode.position.x
                eventThreeNode2.position.y = eventThreeNode.position.y
                eventThreeNode2.strokeColor = eventThreeNode.strokeColor
                eventThreeNode2.alpha = 1.0
            } else if eventNumber == 4 {
                eventFourNode2.position.x = eventFourNode.position.x
                eventFourNode2.position.y = eventFourNode.position.y
                eventFourNode2.strokeColor = eventFourNode.strokeColor
                eventFourNode2.alpha = 1.0
            }
            
        case 3:
            phaseLabel.text = "Safe zone is restricting"
            time.restrictionLabelString = ("RESTRICTING")
            freeTimeSound.run(SKAction.stop())
            time.phaseTimerInSeconds = restrictTime
            runPhaseTimer()
        case 4:
            print ("End Game")
            let playSoundFX = SKAction.play()
            let stopSoundFX = SKAction.stop()
            let wait4 = SKAction.wait(forDuration: 4)
            restrictSound.run(SKAction.changeVolume(to: 0.0, duration: 2))
            bellSound.run(SKAction.sequence([playSoundFX, wait4, stopSoundFX]))
            superHero.run(SKAction.changeVolume(to: 1.0, duration: 0))
            superHero.run(SKAction.play())
            time.restrictionLabelString = ""
            
            super.run(SKAction.play())
            
        default:
            print ("Phase number is out of scope to move forward.")
        }
    }
    
    func gameIntro() {
        superHero.run(SKAction.changeVolume(to: 0.0, duration: 5))
        firstSong.run(SKAction.play())

        let playSound = SKAction.play()
        let wait5 = SKAction.wait(forDuration: 5)
        let stopSound = SKAction.stop()
        introSound.run(SKAction.sequence([wait5, playSound, wait5, stopSound]))
        
        
        let splashTextScale = SKAction.scale(by: 10, duration: 5)
        let splashTextFade = SKAction.fadeOut(withDuration: 2)
        let splashGroup = SKAction.group([splashTextScale, splashTextFade])
        splashText2.run(SKAction.sequence([wait5, splashGroup]))
        
        
        let splashBackgroundFade = SKAction.fadeOut(withDuration: 3)
        splashBackground2.run(SKAction.sequence([wait5, splashBackgroundFade]))
        
        let logoMove = SKAction.move(to: CGPoint(x: -450, y: -180), duration: 1)
        let logoScale = SKAction.scale(to: 0.4 , duration: 1)
        let logoGroup = SKAction.group([logoMove, logoScale])
        let wait3 = SKAction.wait(forDuration: 3)
        splashLogo2.run(SKAction.sequence([wait5, wait3, logoGroup]))
        
        
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
    
    func runAudio() {
        if phaseNumber == 1 && time.phaseTimerInSeconds == freeTime {
            firstSong.run(SKAction.changeVolume(to: 0.0, duration: 2))
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
        let playSoundFX = SKAction.play()
        let stopSoundFX = SKAction.stop()
        let wait7 = SKAction.wait(forDuration: 7)
        let wait8 = SKAction.wait(forDuration: 8)
        let wait4 = SKAction.wait(forDuration: 4)
        
        if phaseNumber == 1 && time.phaseTimerInSeconds <= 1 {
            alarmSound.run(SKAction.sequence([playSoundFX, wait7, stopSoundFX]))
        } else if phaseNumber == 2 && time.phaseTimerInSeconds <= 1 {
            bombSound.run(SKAction.sequence([playSoundFX, wait8, stopSoundFX]))
        } else if phaseNumber == 3 && time.phaseTimerInSeconds <= 1 {
            bellSound.run(SKAction.sequence([playSoundFX, wait4, stopSoundFX]))
        } //else if phaseNumber == 4 && time.phaseTimerInSeconds <= 1 {
//            bellSound.run(SKAction.sequence([playSoundFX, wait4, stopSoundFX]))
//        }
    }
    
    func stopFX() {
        alarmSound.run(SKAction.stop())
        bombSound.run(SKAction.stop())
        bellSound.run(SKAction.stop())
    }
    
    func setFXVolume() {
        alarmSound.run(SKAction.changeVolume(to: alarmSoundVolume, duration: 0))
        bombSound.run(SKAction.changeVolume(to: bombSoundVolume, duration: 0))
        bellSound.run(SKAction.changeVolume(to: bellSoundVolume, duration: 0))
        introSound.run(SKAction.changeVolume(to: introVolume, duration: 0))
    }
    
    func resetCharacterButtons() {
        var i = 0
        while i < 6 {
            characterButtons[i]!.color = .gray
            buttons.characterButtonActive[i] = false
            i += 1
        }
    }
    
    func resetSubListButtons() {
        var i = 0
        while i < 6 {
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
            array[i].alpha = 0.5
        }
    }
    
    func normalizeButtonTab() {
        textBackgroundNode.run(SKAction.scale(to: CGSize(width: 210, height: 420), duration: 0.5))
        textBackgroundNode.run(SKAction.moveTo(y: 115, duration: 0.5))
        textBackgroundBorderNode.run(SKAction.scale(to: CGSize(width: 215, height: 430), duration: 0.5))
        textBackgroundBorderNode.run(SKAction.moveTo(y: 115, duration: 0.5))
    }
    
    
    func shrinkButtonTab() {
        if textBackgroundNode.size.height > 500 {
            textBackgroundNode.size.height = textBackgroundNode.size.height - 200
            textBackgroundNode.position.y = textBackgroundNode.position.y + 100
            textBackgroundBorderNode.size.height = textBackgroundBorderNode.size.height - 200
            textBackgroundBorderNode.position.y = textBackgroundBorderNode.position.y + 100
        }
    }
    
    func growButtonTab() {
        if textBackgroundNode.size.height < 500 {
            textBackgroundNode.size.height = textBackgroundNode.size.height + 200
            textBackgroundNode.position.y = textBackgroundNode.position.y - 100
            textBackgroundBorderNode.size.height = textBackgroundBorderNode.size.height + 200
            textBackgroundBorderNode.position.y = textBackgroundBorderNode.position.y - 100
        }
    }
    
    
    
//****************************************************************************************
// functions for broadcast and label text
//****************************************************************************************
    
    func updatePlayersLeft () {
        playersLeftLabel.text = "\(char.playersLeft)"
    }
    
    func killRando() {
        if char.playersLeft > (playerCharacterNumber * 2) && phaseNumber != 0 {
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
        if char.playersLeft > (playerCharacterNumber * 2) {
            char.playersLeft -= 1
            updatePlayersLeft()
            randomBroadcast()
        } else {
            print ("No more players to kill")
        }
    }
    
    func characterKillRando(character: String) {
        if char.playersLeft > (playerCharacterNumber * 2) {
            let roll = Int.random(in: 0...(char.playersLeft-(playerCharacterNumber * 2)))
            updateBroadcast()
            broadcastLineOneLabel.text = ("\(character) killed \(char.NPCList[roll])")
            char.broadcastLineOne = "\(broadcastLineOneLabel.text ?? "")"
            char.NPCList.remove(at: roll)
            char.playersLeft -= 1
            updatePlayersLeft()
        }
    }
    
    func randomBroadcast() {
        let roll = Int.random(in: 0...(char.playersLeft-(playerCharacterNumber * 2)))
        var roll2 = Int.random(in: 0...(char.playersLeft-(playerCharacterNumber * 2)))
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
        let roll = Int.random(in: 0...(char.playersLeft-(playerCharacterNumber * 2)))
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
        resetCharacterButtons()
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
            switch subIndex {
            case 0:
                subDied(subLabel: sub1Label, type: typeIndex, index: subIndex)
            case 1:
                subDied(subLabel: sub2Label, type: typeIndex, index: subIndex)
            case 2:
                subDied(subLabel: sub3Label, type: typeIndex, index: subIndex)
            case 3:
                subDied(subLabel: sub4Label, type: typeIndex, index: subIndex)
            case 4:
                subDied(subLabel: sub5Label, type: typeIndex, index: subIndex)
            case 5:
                subDied(subLabel: sub6Label, type: typeIndex, index: subIndex)
            default:
                print ("error: force kill")
            }
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
        resetSubListButtons()
        killSubButtons()
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
    
    func subDied(subLabel: SKLabelNode, type: Int, index: Int) {
        subLabel.color = .black
        subListButtons[index]!.color = .black
        buttons.subListButtonsDead[type][index] = true
        killTypeButtons()
    }
    
    func moveButtonTab() {
        let moveValue = CGFloat(200)
        if textTabOpen == true {
            textBackgroundNode.run(SKAction.moveBy(x: (-1 * moveValue), y: 0, duration: 0.5))
            textNodeTab.run(SKAction.moveBy(x: (-1 * moveValue), y: 0, duration: 0.5))
            textBackgroundBorderNode.run(SKAction.moveBy(x: (-1 * moveValue), y: 0, duration: 0.5))
            textNodeTabBorder.run(SKAction.moveBy(x: (-1 * moveValue), y: 0, duration: 0.5))
            
            for i in 0...5 {
                characterButtons[i]?.run(SKAction.moveBy(x: (-1 * moveValue), y: 0, duration: 0.5))
                typeButtons[i]?.run(SKAction.moveBy(x: (-1 * moveValue), y: 0, duration: 0.5))
                subListButtons[i]?.run(SKAction.moveBy(x: (-1 * moveValue), y: 0, duration: 0.5))
            }
            alequaLabel.run(SKAction.moveBy(x: (-1 * moveValue), y: 0, duration: 0.5))
            tokobetteLabel.run(SKAction.moveBy(x: (-1 * moveValue), y: 0, duration: 0.5))
            auranLabel.run(SKAction.moveBy(x: (-1 * moveValue), y: 0, duration: 0.5))
            zinnekahnLabel.run(SKAction.moveBy(x: (-1 * moveValue), y: 0, duration: 0.5))
            metaLabel.run(SKAction.moveBy(x: (-1 * moveValue), y: 0, duration: 0.5))
            snaraNarkeLabel.run(SKAction.moveBy(x: (-1 * moveValue), y: 0, duration: 0.5))
            
            officeLabel.run(SKAction.moveBy(x: (-1 * moveValue), y: 0, duration: 0.5))
            youTubeLabel.run(SKAction.moveBy(x: (-1 * moveValue), y: 0, duration: 0.5))
            harryPotterLabel.run(SKAction.moveBy(x: (-1 * moveValue), y: 0, duration: 0.5))
            beastsLabel.run(SKAction.moveBy(x: (-1 * moveValue), y: 0, duration: 0.5))
            terribleFoeLabel.run(SKAction.moveBy(x: (-1 * moveValue), y: 0, duration: 0.5))
            specialNPCLabel.run(SKAction.moveBy(x: (-1 * moveValue), y: 0, duration: 0.5))
            
            sub1Label.run(SKAction.moveBy(x: (-1 * moveValue), y: 0, duration: 0.5))
            sub2Label.run(SKAction.moveBy(x: (-1 * moveValue), y: 0, duration: 0.5))
            sub3Label.run(SKAction.moveBy(x: (-1 * moveValue), y: 0, duration: 0.5))
            sub4Label.run(SKAction.moveBy(x: (-1 * moveValue), y: 0, duration: 0.5))
            sub5Label.run(SKAction.moveBy(x: (-1 * moveValue), y: 0, duration: 0.5))
            sub6Label.run(SKAction.moveBy(x: (-1 * moveValue), y: 0, duration: 0.5))
            
            textTabOpen = false
        } else if textTabOpen == false {
            textBackgroundNode.run(SKAction.moveBy(x: moveValue, y: 0, duration: 0.5))
            textNodeTab.run(SKAction.moveBy(x: moveValue, y: 0, duration: 0.5))
            textBackgroundBorderNode.run(SKAction.moveBy(x: moveValue, y: 0, duration: 0.5))
            textNodeTabBorder.run(SKAction.moveBy(x: moveValue, y: 0, duration: 0.5))
            for i in 0...5 {
                characterButtons[i]?.run(SKAction.moveBy(x: moveValue, y: 0, duration: 0.5))
                typeButtons[i]?.run(SKAction.moveBy(x: moveValue, y: 0, duration: 0.5))
                subListButtons[i]?.run(SKAction.moveBy(x: moveValue, y: 0, duration: 0.5))
            }
            alequaLabel.run(SKAction.moveBy(x: moveValue, y: 0, duration: 0.5))
            tokobetteLabel.run(SKAction.moveBy(x: moveValue, y: 0, duration: 0.5))
            auranLabel.run(SKAction.moveBy(x: moveValue, y: 0, duration: 0.5))
            zinnekahnLabel.run(SKAction.moveBy(x: moveValue, y: 0, duration: 0.5))
            metaLabel.run(SKAction.moveBy(x: moveValue, y: 0, duration: 0.5))
            snaraNarkeLabel.run(SKAction.moveBy(x: moveValue, y: 0, duration: 0.5))
            
            officeLabel.run(SKAction.moveBy(x: moveValue, y: 0, duration: 0.5))
            youTubeLabel.run(SKAction.moveBy(x: moveValue, y: 0, duration: 0.5))
            harryPotterLabel.run(SKAction.moveBy(x: moveValue, y: 0, duration: 0.5))
            beastsLabel.run(SKAction.moveBy(x: moveValue, y: 0, duration: 0.5))
            terribleFoeLabel.run(SKAction.moveBy(x: moveValue, y: 0, duration: 0.5))
            specialNPCLabel.run(SKAction.moveBy(x: moveValue, y: 0, duration: 0.5))
            
            sub1Label.run(SKAction.moveBy(x: moveValue, y: 0, duration: 0.5))
            sub2Label.run(SKAction.moveBy(x: moveValue, y: 0, duration: 0.5))
            sub3Label.run(SKAction.moveBy(x: moveValue, y: 0, duration: 0.5))
            sub4Label.run(SKAction.moveBy(x: moveValue, y: 0, duration: 0.5))
            sub5Label.run(SKAction.moveBy(x: moveValue, y: 0, duration: 0.5))
            sub6Label.run(SKAction.moveBy(x: moveValue, y: 0, duration: 0.5))
            textTabOpen = true
        }
        
    }
    
    func editPlayerEnd() {
        updatePlayerButtonText()
        editingCharacterNames = false
    }
    
    func updatePlayerButtonText() {
        switch buttons.editCharacter {
        case 0:
            alequaLabel.text = char.characterListPlain[buttons.editCharacter]
            alequaLabel.fontColor = .white
        case 1:
            tokobetteLabel.text = char.characterListPlain[buttons.editCharacter]
            tokobetteLabel.fontColor = .white
        case 2:
            auranLabel.text = char.characterListPlain[buttons.editCharacter]
            auranLabel.fontColor = .white
        case 3:
            zinnekahnLabel.text = char.characterListPlain[buttons.editCharacter]
            zinnekahnLabel.fontColor = .white
        case 4:
            metaLabel.text = char.characterListPlain[buttons.editCharacter]
            metaLabel.fontColor = .white
        case 5:
            snaraNarkeLabel.text = char.characterListPlain[buttons.editCharacter]
            snaraNarkeLabel.fontColor = .white
        default:
            print ("error")
        }
    }
    
    func createPlayerEnd() {
        splashBackground.run(SKAction.fadeOut(withDuration: 2))
        splashLogo.run(SKAction.fadeOut(withDuration: 2))
        playerCreationIsActive = false
        setNumberOfPlayers()
        print (playerCharacterNumber)
        superHero.run(SKAction.play())
        startGameButton.removeFromParent()
        startGameLabel.removeFromParent()
        moveButtonTab()
        killCharacterButtons()
        normalizeButtonTab()
        showButtons(array: typeButtons as! Array<SKSpriteNode>)
        
    }
    
    func killCharacterButtons() {
        for i in 0...5 {
            if char.characterListPlain[i] == "\r" || char.characterListPlain[i] == "" {
                buttons.characterExists[i] = false
            }
            if buttons.characterExists[i] == false {
                characterButtons[i]!.color = .black
                
            }
        }
    }
    
    func setNumberOfPlayers() {
        for i in 0...5 {
            if buttons.playerExists[i] == true {
                playerCharacterNumber += 1
            }
        }
    }
    
    func setRateOfDeath() {
        for i in 0...3 {
            if buttons.deathRateButtonActive[i] == true {
                chance = deathRates[i]
            }
        }
        print (chance)
    }
    
    

}
