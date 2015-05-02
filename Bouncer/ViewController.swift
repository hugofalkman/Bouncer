//
//  ViewController.swift
//  Bouncer
//
//  Created by H Hugo Falkman on 2015-05-02.
//  Copyright (c) 2015 H Hugo Fakman. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    // MARK: - Animation
    
    let bouncer = BouncerBehavior()
    lazy var animator: UIDynamicAnimator = {
       UIDynamicAnimator(referenceView: self.view)
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animator.addBehavior(bouncer)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        if redBlock == nil {
            redBlock = addBlock()
            redBlock?.backgroundColor = UIColor.redColor()
            bouncer.addBlock(redBlock!)
        }
        let motionManager = AppDelegate.Motion.Manager
        if motionManager.accelerometerAvailable {
            motionManager.startAccelerometerUpdatesToQueue(NSOperationQueue.mainQueue()) {
                (data,error) -> Void in
            self.bouncer.gravity.gravityDirection = CGVector(dx: data.acceleration.x, dy: -data.acceleration.y)
            }
        }
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        AppDelegate.Motion.Manager.stopAccelerometerUpdates()
    }
    
    // MARK: - Block
    
    var redBlock: UIView?
    
    private func addBlock() -> UIView {
        let block = UIView(frame: CGRect(origin: CGPointZero, size: Constants.BlockSize))
        block.center = CGPoint(x: view.bounds.midX, y: view.bounds.midY)
        view.addSubview(block)
        return block
    }
    
    // MARK: - Constants
    
    private struct Constants {
        static let BlockSize = CGSize(width: 40, height: 40)
    }
}