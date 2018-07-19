//
//  UIViewControllerExtension.swift
//  TechFlakeAssignment
//
//  Created by Jayesh on 19/07/18.
//  Copyright © 2018 Jayesh kanzariya. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func showActivityIndicator() {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.center = view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = .gray
        activityIndicator.startAnimating()
        activityIndicator.tag = 100 // 100 for example
        view.addSubview(activityIndicator)
    }
    
    func hideActivityIndicator() {
        let activityIndicator = view.viewWithTag(100) as? UIActivityIndicatorView
        activityIndicator?.stopAnimating()
        activityIndicator?.removeFromSuperview()
    }
}
