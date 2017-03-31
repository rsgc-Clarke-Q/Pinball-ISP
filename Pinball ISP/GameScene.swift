//
//  GameScene.swift
//  Pinball ISP
//
//  Created by Quincy on 2017-02-28.
//  Copyright © 2017 Quincy. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    override func didMove(to view: SKView) {
        backgroundColor = SKColor.black
        
        //sprite to represent the background
        let background = SKSpriteNode(imageNamed: "pinballbackground")
        
        background.position = CGPoint(x: size.width/2, y: size.height/2) //set it in the middle of the screen
        background.size = self.frame.size //set backgound to be the same size of the frame
        addChild(background)
        
        let leftbumper = SKSpriteNode(imageNamed: "left bumper")
        leftbumper.position = CGPoint(x: 180, y: 415)
        addChild(leftbumper)
        
        let rightbumper = SKSpriteNode(imageNamed: "Right bottom bumper")
        rightbumper.position = CGPoint(x: 450, y: 415)
        addChild(rightbumper)
    }
}
