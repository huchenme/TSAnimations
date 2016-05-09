//
//  ViewController.swift
//  LockScreenAnimation
//
//  Created by Hu Chen on 9/5/16.
//  Copyright © 2016 Hu Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties

    @IBOutlet weak var topLock: UIImageView!
    @IBOutlet weak var bottomLock: UIImageView!
    @IBOutlet weak var lockBorder: UIImageView!
    @IBOutlet weak var lockKeyhole: UIImageView!
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        openLock()
    }
    
    // MARK: - Convenience
    
    func openLock() {
        UIView.animateWithDuration(0.4, delay: 5, options: [], animations: {
            self.lockKeyhole.transform = CGAffineTransformMakeRotation(CGFloat(M_PI))
            }, completion: { _ in
                UIView.animateWithDuration(0.5, delay: 0.2, options: [], animations: {
                    let yDelta = self.lockBorder.frame.maxY
                    
                    self.topLock.center.y -= yDelta
                    self.lockBorder.center.y -= yDelta
                    self.lockKeyhole.center.y -= yDelta
                    self.bottomLock.center.y += yDelta
                    
                    }, completion: { _ in
                        self.topLock.removeFromSuperview()
                        self.lockBorder.removeFromSuperview()
                        self.lockKeyhole.removeFromSuperview()
                        self.bottomLock.removeFromSuperview()
                })
        })
    }
    
    // MARK: - Status Bar
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}

