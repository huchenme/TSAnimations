//
//  SonarAnnotationView.swift
//  MapLocationAnimation
//
//  Created by Hu Chen on 11/5/16.
//  Copyright © 2016 Hu Chen. All rights reserved.
//

import UIKit
import MapKit

class SonarAnnotationView: MKAnnotationView {
    
    // MARK: - Types
    
    struct Constants {
        struct ColorPalette {
            static let green = UIColor(red:0.00, green:0.87, blue:0.71, alpha:1.0)
        }
    }
    
    // MARK: - Initializers
    
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        startAnimation()
    }
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    // MARK: - NSCoding
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Convenience
    
    func sonar(beginTime: CFTimeInterval) {
        let circlePath1 = UIBezierPath(arcCenter: self.center, radius: CGFloat(3), startAngle: CGFloat(0), endAngle:CGFloat(M_PI * 2), clockwise: true)
        let circlePath2 = UIBezierPath(arcCenter: self.center, radius: CGFloat(80), startAngle: CGFloat(0), endAngle:CGFloat(M_PI * 2), clockwise: true)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = Constants.ColorPalette.green.CGColor
        shapeLayer.fillColor = Constants.ColorPalette.green.CGColor
        shapeLayer.path = circlePath1.CGPath
        self.layer.addSublayer(shapeLayer)
        
        let pathAnimation = CABasicAnimation(keyPath: "path")
        pathAnimation.fromValue = circlePath1.CGPath
        pathAnimation.toValue = circlePath2.CGPath
        
        let alphaAnimation = CABasicAnimation(keyPath: "opacity")
        alphaAnimation.fromValue = 0.8
        alphaAnimation.toValue = 0
        
        let animationGroup = CAAnimationGroup()
        animationGroup.beginTime = beginTime
        animationGroup.animations = [pathAnimation, alphaAnimation]
        animationGroup.duration = 2.76
        animationGroup.repeatCount = FLT_MAX
        
        shapeLayer.addAnimation(animationGroup, forKey: "sonar")
    }
    
    func startAnimation() {
        sonar(CACurrentMediaTime())
        sonar(CACurrentMediaTime() + 0.92)
        sonar(CACurrentMediaTime() + 1.84)
    }
}
