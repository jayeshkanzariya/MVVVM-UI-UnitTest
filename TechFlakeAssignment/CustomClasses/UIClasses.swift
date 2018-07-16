//
//  UIClasses.swift
//  Tec_Fake_PracticalTest
//
//  Created by Jayesh on 08/07/18.
//  Copyright © 2018 Jayesh kanzariya. All rights reserved.
//

import UIKit

class RoundImage : UIImageView {
    
    override func awakeFromNib() {
        self.layer.cornerRadius = self.frame.size.height / 2
        self.layer.masksToBounds = false
        self.clipsToBounds = true
    }

}
