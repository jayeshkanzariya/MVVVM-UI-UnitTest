//
//  StringExtension.swift
//  TechFlakeAssignment
//
//  Created by Jayesh on 18/07/18.
//  Copyright © 2018 Jayesh kanzariya. All rights reserved.
//

import UIKit

extension UILabel{
    
    // This will give combined string with respective attributes
    func setAttributedText(texts: [String], attributes: [[NSAttributedStringKey : Any]]){
        let attbStr = NSMutableAttributedString()
        for (index,element) in texts.enumerated() {
            attbStr.append(NSAttributedString(string: element, attributes: attributes[index]))
        }
        self.attributedText = attbStr
    }
    
}
