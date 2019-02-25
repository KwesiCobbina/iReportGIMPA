//
//  SelectorController.swift
//  iReport Gimpa
//
//  Created by Kwesi Cobbina on 02/06/2017.
//  Copyright © 2017 Kwesi Cobbina. All rights reserved.
//

import UIKit

class SelectorController: UIViewController {

    
    lazy var startImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "start_of_lecture")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.isUserInteractionEnabled = false
        return imageView
    }()
    
    var startLecBtn: UIButton = {
        let startButton = UIButton(type: .system)
        startButton.setTitle("BEGINNING OF LECTURE", for: .normal)
        startButton.layer.cornerRadius = 5
        startButton.layer.masksToBounds = true
        startButton.translatesAutoresizingMaskIntoConstraints = false
        startButton.backgroundColor = UIColor(red: 110/255, green: 165/255, blue: 22/255, alpha: 1)
        startButton.setTitleColor(UIColor.white, for: .normal)
        startButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        startButton.addTarget(self, action: #selector(handleStart), for: .touchUpInside)
        return startButton
    }()
    func handleStart(){
        let HC = UINavigationController(rootViewController: HomeController())
        self.present(HC, animated: true, completion: nil)
    }
    
 
    let select: UILabel = {
        let sele = UILabel()
        sele.text = "Take a pick"
        //sele.font = UIFont.boldSystemFont(ofSize: 14)
        sele.textColor = UIColor.white
        sele.textAlignment = .center
        sele.translatesAutoresizingMaskIntoConstraints = false
        return sele
    }()
    
    
    lazy var stopImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "end_of_lecture")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.isUserInteractionEnabled = false
        return imageView
    }()
    let stopLecBtn: UIButton = {
        let stopButton = UIButton(type: .system)
        stopButton.setTitle("END OF LECTURE", for: .normal)
        stopButton.layer.cornerRadius = 5
        stopButton.layer.masksToBounds = true
        stopButton.translatesAutoresizingMaskIntoConstraints = false
        stopButton.backgroundColor = UIColor(red: 110/255, green: 165/255, blue: 22/255, alpha: 1)
        stopButton.setTitleColor(UIColor.white, for: .normal)
        stopButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        stopButton.addTarget(self, action: #selector(handleStop), for: .touchUpInside)
        return stopButton
    }()
    func handleStop(){
        let HC = UINavigationController(rootViewController: ViewController())
        self.present(HC, animated: true, completion: nil)
    }

    
    
    
    var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "complaint_app_bg")?.draw(in: self.view.bounds)
        
        if let image: UIImage = UIGraphicsGetImageFromCurrentImageContext(){
            UIGraphicsEndImageContext()
            self.view.backgroundColor = UIColor(patternImage: image)
        }else{
            UIGraphicsEndImageContext()
            debugPrint("Image not available")
        }

        scrollView = UIScrollView(frame: view.bounds)
        scrollView.contentSize = view.bounds.size
        scrollView.backgroundColor = UIColor.clear
        scrollView.translatesAutoresizingMaskIntoConstraints = true
        
        view.addSubview(scrollView)
        scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scrollView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true


        scrollView.addSubview(select)
        select.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        select.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 30).isActive = true
        select.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        select.heightAnchor.constraint(equalToConstant: 40).isActive = true

        
        scrollView.addSubview(startImageView)
        startImageView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        startImageView.topAnchor.constraint(equalTo: select.bottomAnchor, constant: 80).isActive = true
        startImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        startImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        scrollView.addSubview(startLecBtn)
        startLecBtn.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        startLecBtn.topAnchor.constraint(equalTo: startImageView.bottomAnchor, constant: 70).isActive = true
        startLecBtn.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -12).isActive = true
        startLecBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        scrollView.addSubview(stopImageView)
        stopImageView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        stopImageView.topAnchor.constraint(equalTo: startLecBtn.topAnchor, constant: 150).isActive = true
        stopImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        stopImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        scrollView.addSubview(stopLecBtn)
        stopLecBtn.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        stopLecBtn.topAnchor.constraint(equalTo: stopImageView.bottomAnchor, constant: 70).isActive = true
        stopLecBtn.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -12).isActive = true
        stopLecBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        stopLecBtn.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -30).isActive = true

    }

}



























