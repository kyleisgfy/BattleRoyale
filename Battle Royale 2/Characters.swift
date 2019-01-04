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
    
    let characterList = [
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
        "JudgeDredddddd",//4
        "Mr.Christopher_Perkins",//5
        "XXx_Taser_Face_xXX",//6
        "Sylgar_Eater",//7
        "FuzzyPotter",//8
        "Inky:D",//9
        "Blinky:D",//10
        "Pinky:D",//11
        "Clyde",//12
        "MuggleB0rnSquib",//13
        "MisterEvil",//14
        "15",//15
        "16",//16
        "17",//17
        "18",//18
        "19",//19
        "20",//20
        "21",//21
        "22",//22
        "23",//23
        "24",//24
        "25",//25
        "26",//26
        "27",//27
        "28",//28
        "29",//29
        "30",//30
        "31",//31
        "32",//32
        "33",//33
        "34",//34
        "35",//35
        "36",//36
        "37",//37
        "38",//38
        "39",//39
        "40",//40
        "41",//41
        "42",//42
        "43",//43
        "44",//44
        "45",//45
        "46",//46
        "47",//47
        "48",//48
        "49",//49
        "50",//50
        "51",//51
        "52",//52
        "53",//53
        "54",//54
        "55",//55
        "56",//56
        "57",//57
        "58",//58
        "59",//59
        "60",//60
        "61",//61
        "62",//62
        "63",//63
        "64",//64
        "65",//65
        "66",//66
        "67",//67
        "68",//68
        "69",//69
        "70",//70
        "71",//71
        "72",//72
        "73",//73
        "74",//74
        "75",//75
        "76",//76
        "77",//77
        "78",//78
        "79",//79
        "80",//80
        "81",//81
        "82",//82
        "83",//83
        "84",//84
        "85",//85
        "86",//86
        "87",//87
        "88",//88
        "89",//89
        "90",//90
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

