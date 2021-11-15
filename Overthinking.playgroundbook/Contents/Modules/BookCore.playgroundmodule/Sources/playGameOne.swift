import SpriteKit
import AVFoundation

public class playGameOne: SKScene {
    
// objects
    
    lazy var ball = childNode(withName: "ballBadGame") as! SKSpriteNode
    lazy var playerTop = childNode(withName: "playerLookTop") as! SKSpriteNode
    lazy var badMessage = childNode(withName: "badMessage") as! SKSpriteNode
    lazy var bgBadSuper = childNode(withName: "bgBadSuper") as! SKSpriteNode
    lazy var bgBadMedium = childNode (withName: "bgBadMedium") as! SKSpriteNode
    lazy var bgBadEasy = childNode (withName: "bgBadEasy") as! SKSpriteNode
    lazy var buttonInhale = childNode(withName: "buttonInhale") as! SKSpriteNode
    lazy var buttonExhale = childNode(withName: "buttonExhale") as! SKSpriteNode
    lazy var playerInhale = childNode(withName: "playerInhale") as! SKSpriteNode
    lazy var playerExhale = childNode(withName: "playerExhale") as! SKSpriteNode
    lazy var mindBackground = childNode(withName: "mindBackground") as! SKSpriteNode
    lazy var playerHappy = childNode(withName: "playerHappy") as! SKSpriteNode
    lazy var icoFacetime = childNode(withName: "icoFacetime") as! SKSpriteNode
    lazy var icoContact = childNode(withName: "icoContact") as! SKSpriteNode
    lazy var icoPages = childNode(withName: "icoPages") as! SKSpriteNode
    lazy var linesMove = childNode(withName: "linesMove") as! SKSpriteNode
    lazy var buttonOrganizeIdeas = childNode(withName: "buttonOrganizeIdeas") as! SKSpriteNode
    lazy var textHeadlineFinished = childNode(withName: "textHeadlineFinished") as! SKSpriteNode

    var isInhaling = true
    var inhalingCount = 0
    var exhalingCount = 0

// texts

    var balls:[SKSpriteNode] = []
    override public func didMove(to view: SKView) {
        balls.append(ball)
        ball.run(.moveBy(x: 0, y: 20, duration: 1.5))

    }
    let fadeDuration : TimeInterval = 0.6
    let fadeDurationBig : TimeInterval = 1.2
    @objc static override public var supportsSecureCoding: Bool {

        get {
            return true
        }
}
    func spawnBall(){
        if inhalingCount != 0 {
            return
        }
        let cloneBall = ball.copy() as! SKSpriteNode
        addChild(cloneBall)
        let xRandom = CGFloat.random(in: -300...300)
        let yRandom = CGFloat.random(in: 0...200)
        cloneBall.position.x = xRandom
        cloneBall.position.y = yRandom
        cloneBall.scale(to: CGSize(width: 0, height: 0))
        balls.append(cloneBall)
        cloneBall.run(.scale(to: CGSize(width: 60, height:60), duration:.random(in: 0.1...0.5)))
        let lifeTime = TimeInterval.random (in: 5...10)
        let waitAction = SKAction.wait(forDuration: lifeTime)
        cloneBall.run(.sequence([waitAction,.scale(to: 0, duration: 0.5)])){
            cloneBall.removeFromParent()
            self.balls.remove(at: self.balls.firstIndex(of: cloneBall)!)
        }
    }

    func makePlayerSadBoy(){
        if balls.count>=10{
            let SadTexture = SKTexture(imageNamed: "char_003_var")
            playerTop .texture = SadTexture
            badMessage.alpha = 1
            bgBadSuper.alpha = 1
            bgBadSuper.run(.fadeOut(withDuration: fadeDuration))
            badMessage.run(.fadeOut(withDuration: fadeDuration))



        }
        shakePlayerSadBoy()
    }

