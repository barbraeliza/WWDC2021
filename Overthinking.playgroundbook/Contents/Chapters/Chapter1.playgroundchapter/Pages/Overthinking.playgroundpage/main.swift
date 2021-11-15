//#-hidden-code
//
//  See LICENSE folder for this template’s licensing information.
//
//  Abstract:
//  The Swift file containing the source code edited by the user of this playground book.
//
import PlaygroundSupport
import SpriteKit
import UIKit
import BookCore

let sceneView = SKView(frame: CGRect(x: 0, y: 0, width: 512, height: 768))
if let scene = cutScene(fileNamed: "cutScene") {
    scene.scaleMode = .aspectFit
    sceneView.presentScene(scene)
}

PlaygroundPage.current.liveView = sceneView
PlaygroundPage.current.needsIndefiniteExecution = true

//#-end-hidden-code
/*:
 # A day working from home - Overthinking Edition 2021
 
 It's common sometimes be stressed or anxious during work when there are small deadlines to be done.

 And at times this can trigger overthinking, where your head is filled with thoughts all the time, making it difficult for you to concentrate on solving daily tasks.

 During the pandemic and with isolation, many people came to have small effects of overthinking - and with that, there was a difficulty in understand why people feels so tired physically with something that happens only in the head.

 - Experiment: Have you ever had a feeling of not being able to concentrate because of many thoughts? See how the overthinking happens and check out one technique to avoid and stay focused during your daily tasks.
 
 If you have an overthinking problem that is hindering your daily progress, be sure to ask for help from a professional of mental health.

 - Note: For better experience use this Playground in landscape
 */




