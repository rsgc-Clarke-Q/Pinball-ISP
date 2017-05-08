
//  Copyright © 2017 Quincy. All rights reserved.
//
import SpriteKit
import GameplayKit

struct PhysicsCategory {
    static let None         :   UInt32 = 0
    static let background   :   UInt32 = 0b0001  // 1
    static let middle       :   UInt32 = 0b0010  // 2
    static let leftbumper   :   UInt32 = 0b0100  // 4
}


class GameScene: SKScene {
    
    // Sprites that need to have global scope so we can operate on them in any function
    var ball = SKSpriteNode()
    var leftPaddle = SKSpriteNode()
    var rightPaddle = SKSpriteNode()
    
    override func didMove(to view: SKView) {
        backgroundColor = SKColor.black
        
        //adding all the spriites to the game
        //sprite to represent the background
        let background = SKSpriteNode(imageNamed: "pinballbackground")
        
        background.position = CGPoint(x: size.width/2, y: size.height/2) //set it in the middle of the screen
        background.size = self.frame.size //set backgound to be the same size of the frame
        background.zPosition = -1
        addChild(background)
        
        // Make gravity a bit less strong
        self.physicsWorld.gravity = CGVector(dx: 0, dy: -5)
        
        //        let middle = SKSpriteNode(imageNamed: "middle")
        //        middle.position = CGPoint(x: size.width/2 - 38, y: 500)
        //        middle.zPosition = 1
        //        addChild(middle)
        //
        //        //adding a border
        //        let border = SKSpriteNode(imageNamed: "inner border")
        //        border.position = CGPoint(x: size.width/2 + 2, y: size.height/2 + 100)
        //        border.size = CGSize(width: self.size.width * 1.01, height: self.size.height * 0.91)
        //        border.setScale(0.93)
        //        border.zPosition = -2
        //
        //         //making physics body for the border
        //        border.physicsBody = SKPhysicsBody(texture: border.texture!, size: border.size)
        //        border.physicsBody?.affectedByGravity = false
        //        border.physicsBody?.isDynamic = false
        //        addChild(border)
        
        //adding left side of border
        let leftSideBorder = SKSpriteNode(imageNamed: "leftside")
        leftSideBorder.position = CGPoint(x: (size.width/2 + 2) / 2 + 10, y: size.height/2 + 100)
        leftSideBorder.size = CGSize(width: (self.size.width * 0.98) / 2, height: self.size.height * 0.91)
        leftSideBorder.setScale(0.93)
        leftSideBorder.zPosition = -2
        
        //making physics body for the border
        leftSideBorder.physicsBody = SKPhysicsBody(texture: leftSideBorder.texture!, size: leftSideBorder.size)
        leftSideBorder.physicsBody?.affectedByGravity = false
        leftSideBorder.physicsBody?.isDynamic = false
        addChild(leftSideBorder)
        
        //adding right side of border
        let rightSideBorder = SKSpriteNode(imageNamed: "rightside")
        rightSideBorder.position = CGPoint(x: (size.width/2 + 2) / 2 + 20 + (size.width/2 + 2) - 50, y: size.height/2 + 100)
        rightSideBorder.size = CGSize(width: (self.size.width * 1.1) / 2, height: self.size.height * 0.91)
        rightSideBorder.setScale(0.93)
        rightSideBorder.zPosition = -2
        
        //making physics body for the border
        rightSideBorder.physicsBody = SKPhysicsBody(texture: rightSideBorder.texture!, size: rightSideBorder.size)
        rightSideBorder.physicsBody?.affectedByGravity = false
        rightSideBorder.physicsBody?.isDynamic = false
        addChild(rightSideBorder)
        
        //
        //        // Make the shape not be affected by gravity in this world
        //
        //adding green bumpers
        let leftbumper = SKSpriteNode(imageNamed: "left bumper")
        leftbumper.position = CGPoint(x: 170, y: 500)
        leftbumper.zPosition = 1
        //making physics body for the object
        leftbumper.physicsBody = SKPhysicsBody(texture: leftbumper.texture!, size: leftbumper.size)
        leftbumper.physicsBody?.affectedByGravity = false
        leftbumper.physicsBody?.isDynamic = false
        addChild(leftbumper)
        //
        //        // Right bumper
        //        let rightbumper = SKSpriteNode(imageNamed: "Right bottom bumper")
        //        rightbumper.position = CGPoint(x: 450, y: 415)
        //        rightbumper.zPosition = 1
        //        addChild(rightbumper)
        //
        //        //making physics body for the object
        //        rightbumper.physicsBody = SKPhysicsBody(texture: rightbumper.texture!, size: rightbumper.size)
        //
        //        // Make the shape not be affected by gravity in this world
        //        rightbumper.physicsBody?.affectedByGravity = false
        //
        //adding the triggers that hit the ball
        leftPaddle = SKSpriteNode(imageNamed: "left trigger")
        //leftPaddle.anchorPoint = CGPoint(x: 0, y: 0)
        leftPaddle.position = CGPoint(x: size.width/2 - 90, y: 370)
        leftPaddle.zPosition = 1
        leftPaddle.physicsBody = SKPhysicsBody(texture: leftPaddle.texture!, size: leftPaddle.size)
        leftPaddle.physicsBody?.affectedByGravity = false   // Will not fall
        leftPaddle.physicsBody?.isDynamic = false   // Will not move when hit
        addChild(leftPaddle)
        
        // Right paddle
        //adding the triggers that hit the ball
        rightPaddle = SKSpriteNode(imageNamed: "right trigger")
        rightPaddle.position = CGPoint(x: size.width/2 + 50, y: 370)
        rightPaddle.zPosition = 1
        rightPaddle.physicsBody = SKPhysicsBody(texture: rightPaddle.texture!, size: rightPaddle.size)
        rightPaddle.physicsBody?.affectedByGravity = false   // Will not fall
        rightPaddle.physicsBody?.isDynamic = false   // Will not move when hit
        rightPaddle.physicsBody?.density = 40
        addChild(rightPaddle)
        
        //
        //        // Adding the bar that hits the ball at the start
        //        let bar = SKSpriteNode(imageNamed: "Bar")
        //        bar.position = CGPoint(x: size.width/2 + 271.5, y: 290)
        //        bar.zPosition = 1
        //        addChild(bar)
        //
        //        // Making physics body for the bar
        //        bar.physicsBody = SKPhysicsBody(texture: bar.texture!, size: bar.size)
        //
        //        // Make the shape not be affected by gravity in this world
        //        bar.physicsBody?.affectedByGravity = false
        //
        //        //making it hit the ball when up arrow key is pressed
        //
        //
        //
        //        //adding the middle bumpers
        //        let middleOne = SKSpriteNode(imageNamed: "middle bumper")
        //        middleOne.position = CGPoint(x: size.width/2 - 38, y: 800)
        //        middleOne.zPosition = 1
        //        addChild(middleOne)
        //
        //        // Set physics body
        //        middleOne.physicsBody = SKPhysicsBody(circleOfRadius: middleOne.size.width / 2)
        //
        //        // Make the shape not be affected by gravity in this world
        //        middleOne.physicsBody?.affectedByGravity = false
        //
        //        let middleTwo = SKSpriteNode(imageNamed: "middle bumper 2")
        //        middleTwo.position = CGPoint(x: size.width/2 - 180, y: 700)
        //        middleTwo.zPosition = 1
        //        addChild(middleTwo)
        //
        //        // Set physics body
        //        middleTwo.physicsBody = SKPhysicsBody(circleOfRadius: middleOne.size.width / 2)
        //
        //        // Make the shape not be affected by gravity in this world
        //        middleTwo.physicsBody?.affectedByGravity = false
        //
        //        let middleThree = SKSpriteNode(imageNamed: "middle bumper 2")
        //        middleThree.position = CGPoint(x: size.width/2 + 104, y: 700)
        //        middleThree.zPosition = 1
        //        addChild(middleThree)
        //        // Set physics body
        //        middleThree.physicsBody = SKPhysicsBody(circleOfRadius: middleThree.size.width / 2)
        //
        //        // Make the shape not be affected by gravity in this world
        //        middleThree.physicsBody?.affectedByGravity = false
        //
        //        //the long wall at the top
        //        let longbumper = SKSpriteNode(imageNamed: "long bumper")
        //        longbumper.position = CGPoint(x: size.width/2 - 31, y: 998)
        //        longbumper.zPosition = 1
        //        addChild(longbumper)
        //
        //        //making physics body for the object
        //        longbumper.physicsBody = SKPhysicsBody(texture: longbumper.texture!, size: longbumper.size)
        //
        //        // Make the shape not be affected by gravity in this world
        //        longbumper.physicsBody?.affectedByGravity = false
        //
        //        //ball
        ball = SKSpriteNode(imageNamed: "ball")
        ball.position = CGPoint(x: 643, y: 298)
        ball.zPosition = 1
        ball.setScale(1)
        ball.physicsBody?.density = 0.1
        addChild(ball)
        
        // Set physics body for the ball based on its radius
        ball.physicsBody = SKPhysicsBody(circleOfRadius: ball.size.width / 2)
        //
        //        //top bumpers
        //        let topBumper = SKSpriteNode(imageNamed: "top bumper")
        //        topBumper.position = CGPoint(x: size.width/2 - 38, y: 990)
        //        topBumper.zPosition = 1
        //        addChild(topBumper)
        //
        //        //making physics body for the object
        //        topBumper.physicsBody = SKPhysicsBody(texture: topBumper.texture!, size: topBumper.size)
        //
        //        // Make the shape not be affected by gravity in this world
        //        topBumper.physicsBody?.affectedByGravity = false
        //
        //        let topBumper2 = SKSpriteNode(imageNamed: "top bumper")
        //        topBumper2.position = CGPoint(x: size.width/2 - 110, y: 990)
        //        topBumper2.zPosition = 1
        //        addChild(topBumper2)
        //
        //        //making physics body for the object
        //        topBumper2.physicsBody = SKPhysicsBody(texture: topBumper2.texture!, size: topBumper2.size)
        //
        //        // Make the shape not be affected by gravity in this world
        //        topBumper2.physicsBody?.affectedByGravity = false
        //
        //        let topBumper3 = SKSpriteNode(imageNamed: "top bumper")
        //        topBumper3.position = CGPoint(x: size.width/2 + 34, y: 990)
        //        topBumper3.zPosition = 1
        //        addChild(topBumper3)
        //
        //        //making physics body for the object
        //        topBumper3.physicsBody = SKPhysicsBody(texture: topBumper3.texture!, size: topBumper3.size)
        //
        //        // Make the shape not be affected by gravity in this world
        //        topBumper3.physicsBody?.affectedByGravity = false
        //
        //        //right side mini bumpers
        //        let miniBumperR = SKSpriteNode(imageNamed: "right middle bumper")
        //        miniBumperR.position = CGPoint(x: size.width/2 + 120, y: 570)
        //        miniBumperR.zPosition = 1
        //        addChild(miniBumperR)
        //
        //        //making physics body for the object
        //        miniBumperR.physicsBody = SKPhysicsBody(texture: miniBumperR.texture!, size: miniBumperR.size)
        //
        //        // Make the shape not be affected by gravity in this world
        //        miniBumperR.physicsBody?.affectedByGravity = false
        //
        //        //second minibumper
        //        let miniBumperR2 = SKSpriteNode(imageNamed: "right middle bumper")
        //        miniBumperR2.position = CGPoint(x: size.width/2 + 150, y: 530)
        //        miniBumperR2.zPosition = 1
        //        addChild(miniBumperR2)
        //
        //        //making physics body for the object
        //        miniBumperR2.physicsBody = SKPhysicsBody(texture: miniBumperR2.texture!, size: miniBumperR2.size)
        //
        //        // Make the shape not be affected by gravity in this world
        //        miniBumperR2.physicsBody?.affectedByGravity = false
        //
        //      //left side mini bumpers
        //        let miniBumperL = SKSpriteNode(imageNamed: "left middle bumper")
        //        miniBumperL.position = CGPoint(x: size.width/2 - 211, y: 530)
        //        miniBumperL.zPosition = 1
        //        addChild(miniBumperL)
        //
        //        //making physics body for the object
        //        miniBumperL.physicsBody = SKPhysicsBody(texture: miniBumperL.texture!, size: miniBumperL.size)
        //
        //        // Make the shape not be affected by gravity in this world
        //        miniBumperL.physicsBody?.affectedByGravity = false
        //
        //
        //        //second left minibumper
        //        let miniBumperL2 = SKSpriteNode(imageNamed: "left middle bumper")
        //        miniBumperL2.position = CGPoint(x: size.width/2 - 181, y: 570)
        //        miniBumperL2.zPosition = 1
        //        addChild(miniBumperL2)
        //
        //        //making physics body for the object
        //        miniBumperL2.physicsBody = SKPhysicsBody(texture: miniBumperL2.texture!, size: miniBumperL2.size)
        //
        //        // Make the shape not be affected by gravity in this world
        //        miniBumperL2.physicsBody?.affectedByGravity = false
        //
        //
        //
        //        //stars // not sure how i am supposed to do the for loop for the stars
        //        let stars = SKSpriteNode(imageNamed: "star")
        //        stars.position = CGPoint(x: size.width/2 - 31, y: 1000)
        //        stars.zPosition = 1
        //        addChild(stars)
        
    }
    
    
    
    
    //    //this is a function that runs everytime a frame is updated
    //    override func update(_ currentTime: TimeInterval) {
    //        //check for collision between ball and the obstacles
    //        checkCollisions()
    //    }
    override func mouseDown(with event: NSEvent) {
        let position = event.location(in: self)
        print("Mouse position is (\(position.x), \(position.y))")
        ball.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 100))
        
    }
    
    override func keyDown(with event: NSEvent) {
        // Interpret key presses
        if event.keyCode == 124 { // Right arrow
            let rotate = SKAction.rotate(byAngle: CGFloat(-1 * M_PI / 2.0), duration: 0.05)
            let rotateBack = rotate.reversed()
            let sequence = SKAction.sequence([rotate, rotateBack])
            rightPaddle.run(sequence)
            
        } else if event.keyCode == 123 { // Left arrow
            let rotate = SKAction.rotate(byAngle: CGFloat(M_PI / 2.0), duration: 0.05)
            let rotateBack = rotate.reversed()
            let sequence = SKAction.sequence([rotate, rotateBack])
            leftPaddle.run(sequence)
        }
    }
    //
    //    //this function checks for collisions between ball and the obstacles
    //    func checkCollisions(){
    //        
    //        //Create an array that will contain all the obstacles colliding with the ball
    //        var hitObstacles : [SKSpriteNode] = []
    //        
    //        //find the obstacles colliding with the ball
    //        enumerateChildNodes(withName: "ball", using: {
    //            node, _ in
    //            
    //            //get a refference to the current node that was found with the name ball
    //            let ball = node as! SKSpriteNode
    //            
    //            //check to see if the ball is hitting obstacle
    //            if ball.frame.intersects(self.longbumper){
    //                //this obstacle intersects with the ball
    //                print("hit")
    //            }
    //        })
    //        
    //    }
}
