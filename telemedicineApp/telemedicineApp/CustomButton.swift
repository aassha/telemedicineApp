//
//  CustomButton.swift
//  telemedicineApp
//
//  Created by Aastha Shah on 7/24/17.
//  Copyright © 2017 Aastha Shah. All rights reserved.
//

import Foundation
import UIKit
//MARK:Aastha Shah
class CustomButton: UIButton {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.layer.cornerRadius = 5
    }
    
}
