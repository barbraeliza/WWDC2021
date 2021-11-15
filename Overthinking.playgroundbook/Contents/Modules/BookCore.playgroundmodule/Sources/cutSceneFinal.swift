import SpriteKit
import AVFoundation

public class cutSceneFinal: SKScene {
    
// objects
    lazy var playerArm = childNode(withName: "playerArm") as! SKSpriteNode
    lazy var goodAgain = childNode(withName: "goodAgain") as! SKSpriteNode
    lazy var ballonFour = childNode(withName: "ballonFour") as! SKSpriteNode
    lazy var ballonFive = childNode(withName: "ballonFive") as! SKSpriteNode
    lazy var bgMeditate = childNode(withName: "bgMeditate") as! SKSpriteNode
    
    override public func didMove(to view: SKView) {
        playerArm.run(.moveBy(x: 10, y: -10, duration: 1.3))
        playerArm.run(.rotate(byAngle: -1.1, duration: 1.3))
        goodAgain.run(.fadeIn(withDuration: 1.2))
        ballonFour.run(.moveBy(x: 0, y: 50, duration: 1))
        ballonFive.run (.fadeIn(withDuration: 1))
        bgMeditate.run(.fadeIn(withDuration: 1.12))
    }

    @objc static override public var supportsSecureCoding: Bool {
        // SKNode conforms to NSSecureCoding, so any subclass going
        // through the decoding process must support secure coding
        get {
            return true
        }
    }

    func touchDown(atPoint pos : CGPoint) {
//        if buttonSmallStart.contains(pos){
//                    if let nextGameScene = playgameone(fileNamed: "playgameone") {
//                      nextGameScene.scaleMode = .aspectFit
//                      self.scene?.view?.presentScene(nextGameScene, transition: SKTransition.fade(withDuration: TimeInterval(1)))
//                    }
//                }
        

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

