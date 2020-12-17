//
//  ProgressIndicatorManager.swift
//  WannaDogui
//
//  Created by Jayesh on 18/06/20.
//  Copyright © 2020 Jayesh kanzariya. All rights reserved.
//

import UIKit
import SVProgressHUD

/// Singleton class that is used to handle stuff related to the progress indicator.
class ProgressIndicatorManager {
    /// It's used to initialise the basic setup for progress indicator manager.
    private init() { setDefaultproperty() }
    /// It's used to access the instance of `ProgressIndicatorManager`.
    static let shared = ProgressIndicatorManager()
    /// MARK:- Functions
    /// It's used to set default property for the `ProgressIndicatorManager`.
    private func setDefaultproperty(){
        SVProgressHUD.setDefaultStyle(.custom)
        SVProgressHUD.setDefaultMaskType(.custom)
        SVProgressHUD.setForegroundColor(.themeColor())
    }
    /// It's used to show simple indicator with default setting.
    func show(){
        SVProgressHUD.show()
    }
    /// It's used to show simple indicator with default setting and message.
    /// - Parameters:
    ///     - withStatus: an instance of `String` that is used for show progress message.
    func show(withStatus message:String){
        SVProgressHUD.show(withStatus: message)
    }
    /// It's used to show indicator with success message.
    /// - Parameters:
    ///     - withStatus: an instance of `String` that is used for show progress message.
    func showSuccess(withStatus message:String){
        SVProgressHUD.showSuccess(withStatus: message)
    }
    /// It's used to show indicator with error message.
    /// - Parameters:
    ///     - withStatus: an instance of `String` that is used for show progress message.
    func showError(withStatus message:String){
        SVProgressHUD.showError(withStatus: message)
    }
    /// It's used to dismiss the indictor.
    func dismiss(){
        SVProgressHUD.dismiss()
    }
    /// It's used to dismiss the indictor after given delay.
    /// - Parameters:
    ///     - with: an instance of `TimeInterval` that is used for dismiss progress after that delay.
    func dismiss(with delay:TimeInterval){
        SVProgressHUD.dismiss(withDelay: delay)
    }
    
    func showProgressWith(progress: Double) {
        SVProgressHUD.showProgress(Float(progress), status: "Downloading...")
    }
}

