//
//  secondViewController.swift
//  Battle Royale 2
//
//  Created by Kyle Schneider on 1/6/19.
//  Copyright © 2019 Kyle Schneider›‹. All rights reserved.
//

import Cocoa
import SpriteKit
import GameplayKit

class secondViewController: NSViewController {
    
    @IBOutlet var secondView: SKView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print ("second view loaded")
        
        // Load 'GameScene.sks' as a GKScene. This provides gameplay related content
        // including entities and graphs.
        if let scene = GKScene(fileNamed: "GameScene") {
            print ("1")
            // Get the SKScene from the loaded GKScene
            if let sceneNode = scene.rootNode as! GameScene? {
                print ("2")
                // Copy gameplay related content over to the scene
                sceneNode.entities = scene.entities
                sceneNode.graphs = scene.graphs
                
                // Set the scale mode to scale to fit the window
                sceneNode.scaleMode = .aspectFill
                
                // Present the scene
                if let secondView = self.secondView {
                    print ("3")
                    secondView.presentScene(sceneNode)
                    
                    secondView.ignoresSiblingOrder = true
                    
                    secondView.showsFPS = false
                    secondView.showsNodeCount = false
                }
            }
        }
    }

}
