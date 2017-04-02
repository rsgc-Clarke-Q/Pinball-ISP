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
        
        //adding all the spriites to the game
        //sprite to represent the background
        let background = SKSpriteNode(imageNamed: "pinballbackground")
        
        background.position = CGPoint(x: size.width/2, y: size.height/2) //set it in the middle of the screen
        background.size = self.frame.size //set backgound to be the same size of the frame
        background.zPosition = -1
        addChild(background)
        
        //adding middle circle where score will be held
        let middle = SKSpriteNode(imageNamed: "middle")
        middle.position = CGPoint(x: size.width/2 - 38, y: 500)
        middle.zPosition = 1
        addChild(middle)
        
        //adding green bumpers
        let leftbumper = SKSpriteNode(imageNamed: "left bumper")
        leftbumper.position = CGPoint(x: 180, y: 415)
        leftbumper.zPosition = 1
        addChild(leftbumper)
        
        let rightbumper = SKSpriteNode(imageNamed: "Right bottom bumper")
        rightbumper.position = CGPoint(x: 450, y: 415)
        rightbumper.zPosition = 1
        addChild(rightbumper)
        
        //adding the triggers that hit the ball
        let leftpaddle = SKSpriteNode(imageNamed: "left trigger")
        leftpaddle.position = CGPoint(x: size.width/2 - 90, y: 320)
        leftpaddle.zPosition = 1
        addChild(leftpaddle)
        
        let rightpaddle = SKSpriteNode(imageNamed: "right trigger")
        rightpaddle.position = CGPoint(x: size.width/2 + 20, y: 320)
        rightpaddle.zPosition = 1
        addChild(rightpaddle)
        
        //adding the bar that hits the ball att the start
        let bar = SKSpriteNode(imageNamed: "Bar")
        bar.position = CGPoint(x: size.width/2 + 271.5, y: 290)
        bar.zPosition = 1
        addChild(bar)
        
        //adding the middle bumpers
        let middleOne = SKSpriteNode(imageNamed: "middle bumper")
        middleOne.position = CGPoint(x: size.width/2 - 38, y: 800)
        middleOne.zPosition = 1
        addChild(middleOne)
        
        let middleTwo = SKSpriteNode(imageNamed: "middle bumper 2")
        middleTwo.position = CGPoint(x: size.width/2 - 180, y: 700)
        middleTwo.zPosition = 1
        addChild(middleTwo)
        
        let middleThree = SKSpriteNode(imageNamed: "middle bumper 2")
        middleThree.position = CGPoint(x: size.width/2 + 104, y: 700)
        middleThree.zPosition = 1
        addChild(middleThree)
        
        
        //the long wall at the top
        let longbumper = SKSpriteNode(imageNamed: "long bumper")
        longbumper.position = CGPoint(x: size.width/2 - 31, y: 998)
        longbumper.zPosition = 1
        addChild(longbumper)
        
        //ball
        let ball = SKSpriteNode(imageNamed: "ball")
        ball.position = CGPoint(x: size.width/2 + 271.5, y: 360)
        ball.zPosition = 1
        addChild(ball)
        
        //top bumpers
        let topBumper = SKSpriteNode(imageNamed: "top bumper")
        topBumper.position = CGPoint(x: size.width/2 - 38, y: 990)
        topBumper.zPosition = 1
        addChild(topBumper)
        
        let topBumper2 = SKSpriteNode(imageNamed: "top bumper")
        topBumper2.position = CGPoint(x: size.width/2 - 110, y: 990)
        topBumper2.zPosition = 1
        addChild(topBumper2)
        
        let topBumper3 = SKSpriteNode(imageNamed: "top bumper")
        topBumper3.position = CGPoint(x: size.width/2 + 34, y: 990)
        topBumper3.zPosition = 1
        addChild(topBumper3)
        
        //right side mini bumpers
        let miniBumperR = SKSpriteNode(imageNamed: "right middle bumper")
        miniBumperR.position = CGPoint(x: size.width/2 + 120, y: 570)
        miniBumperR.zPosition = 1
        addChild(miniBumperR)
        
        let miniBumperR2 = SKSpriteNode(imageNamed: "right middle bumper")
        miniBumperR2.position = CGPoint(x: size.width/2 + 150, y: 530)
        miniBumperR2.zPosition = 1
        addChild(miniBumperR2)
        
      //left side mini bumpers
        let miniBumperL = SKSpriteNode(imageNamed: "left middle bumper")
        miniBumperL.position = CGPoint(x: size.width/2 - 211, y: 530)
        miniBumperL.zPosition = 1
        addChild(miniBumperL)
        
        let miniBumperL2 = SKSpriteNode(imageNamed: "left middle bumper")
        miniBumperL2.position = CGPoint(x: size.width/2 - 181, y: 570)
        miniBumperL2.zPosition = 1
        addChild(miniBumperL2)
        
        //stars // not sure how i am supposed to do the for loop for the stars
        let stars = SKSpriteNode(imageNamed: "star")
        stars.position = CGPoint(x: size.width/2 - 31, y: 1000)
        stars.zPosition = 1
        addChild(stars)
        
    }
}
