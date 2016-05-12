//
//  LoadingDots.swift
//  LoadingDotsAnimation
//
//  Created by Hu Chen on 12/5/16.
//  Copyright © 2016 Hu Chen. All rights reserved.
//

import UIKit

@IBDesignable
class LoadingDots: UIView {

    @IBOutlet var view: UIView!
    @IBOutlet weak var dotOne: UIImageView!
    @IBOutlet weak var dotTwo: UIImageView!
    @IBOutlet weak var dotThree: UIImageView!
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupNib()
        startAnimation()
    }
    
    // MARK: - NSCoding
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupNib()
        startAnimation()
    }
    
    // MARK: - Nib Loading
    
    func setupNib() {
        self.view = loadNib()
        self.view.frame = self.bounds
        
        // Listen for UIApplicationDidBecomeActiveNotification notification to resume
        // animation when the app returns from the background.
        registerForNotifications()
        
        self.addSubview(self.view)
    }
    
    func loadNib() -> UIView {
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: nibName(), bundle: bundle)
        let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        
        return view
    }
    
    func nibName() -> String {
        return self.dynamicType.description().componentsSeparatedByString(".").last!
    }
    
    // MARK: - Lifetime
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    // MARK: - Convenience
    
    func startAnimation() {
        dotOne.transform = CGAffineTransformMakeScale(0.01, 0.01)
        dotTwo.transform = CGAffineTransformMakeScale(0.01, 0.01)
        dotThree.transform = CGAffineTransformMakeScale(0.01, 0.01)
        
        UIView.animateWithDuration(0.6, delay: 0.0, options: [.Repeat, .Autoreverse], animations: {
            self.dotOne.transform = CGAffineTransformIdentity
            }, completion: nil)
        
        UIView.animateWithDuration(0.6, delay: 0.2, options: [.Repeat, .Autoreverse], animations: {
            self.dotTwo.transform = CGAffineTransformIdentity
            }, completion: nil)
        
        UIView.animateWithDuration(0.6, delay: 0.4, options: [.Repeat, .Autoreverse], animations: {
            self.dotThree.transform = CGAffineTransformIdentity
            }, completion: nil)
    }
    
    // MARK: - Notifications
    
    func registerForNotifications() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(UIApplicationDelegate.applicationDidBecomeActive(_:)), name: UIApplicationDidBecomeActiveNotification, object: nil)
    }
    
    func applicationDidBecomeActive(notification: NSNotification) {
        startAnimation()
    }
}
