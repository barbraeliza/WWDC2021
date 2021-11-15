import SpriteKit
import AVFoundation

public class cutScene: SKScene {
    
// objects
    lazy var bg1 = childNode(withName: "bg1") as! SKNode
    lazy var bg2 = childNode (withName: "bg2") as! SKNode
    lazy var scene1Player = childNode(withName: "scene1Player") as! SKSpriteNode
    lazy var buttonSmallStart = bg2.childNode(withName: "buttonSmallStart") as! SKSpriteNode
    lazy var showStoryBackground = bg2.childNode(withName: "showStoryBackground") as! SKSpriteNode
    lazy var showStoryLines = bg2.childNode (withName: "showStoryLines") as! SKSpriteNode
    lazy var showStoryPlayer = bg2.childNode (withName: "showStoryPlayer") as!SKSpriteNode
    lazy var ballonOne = bg2.childNode (withName: "ballonOne") as! SKSpriteNode
    lazy var ballonTwo = bg2.childNode (withName: "ballonTwo") as! SKSpriteNode
    lazy var ballonThree = bg2.childNode (withName: "ballonThree") as! SKSpriteNode
    
// texts
    lazy var labelHeadline = bg1.childNode(withName: "labelHeadline") as! SKLabelNode
    lazy var labelSubHeadline = bg1.childNode(withName: "labelSubHeadline") as! SKLabelNode
    lazy var ctaStart = buttonSmallStart.childNode(withName: "ctaStart") as! SKLabelNode
    
    let fadeDuration : TimeInterval = 0.6
    let fadeDurationBig : TimeInterval = 1.2
    let sceneDuration : TimeInterval = 1
    
    override public func didMove(to view: SKView) {

        run(.wait(forDuration: sceneDuration)){
            self.bg1.run(.fadeOut(withDuration: 2))
            self.bg2.run(.fadeIn(withDuration: 1.5))
            self.showStoryLines.run(.fadeIn(withDuration: 0.8))
            self.ballonOne.run(.sequence([.wait(forDuration: 0.5), .fadeIn(withDuration: 0.8),.moveBy(x: 0, y: 90, duration: 1.5)]))
            self.ballonTwo.run(.sequence([.wait(forDuration: 0.6), .fadeIn(withDuration: 0.8),.moveBy(x: 0, y: 45, duration: 1.5)]))
            self.ballonThree.run(.sequence([.wait(forDuration: 2), .fadeIn(withDuration: 1.5),.moveBy(x: 0, y: 0, duration: 1.5)]))
            self.buttonSmallStart.run(.sequence([.wait(forDuration: 3), .fadeIn(withDuration: 0.3)]))
        }

//        GSAudio.sharedInstance.playSound(fileURLWithPath: "ALGUMA_COISA_.formato")
    }
    
    
    @objc static override public var supportsSecureCoding: Bool {
        // SKNode conforms to NSSecureCoding, so any subclass going
        // through the decoding process must support secure coding
        get {
            return true
        }
    }

    func touchDown(atPoint pos : CGPoint) {
        if buttonSmallStart.contains(pos){
            let scene = playGameOne(fileNamed: "playGameOne")!
            scene.scaleMode = .aspectFit
            self.view?.presentScene(scene)
        }


    }

    func touchMoved(toPoint pos : CGPoint) {

    }

    func touchUp(atPoint pos : CGPoint) {

        
    }

    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { touchDown(atPoint: t.location(in: self)) }
    }

    override public func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { touchMoved(toPoint: t.location(in: self)) }
    }

    override public func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { touchUp(atPoint: t.location(in: self)) }
    }

    override public func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { touchUp(atPoint: t.location(in: self)) }
    }

    override public func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}

