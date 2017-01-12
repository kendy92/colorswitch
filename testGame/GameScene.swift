//
//  GameScene.swift
//  testGame
//
//  Created by Dinh Cong Thang on 2016-12-31.
//  Copyright © 2016 Dinh Cong Thang. All rights reserved.
// COLOR MATCH PROJECT

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    struct bodyMask {
        static let player:UInt32 = 0x1 << 1
        static let obstacle:UInt32 = 0x1 << 2
    }
    var scorelbl = SKLabelNode()
    
    var score:Int = 0{
        didSet{
            scorelbl.text = "\(score)"
        }
    }
    
    var guidelbl = SKLabelNode()
    
    
    var shapes = SKNode()
    var groupShapes = [SKNode]()
    var spacing:CGFloat = 450
    var colors = [UIColor.red,UIColor.purple,UIColor.orange,UIColor.white]
    
    var player = SKShapeNode()
    var cameraNode = SKCameraNode()
    var rotateSpeed:CGFloat = 1.5
    
    func addPlusShape(){
        let path = UIBezierPath()
        path.move(to: CGPoint(x: -110, y: 0))
        path.addLine(to: CGPoint(x: -80, y: 0))
        path.addLine(to: CGPoint(x: -80, y: -110))
        path.addLine(to: CGPoint(x: -110, y: -110))
        
        shapes = duplicateShape(path)
        groupShapes.append(shapes)
        shapes.position = CGPoint(x: size.width/2, y: spacing * CGFloat(groupShapes.count))
        self.addChild(shapes)
        //rotate shape
        shapes.run(SKAction.repeatForever(SKAction.rotate(byAngle: -rotateSpeed * CGFloat(M_PI_2), duration: 2.0)))
    }
    
    
    func addDoubleCircle(){
        let path1 = UIBezierPath()
        path1.move(to: CGPoint(x: 0, y: -100))
        path1.addLine(to: CGPoint(x: 0, y: -70))
        path1.addArc(withCenter: .zero, radius: 100, startAngle: CGFloat(3.0 * M_PI_2), endAngle: CGFloat(0.0), clockwise: true)
        path1.addLine(to: CGPoint(x: 100, y: 0))
        path1.addLine(to: CGPoint(x: 70, y: 0))
        path1.addArc(withCenter: .zero, radius: 70, startAngle: CGFloat(0.0), endAngle: CGFloat(3.0 * M_PI_2), clockwise: false)
        
        var shapes1 = SKNode()
        shapes1 = duplicateShape(path1)
        groupShapes.append(shapes1)
        shapes1.position = CGPoint(x: size.width/2, y: spacing * CGFloat(groupShapes.count))
        self.addChild(shapes1)
        //rotate shape
        shapes1.run(SKAction.repeatForever(SKAction.rotate(byAngle: 1.5 * CGFloat(2.0 * M_PI / 3), duration: 2.0)))
        

        
        
        let path2 = UIBezierPath()
        path2.addLine(to: CGPoint(x: 0, y: -160))
        path2.addLine(to: CGPoint(x: 0, y: -130))
        path2.addArc(withCenter: .zero, radius: 160, startAngle: CGFloat(3.0 * M_PI_2), endAngle: CGFloat(0.0), clockwise: true)
        path2.addLine(to: CGPoint(x: 160, y: 0))
        path2.addLine(to: CGPoint(x: 130, y: 0))
        path2.addArc(withCenter: .zero, radius: 130, startAngle: CGFloat(0.0), endAngle: CGFloat(3.0 * M_PI_2), clockwise: false)
        
        
        var shapes2 = SKNode()
        shapes2 = duplicateShape(path2)
        groupShapes.append(shapes2)
        shapes2.position = CGPoint(x: size.width/2, y: shapes1.position.y)
        self.addChild(shapes2)
        //rotate shape
        shapes2.run(SKAction.repeatForever(SKAction.rotate(byAngle: -1.5 * CGFloat(5.0 * M_PI / 6), duration: 2.0)))
        

    }
    
    func addSpinCircle(){
        let path1 = UIBezierPath()
        path1.move(to: CGPoint(x: 0, y: -100))
        path1.addLine(to: CGPoint(x: 0, y: -70))
        path1.addArc(withCenter: .zero, radius: 100, startAngle: CGFloat(3.0 * M_PI_2), endAngle: CGFloat(0.0), clockwise: true)
        path1.addLine(to: CGPoint(x: 100, y: 0))
        path1.addLine(to: CGPoint(x: 70, y: 0))
        path1.addArc(withCenter: .zero, radius: 70, startAngle: CGFloat(0.0), endAngle: CGFloat(3.0 * M_PI_2), clockwise: false)
        
        var shapes1 = SKNode()
        shapes1 = duplicateShape(path1)
        groupShapes.append(shapes1)
        shapes1.position = CGPoint(x: size.width/2, y: spacing * CGFloat(groupShapes.count))
        self.addChild(shapes1)
        //rotate shape
        shapes1.run(SKAction.repeatForever(SKAction.rotate(byAngle: 1.5 * CGFloat(2.0 * M_PI / 3), duration: 2.0)))
        
        
        
        let path2 = UIBezierPath()
        path2.move(to: CGPoint(x: 0, y: -150))
        path2.addLine(to: CGPoint(x: 0, y: -120))
        path2.addArc(withCenter: .zero, radius: 150, startAngle: CGFloat(3.0 * M_PI_2), endAngle: CGFloat(0.0), clockwise: true)
        path2.addLine(to: CGPoint(x: 150, y: 0))
        path2.addLine(to: CGPoint(x: 120, y: 0))
        path2.addArc(withCenter: .zero, radius: 120, startAngle: CGFloat(0.0), endAngle: CGFloat(3.0 * M_PI_2), clockwise: false)
        
        var shapes2 = SKNode()
        shapes2 = duplicateShape(path2)
        groupShapes.append(shapes2)
        shapes2.position = CGPoint(x: size.width/2, y: shapes1.position.y + 250)
        self.addChild(shapes2)
        //rotate shape
        shapes2.run(SKAction.repeatForever(SKAction.rotate(byAngle: -1.5 * CGFloat(5.0 * M_PI / 6), duration: 2.0)))
        
    }

    
    func addCircle(){
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: -100))
        path.addLine(to: CGPoint(x: 0, y: -70))
        path.addArc(withCenter: .zero, radius: 100, startAngle: CGFloat(3.0 * M_PI_2), endAngle: CGFloat(0.0), clockwise: true)
        path.addLine(to: CGPoint(x: 100, y: 0))
        path.addLine(to: CGPoint(x: 70, y: 0))
        path.addArc(withCenter: .zero, radius: 70, startAngle: CGFloat(0.0), endAngle: CGFloat(3.0 * M_PI_2), clockwise: false)
        
        shapes = duplicateShape(path)
        shapes.name = "shapes"
        groupShapes.append(shapes)
        shapes.position = CGPoint(x: size.width/2, y: spacing * CGFloat(groupShapes.count))
        self.addChild(shapes)
        
        //rotate shape
        shapes.run(SKAction.repeatForever(SKAction.rotate(byAngle: rotateSpeed * CGFloat(M_PI_2), duration: 2.0)))
        
    }
    
    func addSquare(){
        let path = UIBezierPath(roundedRect: CGRect(x: -100,y:-100,width:200,height:30), cornerRadius: 20)
        shapes = duplicateShape(path)
        shapes.name = "shapes"
        groupShapes.append(shapes)
        shapes.position = CGPoint(x: size.width/2, y: spacing * CGFloat(groupShapes.count))
        self.addChild(shapes)
        //rotate shape
        shapes.run(SKAction.repeatForever(SKAction.rotate(byAngle: rotateSpeed * CGFloat(M_PI_2), duration: 2.0)))
    }
    
    
    func duplicateShape(_ path:UIBezierPath) -> SKNode{
        let container = SKNode()
        let rotateDeg = CGFloat(M_PI_2)
        for i in 0...3{
            let shape = SKShapeNode(path: path.cgPath)
            shape.fillColor = colors[i]
            shape.strokeColor = colors[i]
            shape.physicsBody = SKPhysicsBody(polygonFrom: path.cgPath)
            shape.zRotation = CGFloat(i) * rotateDeg
            shape.physicsBody?.categoryBitMask = bodyMask.obstacle
            shape.physicsBody?.contactTestBitMask = bodyMask.player
            shape.physicsBody?.collisionBitMask = 0
            shape.physicsBody?.affectedByGravity = false
            shape.physicsBody?.isDynamic = false
            shape.zPosition = 1
            container.addChild(shape)
        }
        return container
    }
    
    func addObstacle(){
        
        if(score <= 1){
            addCircle()
        }else{
            let choice = Int(arc4random_uniform(5))
            
            switch choice {
            case 0:
                addCircle()
                break
            case 1:
                addSquare()
                break
            case 2:
                addDoubleCircle()
                break
            case 3:
                addPlusShape()
                break
            case 4:
                addSpinCircle()
                break
            default:
                print("Fail to load")
            }
        }
    
    }
    
    func initScene(){
        self.physicsWorld.contactDelegate = self
        //add player
        player = SKShapeNode(circleOfRadius: 10)
        player.position = CGPoint(x: size.width/2, y: 20)
        let randColor = Int(arc4random_uniform(UInt32(colors.count)))
        player.fillColor = colors[randColor]
        player.strokeColor = player.fillColor
        player.physicsBody = SKPhysicsBody(circleOfRadius: 10)
        player.physicsBody?.categoryBitMask = bodyMask.player
        player.physicsBody?.contactTestBitMask = bodyMask.obstacle
        player.physicsBody?.collisionBitMask = 0
        player.physicsBody?.affectedByGravity = true
        player.physicsBody?.isDynamic = false
        player.zPosition = 2
        self.addChild(player)
        
        //add shapes
        addObstacle()
        //addObstacle()
        
        //add guide label
        guidelbl.text = "Tap to move and pass the obstacles"
        guidelbl.fontColor = UIColor.white
        guidelbl.fontSize = 25.0
        guidelbl.position = CGPoint(x: size.width/2, y: player.position.y + 100)
        self.addChild(guidelbl)

        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guidelbl.removeFromParent()
        player.physicsBody?.isDynamic = true
        player.physicsBody?.velocity.dy = 400
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        let bodyA = contact.bodyA.node as? SKShapeNode
        let bodyB = contact.bodyB.node as? SKShapeNode
        
        if(bodyA?.fillColor != bodyB?.fillColor){
            self.run(SKAction.playSoundFileNamed("sound/break.wav", waitForCompletion: true))
            resetGame()
        }
    }
    

    override func didMove(to view: SKView) {
        self.run(SKAction.repeatForever(SKAction.playSoundFileNamed("sound/bg_sound.mp3", waitForCompletion: true)))
        //add camera
        self.addChild(cameraNode)
        camera = cameraNode
        cameraNode.position = CGPoint(x: size.width/2, y: size.height/2)
        
        //add score
        scorelbl.text = "0"
        scorelbl.fontSize = 50.0
        scorelbl.position = CGPoint(x: size.width/2, y: player.position.y + spacing)
        scorelbl.fontColor = UIColor.white
        scorelbl.zPosition = 5
        self.addChild(scorelbl)
        
        initScene()
        
    }
    
    func resetGame(){
        score = 0
        rotateSpeed = 1.5
        player.removeFromParent()
        guidelbl.removeFromParent()
        cameraNode.position = CGPoint(x: size.width/2, y: size.height/2)
        for node in groupShapes{
            node.run(SKAction.removeFromParent())
        }
        groupShapes.removeAll()
        initScene()
    }
    
    

    
    override func update(_ currentTime: TimeInterval) {

        if(score <= 3){
            rotateSpeed = 1.5
        }else if(score >= 4 && score <= 10){
            rotateSpeed = 3
        }else{
            rotateSpeed = 3.5
        }
        
        if(player.position.y > spacing * CGFloat(groupShapes.count - 1)){
            self.run(SKAction.playSoundFileNamed("sound/match.wav", waitForCompletion: true))
            addObstacle()
            score = score + 1
            scorelbl.position.y = player.position.y + spacing
            let randColor = Int(arc4random_uniform(UInt32(colors.count)))
            player.fillColor = colors[randColor]
            player.strokeColor = player.fillColor
        }
        let playerInCameraPosition = cameraNode.convert(player.position, from: self)
        if(playerInCameraPosition.y > 0 && !cameraNode.hasActions()){
            cameraNode.position.y = player.position.y
        }
        
        if(playerInCameraPosition.y < -size.height/2){
            //game over
            resetGame()
        }
        
        for node in groupShapes{
            if(node.position.y < player.position.y - spacing){
                node.run(SKAction.removeFromParent())
            }
        }
        
    //print(groupShapes.count)
    }
}
