//
//  Characters.swift
//  Battle Royale 2
//
//  Created by Kyle Schneider on 12/3/18.
//  Copyright © 2018 Kyle Schneider›‹. All rights reserved.
//

import Foundation
import SpriteKit

var char: Characters = Characters ()

class Characters: NSObject {
   
    var playersLeft = 100
    var playerNumber = 0
    

    
    var broadcastLineOne = ""
    var broadcastLineTwo = ""
    var broadcastLineThree = ""
    var broadcastLineFour = ""
    var broadcastLineFive = ""
    
    var characterListPlain = [
        "Alaqua",
        "Tokobette",
        "Auran",
        "Zinnakahn",
        "Meta",
        "Snara Narke"
    ]
    
    let officeGroup = [
        "Michael Skarn",
        "Angela",
        "Moes",
        "Dwight",
        "Creed",
        "Andy"
    ]
    
    let youTubeGroup = [
        "Chocolate Rain",
        "Starwars Kid",
        "Numa Numa",
        "Sneezing Panda",
        "youTube5",
        "youTube6"
    ]
    
    let harryPotterGroup = [
        "Boy Who Lived",
        "Ron",
        "Hermione",
        "Nevil",
        "Luna",
        "grop"
    ]
    
    let beasts = [
    "pokemon1",
    "pokemon2",
    "pokemon3",
    "pokemon4",
    "pokemon5",
    "pokemon6",
    ]
    
    let specialNPCs = [
    "Evil Rick",
    "special2",
    "special3",
    "special4",
    "special5",
    "special6",
    ]
    
    let terribleFoes = [
    "Voltron",
    "Pickle Rick",
    "terible3",
    "terible4",
    "terible5",
    "terible6",
    ]
    
    let blank = ["", "", "", "", "", ""]
    
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
        "banished",
        "incinerated"
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
}

