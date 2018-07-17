//
//  JKFullScreenImage.swift
//  Tec_Fake_PracticalTest
//
//  Created by Jayesh on 09/07/18.
//  Copyright © 2018 Jayesh kanzariya. All rights reserved.
//

import UIKit

class JKFullScreenImage: UIImageView {

    var tempRect: CGRect?
    var bgView: UIView!
    
    override func awakeFromNib() {
        self.layer.cornerRadius = self.frame.size.height / 2
        self.layer.masksToBounds = false
        self.clipsToBounds = true
    }
    
    
    //MARK: Life cycle
    override func draw(_ rect: CGRect) {
        super.draw(rect)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(JKFullScreenImage.popUpImageToFullScreen))
        self.addGestureRecognizer(tapGesture)
        self.isUserInteractionEnabled = true
    }
    
    //MARK: Actions of Gestures
    @objc func exitFullScreen () {
        let imageV = bgView.subviews[0] as! UIImageView
        UIView.animate(withDuration: 0.4, animations: {
            imageV.frame = self.tempRect!
        }, completion: { (bol) in
            self.bgView.removeFromSuperview()
        })
    }
    
    @objc func popUpImageToFullScreen() {
        if let window = UIApplication.shared.delegate?.window {
            let parentView = self.findParentViewController(self)!.view
            bgView = UIView(frame: UIScreen.main.bounds)
            bgView.backgroundColor = UIColor.white
            bgView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(JKFullScreenImage.exitFullScreen)))
            let imageV = UIImageView(image: self.image)
            let point = self.convert(self.bounds, to: parentView)
            imageV.frame = point
            tempRect = point
            imageV.contentMode = .scaleToFill
            self.bgView.addSubview(imageV)
            window?.addSubview(bgView)
            UIView.animate(withDuration: 0.4, animations: {
                imageV.frame = CGRect(x: 0, y: 0, width: (parentView?.frame.width)!, height: (parentView?.frame.width)!)
                imageV.center = (parentView?.center)!
            })
        }
    }
    
    func findParentViewController(_ view: UIView) -> UIViewController? {
        var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder!.next
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }

}
