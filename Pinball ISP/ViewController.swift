//
//  ViewController.swift
//  Pinball ISP
//
//  Created by Quincy on 2017-02-28.
//  Copyright © 2017 Quincy. All rights reserved.
//

import Cocoa
import SpriteKit
import GameplayKit

class ViewController: NSViewController {
    override func viewDidLoad() {
       super.viewDidLoad()
        let GameScene = SKScene(size: CGSize(width: 1050, height: 800))
        
        
        let skView = SKView(frame: NSRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 800, height: 600)))
        skView.showsFPS = true
        skView.showsNodeCount = true
        skView.ignoresSiblingOrder = true
        view.addSubview(skView)
        GameScene.scaleMode = .aspectFit
        skView.presentScene(GameScene)
    }

    override func viewDidAppear() {
        super.viewDidAppear()
}

    override var representedObject: Any? {
        didSet{
            
        }
}
}
