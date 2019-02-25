//
//  LoaderController.swift
//  iReport Gimpa
//
//  Created by Kwesi Cobbina on 08/10/2017.
//  Copyright © 2017 Kwesi Cobbina. All rights reserved.
//

import UIKit

class LoaderController: NSObject {

    static let sharedInstance = LoaderController()
    private let activityIndicator = UIActivityIndicatorView()
    
    private func setupLoader(){
        removeLoader()
        
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = .whiteLarge
        activityIndicator.color = .red
    }
    
    func showLoader() {
        setupLoader()
        
        let appDel = UIApplication.shared.delegate as!AppDelegate
        let holdingView = appDel.window!.rootViewController!.view!
        
        DispatchQueue.main.async {
            self.activityIndicator.center = holdingView.center
            self.activityIndicator.startAnimating()
            holdingView.addSubview(self.activityIndicator)
            holdingView.alpha = 0.5
            UIApplication.shared.beginIgnoringInteractionEvents()
        }
        
    }
    
    func removeLoader() {
        
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
            self.activityIndicator.removeFromSuperview()
            UIApplication.shared.endIgnoringInteractionEvents()
        }
    }
}
