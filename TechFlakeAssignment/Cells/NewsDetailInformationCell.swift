//
//  NewsDetailInformationCell.swift
//  TechFlakeAssignment
//
//  Created by Jayesh on 18/07/18.
//  Copyright © 2018 Jayesh kanzariya. All rights reserved.
//

import UIKit

class NewsDetailInformationCell: UITableViewCell {

    @IBOutlet weak var imgView : UIImageView!
    @IBOutlet weak var lblInfo : UILabel!
    
    func configureTextInfoCell(textInfo : String){
        let index = textInfo.index(of: ":")
        let title = String(textInfo[..<index!])
        let text = String(textInfo[index!...])
        lblInfo.setAttributedText(texts: [title,text], attributes: [[NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 16)],[NSAttributedStringKey.font : UIFont.systemFont(ofSize: 16)]])
    }

}
