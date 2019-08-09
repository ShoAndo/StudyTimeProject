//
//  RAMAnimatedTabBarController.swift
//  StudyTimeProject
//
//  Created by 安藤奨 on 2019/08/08.
//  Copyright © 2019 安藤奨. All rights reserved.
//

import Foundation
import RAMAnimatedTabBarController


class RAMBounceAnimation: RAMItemAnimation{
    // method call when Tab Bar Item is selected
    override func playAnimation(_ icon: UIImageView, textLabel: UILabel) {
        playBounceAnimation(icon)
        textLabel.textColor = textSelectedColor
        
        // add animation
        
    }
    
    // method call when Tab Bar Item is deselected
    override func deselectAnimation(_ icon: UIImageView, textLabel: UILabel, defaultTextColor: UIColor, defaultIconColor: UIColor) {
        textLabel.textColor = defaultTextColor
        // add animation
    }
    
    // method call when TabBarController did load
    override func selectedState(_ icon: UIImageView, textLabel: UILabel) {
        textLabel.textColor = textSelectedColor
        // set selected state
    }
    
    func playBounceAnimation(_ icon : UIImageView) {
        
        let bounceAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        bounceAnimation.values = [1.0 ,1.4, 0.9, 1.15, 0.95, 1.02, 1.0]
        bounceAnimation.duration = TimeInterval(duration)
        bounceAnimation.calculationMode = CAAnimationCalculationMode.cubic
        
        icon.layer.add(bounceAnimation, forKey: "bounceAnimation")
    }
}
