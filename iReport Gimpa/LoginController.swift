//
//  LoginController.swift
//  iReport Gimpa
//
//  Created by Kwesi Cobbina on 30/04/2017.
//  Copyright © 2017 Kwesi Cobbina. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn


class LoginController: UIViewController, GIDSignInUIDelegate {

    
    let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "gimpa-logo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.isUserInteractionEnabled = false
        
        return imageView
    }()
    
    let submitNewBtn: UIButton = {
        let subNewButton = UIButton(type: .system)
        subNewButton.setTitle("Login", for: .normal)
        subNewButton.layer.cornerRadius = 10
        subNewButton.layer.masksToBounds = true
        subNewButton.translatesAutoresizingMaskIntoConstraints = false
        subNewButton.backgroundColor = UIColor.white
        subNewButton.setTitleColor(UIColor.black, for: .normal)
        subNewButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        subNewButton.addTarget(self, action: #selector(handleSubmit), for: .touchUpInside)
        return subNewButton
    }()
    
    func handleSubmit(){
        let homeController = UINavigationController(rootViewController: SelectorController())
        present(homeController, animated: true, completion: nil)
    }
    
    let hintView: UIView = {
        let hintsView = UIView()
        hintsView.translatesAutoresizingMaskIntoConstraints = false
        hintsView.backgroundColor = UIColor(white: 1, alpha: 0.5)
        hintsView.layer.cornerRadius = 5
        hintsView.layer.masksToBounds = true
        return hintsView
    }()

    
    let appHint: UILabel = {
        let hint = UILabel()
        hint.translatesAutoresizingMaskIntoConstraints = false
        hint.backgroundColor = UIColor.clear
        hint.layer.cornerRadius = 3
        hint.layer.masksToBounds = true
        hint.text = "Note: You cannot sign in with any other e-mail apart from your assigned email from the school."
        hint.font = UIFont.italicSystemFont(ofSize: 14)
        hint.numberOfLines = 0
        hint.textAlignment = .justified
        hint.adjustsFontForContentSizeCategory = true
        hint.lineBreakMode = NSLineBreakMode.byWordWrapping
        return hint
    }()
    let schoolName: UILabel = {
        let name = UILabel()
        name.text = "GEMS"
        name.font = UIFont.systemFont(ofSize: 30)
        name.translatesAutoresizingMaskIntoConstraints = false
        name.textColor = UIColor.white
        return name
    }()
    let appName: UILabel = {
        let app = UILabel()
        app.textColor = UIColor.white
        app.text = "GIMPA ELECTRONIC MONITORING SYSTEM"
        app.font = UIFont.systemFont(ofSize: 12)
        app.translatesAutoresizingMaskIntoConstraints = false
        return app
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
        setupPage()
        setupGoogleButton()


    }
    
    
    fileprivate func setupPage(){
        
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "complaint_app_bg")?.draw(in: self.view.bounds)
        
        if let image: UIImage = UIGraphicsGetImageFromCurrentImageContext(){
            UIGraphicsEndImageContext()
            self.view.backgroundColor = UIColor(patternImage: image)
        }else{
            UIGraphicsEndImageContext()
            debugPrint("Image not available")
        }
        view.addSubview(logoImageView)
        logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -80).isActive = true
        logoImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        view.addSubview(schoolName)
        schoolName.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        schoolName.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 20).isActive = true
        schoolName.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        view.addSubview(appName)
        appName.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        appName.bottomAnchor.constraint(equalTo: schoolName.bottomAnchor, constant: 10).isActive = true
        appName.heightAnchor.constraint(equalToConstant: 30).isActive = true
    
        view.addSubview(hintView)
        hintView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        hintView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10).isActive = true
        hintView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -10).isActive = true
        hintView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        hintView.addSubview(appHint)
        appHint.topAnchor.constraint(equalTo: hintView.topAnchor, constant: 5).isActive = true
        appHint.bottomAnchor.constraint(equalTo: hintView.bottomAnchor, constant: -5).isActive = true
        appHint.leftAnchor.constraint(equalTo: hintView.leftAnchor, constant: 5).isActive = true
        appHint.rightAnchor.constraint(equalTo: hintView.rightAnchor, constant: -5).isActive = true
    }
    
    
    fileprivate func setupGoogleButton(){
        //add google signIn btn
        let googleButton = GIDSignInButton()
        googleButton.frame = CGRect(x: 16, y: view.frame.height / 2 + 100, width: view.frame.width - 24, height: 50)
        view.addSubview(googleButton)
        GIDSignIn.sharedInstance().uiDelegate = self
        
    }
 
    
    let alert = UIAlertController(title: nil, message: "please use your GIMPA student email", preferredStyle: .alert)
    
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }

}
