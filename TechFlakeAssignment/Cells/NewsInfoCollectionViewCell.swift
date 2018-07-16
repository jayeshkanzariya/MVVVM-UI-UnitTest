//
//  NewsInfoCollectionViewCell.swift
//  Tec_Fake_PracticalTest
//
//  Created by Jayesh on 08/07/18.
//  Copyright © 2018 Jayesh kanzariya. All rights reserved.
//

import UIKit

class NewsInfoCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "NewsInfoCollectionViewCell"
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var imgView : UIImageView!
    @IBOutlet weak var lblDesc : UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = 6
        containerView.layer.masksToBounds = true
    }
    
    func configureCell(obj : NewsModel){
        lblDesc.text = obj.description
        imgView.sd_setImage(with: URL(string: obj.urlToImage ?? ""), completed: nil)
    }
}
