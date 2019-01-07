//
//  Characters.swift
//  Battle Royale 2
//
//  Created by Kyle Schneider on 12/3/18.
//  Copyright © 2018 Kyle Schneider›‹. All rights reserved.
//

import Foundation

var char: Characters = Characters ()

class Characters: NSObject {
   
    var playersLeft = 100
    
    var broadcastLineOne = ""
    var broadcastLineTwo = ""
    var broadcastLineThree = ""
    var broadcastLineFour = ""
    var broadcastLineFive = ""
    
    
    let characterListPlain = [
        "Alaqua",
        "Tokobette",
        "Auran",
        "Zinnakahn",
        "Meta",
        "Snara Narke"
    ]
    
    var killList = [
        "murdered",
        "skewered",
        "beheaded",
        "obliterated",
        "ripped in half",
        "decimated",
        "polymorphed",
        "decintegrated",
        "bled out",
        "sliced down",
        "assassinated",
        "destroyed",
        "massacred",
        "butchered",
        "liquified",
        "annihilated",
        "exterminated",
        "slaughtered",
        "eliminated",
        "ravaged",
        "smashed",
        "wasted",
        "defeated",
        "banished"
    ]
    
    var NPCList = [
        "Biff_Puncher", //1
        "L33ROYjenkins",//2
        "Parcival",//3
        "JudgeDredddd",//4
        "Mr.Christopher_Perkins",//5
        "Taser_Face",//6
        "Sylgar_Eater",//7
        "FuzzyPotter",//8
        "Inky",//9
        "Blinky",//10
        "Pinky",//11
        "Clyde",//12
        "MuggleB0rnSquib",//13
        "MisterEvil",//14
        "Tyler_Durnen",//15
        "MasterChief",//16
        "Stewie_Griffin",//17
        "Jack_Bauer",//18
        "Ron_Burgundy?",//19
        "Forrest,Forrest_Gump",//20
        "BuzzLightyear",//21
        "TheDude",//22
        "Squidward",//23
        "Ross_Gellar",//24
        "Bond,James_Bond",//25
        "Han_shot_1st",//26
        "Hello...McFly",//27
        "John_McClane",//28
        "The_Doe_Patronous",//29
        "Rambo",//30
        "Kevin_McCallister",//31
        "Sarah_Connor",//32
        "Maximus_Decimus_Meridius",//33
        "King_Leonidas",//34
        "Samwise*Rudy*",//35
        "Odds_in_my_favour",//36
        "Hans_Gruber",//37
        "Agent_Smith",//38
        "Travis_Barker",//39
        "Goku",//40
        "Dr._Sherlock_Strange",//41
        "Wick_is_Babayaga",//42
        "Dwayne_Johnson",//43
        "Dave_Grohl",//44
        "Raiden",//45
        "Daenerys",//46
        "Omin",//47
        "Jim_Darkmagic",//48
        "Viari",//49
        "Binwin_Bronzebottom",//50
        "X-Force_Peter",//51
        "Taxi_Dopinder",//52
        "Fluffy_Fingers",//53
        "Assistant_to_the_Dungeon_Manager",//54
        "8ruce_Wayne",//55
        "Bruce_Banner",//56
        "James_Gordon",//57
        "Rick_Grimes",//58
        "Linus_Van_Pelt",//59
        "Underdog",//60
        "Donatello",//61
        "Voldemort",//62
        "Stanley_Ipkiss",//63
        "Not_The_Mamma",//64
        "Michelin_Man",//65
        "Cookie_Monster",//66
        "The_Blue_Ranger",//67
        "Mowgli",//68
        "Santa's_Lil_Helper",//69
        "Voltron",//70
        "The_White_Rabit",//71
        "Optimus_Prime",//72
        "John_Bender",//73
        "Sailor_Moon",//74
        "Sheldon_Cooper",//75
        "Lara_Croft",//76
        "Walter_White",//77
        "The_10th_Doctor",//78
        "Drizzt Do'urden",//79
        "Chell",//80
        "Samuel_Flynn",//81
        "Kevin_Bacon",//82
        "Leeloo",//83
        "The_Bride",//84
        "Inigo_Montoya",//85
        "Prince_Humperdinck",//86
        "Sulley",//87
        "Buddy_Elf",//88
        "Carl_Friedricksen",//89
        "McLovin'",//90
    ]
//    func test() {
//        print ("kill rando")
//    }
//    func updatePlayersLeft () {
//        game.playersLeftLabel.text = "\(playersLeft)"
////        print(playersLeft)
//    }
//
//
//    func forceKillRando() {
//        if playersLeft > 11 {
//            print ("Forced random death", playersLeft)
//            playersLeft -= 1
//            char.updatePlayersLeft()
//            randomBroadcast()
//            game.broadcastLineOneLabel.text = "test"
//        } else {
//            print ("No more players to kill")
//        }
//    }
//
//    func characterKillRando(character: String) {
//        if playersLeft > 11 {
//            print ("\(character) killed rando")
//            playersLeft -= 1
//            char.updatePlayersLeft()
//        }
//    }
//
//    func killRando() {
//        if playersLeft > 11 {
//            let chance:Int = Int(timeMarker.position.x)
//            let roll = Int.random(in: 0...575)
//            if roll > abs(chance) {
//                let roll2 = Int.random(in: 1...10)
//                if roll2 <= 3 {
//                    print ("Main Villain Killed a Rando")
//                    playersLeft -= 1
//                    updatePlayersLeft()
//                    villainKillsBroadcast()
//                } else if roll2 <= 6 {
//                    print ("Rando Died")
//                    playersLeft -= 1
//                    updatePlayersLeft()
//                    randomBroadcast()
//                } else {
//                    print ("never mind")
//                }
//            }
//        } else {
//            print ("No more players to kill")
//        }
//    }
//    
//    func randomBroadcast() {
//        
//        let roll = Int.random(in: 0...(playersLeft-11))
//        var roll2 = Int.random(in: 0...(playersLeft-11))
//        if (roll == roll2) && (roll != 99) {
//            roll2 += 1
//        } else if (roll == roll2) && (roll == 99) {
//            roll2 -= 1
//        }
//        
//        game.updateBroadcast()
//        game.broadcastLineOneLabel.text = "\(char.NPCList[roll]) killed \(char.NPCList[roll2])"
//        char.NPCList.remove(at: roll2)
//    }
//    
//    func villainKillsBroadcast() {
//        
//        let roll = Int.random(in: 0...(playersLeft-11))
//        
//        game.updateBroadcast()
//        game.broadcastLineOneLabel.text = "Main Villain killed \(char.NPCList[roll])"
//        char.NPCList.remove(at: roll)
//    }
//    
//    func characterKillRandoBroadcast(character: String) {
//        let roll = Int.random(in: 0...(playersLeft-11))
//        
//        game.updateBroadcast()
//        game.broadcastLineOneLabel.text = "\(character) killed \(char.NPCList[roll])"
//        char.NPCList.remove(at: roll)
//    }

    
//    func updateBroadcast () {
//        game.broadcastLineFiveLabel.text = game.broadcastLineFourLabel.text
//        game.broadcastLineFourLabel.text = game.broadcastLineThreeLabel.text
//        game.broadcastLineThreeLabel.text = game.broadcastLineTwoLabel.text
//        game.broadcastLineTwoLabel.text = game.broadcastLineOneLabel.text
//    }
}

