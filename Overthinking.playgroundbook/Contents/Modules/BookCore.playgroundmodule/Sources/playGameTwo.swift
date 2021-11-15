import SpriteKit
import AVFoundation

public class playGameTwo: SKScene {
    
// objects
    lazy var playerDeskNormal = childNode(withName: "playerDesk") as! SKSpriteNode
    lazy var playerDeskHappy = childNode(withName: "playerDeskHappy") as! SKSpriteNode
    lazy var buttonSmallStart = childNode(withName: "buttonSmallStart") as! SKSpriteNode
    lazy var icoPagesArea = childNode(withName: "icoPagesArea") as! SKSpriteNode
    lazy var icoContactArea = childNode(withName: "icoContactArea") as! SKSpriteNode
    lazy var icoFacetimeArea = childNode(withName: "icoFacetimeArea") as! SKSpriteNode
    lazy var icoPages = childNode(withName: "icoPages") as! SKSpriteNode
    lazy var icoContact = childNode(withName: "icoContact") as! SKSpriteNode
    lazy var icoFacetime = childNode(withName: "icoFacetime") as! SKSpriteNode
    lazy var buttonSmallFinish = childNode(withName: "buttonSmallFinish") as! SKSpriteNode
    lazy var ballonChallenge2 = childNode (withName: "ballonChallenge2") as! SKSpriteNode
    // texts
    lazy var labelHeadline = childNode(withName: "labelHeadline") as! SKLabelNode
    lazy var labelSubHeadline = childNode(withName: "labelSubHeadline") as! SKLabelNode
    lazy var ctaStart = buttonSmallStart.childNode(withName: "ctaStart") as! SKLabelNode
    
    // global
    var draggedNode:SKSpriteNode!
    var originalPosition:CGPoint!
    var correctCount = 0
    var hasFinished = false
    override public func didMove(to view: SKView) {
        


    }

    @objc static override public var supportsSecureCoding: Bool {
        // SKNode conforms to NSSecureCoding, so any subclass going
        // through the decoding process must support secure coding
        get {
            return true
        }
    }

    func touchDown(atPoint pos : CGPoint) {
        if icoContact.contains(pos){
            draggedNode = icoContact
            originalPosition = icoContact.position
        }
        if icoFacetime.contains(pos){
            draggedNode = icoFacetime
            originalPosition = icoFacetime.position
        }
        if icoPages.contains(pos){
            draggedNode = icoPages
            originalPosition = icoPages.position
        }
        if buttonSmallFinish.contains(pos) && correctCount >= 3{
            let scene = cutSceneFinal(fileNamed: "cutSceneFinal")!
            scene.scaleMode = .aspectFit
            self.view?.presentScene(scene)
        }

    }

    func touchMoved(toPoint pos : CGPoint) {
        if draggedNode != nil {
            draggedNode.position = pos
        }
    }

    func touchUp(atPoint pos : CGPoint) {
        if draggedNode != nil{
            if icoContactArea.contains(pos) && draggedNode == icoContact {
                draggedNode.position = icoContactArea.position
                correctCount += 1
            }
            else if icoFacetimeArea.contains(pos) && draggedNode == icoFacetime {
                draggedNode.position = icoFacetimeArea.position
                correctCount += 1
            }
            else if icoPagesArea.contains(pos) && draggedNode == icoPages {
                draggedNode.position = icoPagesArea.position
                correctCount += 1
            }
            else {
                draggedNode.position = originalPosition
            }
            draggedNode = nil
        }
        if correctCount >= 3 {
            buttonSmallFinish.alpha = 1
            let happyPlayerEnd = SKTexture(imageNamed: "char_008_happy")
            playerDeskNormal.texture = happyPlayerEnd
            ballonChallenge2.alpha = 1
        }
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

