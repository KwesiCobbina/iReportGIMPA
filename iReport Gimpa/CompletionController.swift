//
//  CompletionController.swift
//  iReport Gimpa
//
//  Created by Kwesi Cobbina on 01/05/2017.
//  Copyright © 2017 Kwesi Cobbina. All rights reserved.
//

import UIKit


class CompletionController: UIViewController {
    
    lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "success")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.isUserInteractionEnabled = false
        return imageView
    }()
    
    let sName: String = String()
    
    let completionLabel: UILabel = {
        let completionLabel = UILabel()
        //completionLabel.text = "Thank you for making GIMPA \() a better place."
        completionLabel.translatesAutoresizingMaskIntoConstraints = false
        completionLabel.font = UIFont.systemFont(ofSize: 14)
        completionLabel.textColor = UIColor.white
        completionLabel.shadowColor = UIColor.lightGray
        completionLabel.layer.shadowOffset = CGSize(width: 0, height: 0)
        completionLabel.layer.shadowOpacity = 0.2
        completionLabel.layer.shadowRadius = 1
        completionLabel.textAlignment = .center
        return completionLabel
    }()
    
    let submitNewBtn: UIButton = {
        let subNewButton = UIButton(type: .system)
        subNewButton.setTitle("Evaluate Again", for: .normal)
        subNewButton.layer.cornerRadius = 5
        subNewButton.layer.masksToBounds = true
        subNewButton.translatesAutoresizingMaskIntoConstraints = false
        subNewButton.backgroundColor = UIColor(red: 110/255, green: 165/255, blue: 22/255, alpha: 1)
        subNewButton.setTitleColor(UIColor.white, for: .normal)
        subNewButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        subNewButton.addTarget(self, action: #selector(handleSubmit), for: .touchUpInside)
        return subNewButton
    }()
    
    func handleSubmit(){
        let homeController = UINavigationController(rootViewController: SelectorController())
        present(homeController, animated: true, completion: nil)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()        
        
       
        view.addSubview(logoImageView)
        logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -150).isActive = true
        logoImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        
        view.addSubview(completionLabel)
        completionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        completionLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 20).isActive = true
        completionLabel.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        completionLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        view.addSubview(submitNewBtn)
        submitNewBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        submitNewBtn.topAnchor.constraint(equalTo: completionLabel.bottomAnchor, constant: 20).isActive = true
        submitNewBtn.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        submitNewBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "complaint_app_bg")?.draw(in: self.view.bounds)
        
        if let image: UIImage = UIGraphicsGetImageFromCurrentImageContext(){
            UIGraphicsEndImageContext()
            self.view.backgroundColor = UIColor(patternImage: image)
        }else{
            UIGraphicsEndImageContext()
            debugPrint("Image not available")
        }
        
        
    }



}
