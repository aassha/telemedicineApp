//
//  customImageAnimation.swift
//  telemedicineApp
//
//  Created by Aastha Shah on 8/3/17.
//  Copyright © 2017 Aastha Shah. All rights reserved.
//

import UIKit

class customImageAnimation: UIView {

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        let bounds = self.bounds
        UIColor.white.setFill()
        UIRectFill(bounds)
        
        let icon = UIImageView()
        icon.image = UIImage(named: "appIcon.png")
        icon.frame = CGRect(x: 0, y: 0, width: 120, height: 120)
        self.addSubview(icon)
        //initial rotation that places image upside down
        icon.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI))
        UIView.animate(withDuration: 2) {
            //animation 
            icon.transform = CGAffineTransform(rotationAngle: CGFloat(2*M_PI))
        }

        
    }
    
}