    func shakePlayerSadBoy(){
        if balls.count>=10{
            let deltax:CGFloat = 5
            let leftAction = SKAction.moveBy(x: deltax, y: 0, duration: 0.05)
            let rightAction = SKAction.moveBy(x: -deltax, y: 0, duration: 0.05)
            playerTop.run(.repeat(.sequence([leftAction,rightAction,rightAction,leftAction]), count: 3))
        }
    }

    func inHale(){
        if isInhaling{
            if inhalingCount == 0{
                bgBadSuper.alpha = 0
                bgBadMedium.alpha = 1
                bgBadEasy.run(.fadeIn(withDuration: fadeDuration))
                playerTop.alpha = 0
                badMessage.alpha = 0
                mindBackground.alpha = 1
                GSAudio.sharedInstance.playSound(soundFileName: "inhale")
                for ball in balls {
                    ball.removeAllActions()
                    ball.texture = SKTexture (imageNamed: "ball_zen")
                    ball.run(.moveBy(x: 0, y: 110, duration: 1.5))
                }
            }
            playerInhale.alpha = 1
            inhalingCount += 1
            buttonInhale.alpha = 0
            playerExhale.alpha = 0
            GSAudio.sharedInstance.playSound(soundFileName: "inhale")
            let duration:TimeInterval = 1
            let group = SKAction.group([.move(by: CGVector(dx: 0, dy: 0), duration: duration), .scale(to: 0.6, duration: duration) ])
            playerInhale.run(group){
                self.isInhaling = false
                self.buttonExhale.alpha = 1
            }
            ball.run(.moveBy(x: 0, y: 160, duration: 1.5))
            mindBackground.run(group)
            playerExhale.run(group)
        }
    }

    func exHale(){
        if !isInhaling{
        playerInhale.alpha = 0
        playerExhale.alpha = 1
        buttonExhale.alpha = 0
        GSAudio.sharedInstance.playSound(soundFileName: "exhale")
        let durationSmall:TimeInterval = 1
        let groupSmall = SKAction.group([.move(by: CGVector(dx: 0, dy: 0), duration: durationSmall), .scale(to: 0.5, duration: durationSmall) ])
            playerExhale.run(groupSmall){
                self.isInhaling = true
                self.buttonExhale.alpha = 0
                self.buttonInhale.alpha = 1
                self.exhalingCount += 1
                if self.exhalingCount >= 2{
                    self.bgBadMedium.alpha = 0
                    self.bgBadEasy.alpha = 1
                    self.playerHappy.run(.fadeIn(withDuration: self.fadeDurationBig))
                    self.icoPages.run(.fadeIn(withDuration: self.fadeDurationBig))
                    self.icoContact.run(.fadeIn(withDuration: self.fadeDurationBig))
                    self.icoFacetime.run(.fadeIn(withDuration: self.fadeDurationBig))
                    self.buttonExhale.alpha = 0
                    self.buttonInhale.alpha = 0
                    self.playerExhale.alpha = 0
                    self.playerInhale.alpha = 0
                    self.linesMove.alpha = 0
                    self.buttonOrganizeIdeas.alpha = 1
                    self.mindBackground.position = self.playerHappy.position
                    for ball in self.balls {
                        ball.removeFromParent()
                    }
                }
            }
            mindBackground.run(groupSmall)
            playerInhale.run(groupSmall)
        }

    }

    func touchDown(atPoint pos : CGPoint) {
        for ball in balls where ball.contains(pos){
            let numberOfBalls = Int.random(in: 2...8)
            for _ in 1...numberOfBalls{
                spawnBall()
            }

            if inhalingCount == 0 {
                makePlayerSadBoy()
                buttonInhale.run(.sequence([.wait(forDuration: 5), .fadeIn(withDuration: 0)]))
                {
                    }
            }

            return
        }

        if buttonOrganizeIdeas.contains(pos) && exhalingCount >= 2{
            let scene = playGameTwo(fileNamed: "playGameTwo")!
            scene.scaleMode = .aspectFit
            self.view?.presentScene(scene)
        }

        if buttonInhale.contains(pos) && exhalingCount < 2 {
            inHale()
        }
        if buttonExhale.contains(pos) && exhalingCount < 2 {
            exHale()
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

