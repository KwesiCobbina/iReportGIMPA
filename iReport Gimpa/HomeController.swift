//
//  ViewController.swift
//  iReport Gimpa
//
//  Created by Kwesi Cobbina on 30/04/2017.
//  Copyright © 2017 Kwesi Cobbina. All rights reserved.
//

import UIKit
import GoogleSignIn
import Firebase


class HomeController: UIViewController,UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate, UITextViewDelegate {
    
    // returns the number of 'columns' to display.
    @available(iOS 2.0, *)
     func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1
    }
    
	
    // returns the # of rows in each component..
    @available(iOS 2.0, *)
     func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        
        if pickerView.tag == 1 {
            
            return schoolData.count
            
        }
        
        if pickerView.tag == 2 {
            
            return levelData.count
            
        }
        
        if pickerView.tag == 3 {
            if sessionField.text == "Regular" {
                return sessionData.count
            }
            else {
                return sessionData1.count
            }
        }
        
        if pickerView.tag == 4 {
            return studTypeData.count
        }
        
        return 0
    }
    
    var studentPicker: UIPickerView = {
        let pickStudType = UIPickerView()
        pickStudType.translatesAutoresizingMaskIntoConstraints = false
        pickStudType.tag = 4
        return pickStudType
    }()

    var schoolPicker:UIPickerView = {
        let pickSchool = UIPickerView()
        pickSchool.translatesAutoresizingMaskIntoConstraints = false
        pickSchool.tag = 1
        return pickSchool
    }()
    
    var sessionPicker:UIPickerView = {
        let pickSession = UIPickerView()
        pickSession.translatesAutoresizingMaskIntoConstraints = false
        pickSession.tag = 3
        return pickSession
    }()
    
    var levelPicker:UIPickerView = {
        let pickLevel = UIPickerView()
        pickLevel.translatesAutoresizingMaskIntoConstraints = false
        pickLevel.tag = 2
        return pickLevel
    }()
    
    var schoolData: [String] = [String]()
    var sessionData: [String] = [String]()
    var sessionData1: [String] = [String]()
    var levelData: [String] = [String]()
    var studTypeData: [String] = [String]()
    
    var AirStats: String = String()
    var FanStats: String = String()
    var ProStats: String = String()
    var LytStats: String = String()
    var YfyStats: String = String()
    var PlgStats: String = String()
    
    let studentType: UILabel = {
        let complain = UILabel()
        complain.text = "Student type"
        complain.translatesAutoresizingMaskIntoConstraints = false
        complain.font = UIFont.systemFont(ofSize: 14)
        complain.textAlignment = .left
        complain.layer.shadowOffset = CGSize(width: 0, height: 0)
        complain.layer.shadowOpacity = 0.2
        complain.layer.shadowRadius = 1
        complain.shadowColor = UIColor.lightGray
        complain.textColor = UIColor.white
        return complain
    }()
    lazy var studentTypeField: UITextField = {
        let typeField = UITextField()
        typeField.translatesAutoresizingMaskIntoConstraints = false
        typeField.backgroundColor = UIColor(white: 0, alpha: 0.3)
        typeField.layer.cornerRadius = 5
        typeField.textColor = UIColor.white
        typeField.layer.masksToBounds = true
        return typeField
    }()
    
    let hintView: UIView = {
        let hintsView = UIView()
        hintsView.translatesAutoresizingMaskIntoConstraints = false
        hintsView.backgroundColor = UIColor.clear
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
        hint.text = "Hint:Regular students(morning and evening) start a new academic year from Febuary to May and Modular students start right after regular students have vacated i.e June."
        hint.font = UIFont.italicSystemFont(ofSize: 14)
        hint.numberOfLines = 0
        hint.textAlignment = .justified
        hint.textColor = UIColor.white
        hint.adjustsFontForContentSizeCategory = true
        hint.lineBreakMode = NSLineBreakMode.byWordWrapping
        return hint
    }()

    
    
    let projector: UILabel = {
        let complain = UILabel()
        complain.text = "Did the projector work?"
        complain.translatesAutoresizingMaskIntoConstraints = false
        complain.font = UIFont.systemFont(ofSize: 14)
        complain.textAlignment = .left
        complain.layer.shadowOffset = CGSize(width: 0, height: 0)
        complain.layer.shadowOpacity = 0.2
        complain.layer.shadowRadius = 1
        complain.shadowColor = UIColor.lightGray
        complain.textColor = UIColor.white
        return complain
    }()
    let projectorCell: UIView = {
        let cell = UIView()
        //cell.backgroundColor = UIColor(white: 1, alpha: 1)
        cell.translatesAutoresizingMaskIntoConstraints = false
        cell.layer.cornerRadius = 5
        cell.layer.masksToBounds = true
        return cell
    }()

    
    let aircondition: UILabel = {
        let complain = UILabel()
        complain.text = "Did the A/C work?"
        complain.translatesAutoresizingMaskIntoConstraints = false
        complain.font = UIFont.systemFont(ofSize: 14)
        complain.textAlignment = .left
        complain.layer.shadowOffset = CGSize(width: 0, height: 0)
        complain.layer.shadowOpacity = 0.2
        complain.layer.shadowRadius = 1
        complain.shadowColor = UIColor.lightGray
        complain.textColor = UIColor.white
        return complain
    }()
    let airconditionCell: UIView = {
        let cell = UIView()
        //cell.backgroundColor = UIColor(white: 1, alpha: 1)
        cell.translatesAutoresizingMaskIntoConstraints = false
        cell.layer.cornerRadius = 5
        cell.layer.masksToBounds = true
        return cell
    }()
    
    let wifi: UILabel = {
        let complain = UILabel()
        complain.text = "Did the wifi work?"
        complain.translatesAutoresizingMaskIntoConstraints = false
        complain.font = UIFont.systemFont(ofSize: 14)
        complain.textAlignment = .left
        complain.layer.shadowOffset = CGSize(width: 0, height: 0)
        complain.layer.shadowOpacity = 0.2
        complain.layer.shadowRadius = 1
        complain.shadowColor = UIColor.lightGray
        complain.textColor = UIColor.white
        return complain
    }()
    let wifiCell: UIView = {
        let cell = UIView()
        //cell.backgroundColor = UIColor(white: 1, alpha: 1)
        cell.translatesAutoresizingMaskIntoConstraints = false
        cell.layer.cornerRadius = 5
        cell.layer.masksToBounds = true
        return cell
    }()
    
    let plugs: UILabel = {
        let complain = UILabel()
        complain.text = "Did the plugs work?"
        complain.translatesAutoresizingMaskIntoConstraints = false
        complain.font = UIFont.systemFont(ofSize: 14)
        complain.textAlignment = .left
        complain.layer.shadowOffset = CGSize(width: 0, height: 0)
        complain.layer.shadowOpacity = 0.2
        complain.layer.shadowRadius = 1
        complain.shadowColor = UIColor.lightGray
        complain.textColor = UIColor.white
        return complain
    }()
    
    let plugsCell: UIView = {
        let cell = UIView()
        //cell.backgroundColor = UIColor(white: 1, alpha: 1)
        cell.translatesAutoresizingMaskIntoConstraints = false
        cell.layer.cornerRadius = 5
        cell.layer.masksToBounds = true
        return cell
    }()
    
    let light: UILabel = {
        let complain = UILabel()
        complain.text = "Did the lights work?"
        complain.translatesAutoresizingMaskIntoConstraints = false
        complain.font = UIFont.systemFont(ofSize: 14)
        complain.textAlignment = .left
        complain.layer.shadowOffset = CGSize(width: 0, height: 0)
        complain.layer.shadowOpacity = 0.2
        complain.layer.shadowRadius = 1
        complain.shadowColor = UIColor.lightGray
        complain.textColor = UIColor.white
        return complain
    }()
    let lightCell: UIView = {
        let cell = UIView()
        //cell.backgroundColor = UIColor(white: 1, alpha: 1)
        cell.translatesAutoresizingMaskIntoConstraints = false
        cell.layer.cornerRadius = 5
        cell.layer.masksToBounds = true
        return cell
    }()
    
    let fans: UILabel = {
        let complain = UILabel()
        complain.text = "Did the fans work?"
        complain.translatesAutoresizingMaskIntoConstraints = false
        complain.font = UIFont.systemFont(ofSize: 14)
        complain.textAlignment = .left
        complain.shadowColor = UIColor.lightGray
        complain.layer.shadowOffset = CGSize(width: 0, height: 0)
        complain.layer.shadowOpacity = 0.2
        complain.layer.shadowRadius = 1
        complain.textColor = UIColor.white
        return complain
    }()
    let fansCell: UIView = {
        let cell = UIView()
        //cell.backgroundColor = UIColor(white: 1, alpha: 1)
        cell.translatesAutoresizingMaskIntoConstraints = false
        cell.layer.cornerRadius = 5
        cell.layer.masksToBounds = true
        return cell
    }()
    
    
    let dateLabel: UILabel = {
        let date = UILabel()
        let dwate = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        let Dateresult = formatter.string(from: dwate)
        date.text = Dateresult
        date.translatesAutoresizingMaskIntoConstraints = false
        date.font = UIFont.systemFont(ofSize: 14)
        date.textColor = UIColor.white
        return date
    }()
    
    let schoolName: UILabel = {
        let schName = UILabel()
        schName.text = "Select School"
        schName.translatesAutoresizingMaskIntoConstraints = false
        schName.font = UIFont.systemFont(ofSize: 14)
        schName.textColor = UIColor.white
        schName.textAlignment = .left
        return schName
    }()
    
    lazy var schoolNameField: UITextField = {
        let nameField = UITextField()
        nameField.translatesAutoresizingMaskIntoConstraints = false
        nameField.backgroundColor = UIColor(white: 0, alpha: 0.3)
        nameField.layer.cornerRadius = 5
        nameField.textColor = UIColor.white
        nameField.layer.masksToBounds = true
        return nameField
    }()

    let lectureHall: UILabel = {
        let hall = UILabel()
        hall.text = "Enter Lecture Hall"
        hall.translatesAutoresizingMaskIntoConstraints = false
        hall.font = UIFont.systemFont(ofSize: 14)
        hall.textAlignment = .left
        hall.textColor = UIColor.white
        return hall
    }()
    
    lazy var hallNameField: UITextField = {
        let hallField = UITextField()
        hallField.translatesAutoresizingMaskIntoConstraints = false
        hallField.backgroundColor = UIColor(white: 0, alpha: 0.3)
        hallField.layer.cornerRadius = 5
		hallField.delegate = self
        hallField.textColor = UIColor.white
        hallField.layer.masksToBounds = true
        return hallField
    }()
    
    let studentLevel: UILabel = {
        let level = UILabel()
        level.text = "Select Level"
        level.translatesAutoresizingMaskIntoConstraints = false
        level.font = UIFont.systemFont(ofSize: 14)
        level.textColor = UIColor.white
        level.textAlignment = .left
        return level
    }()
    
    lazy var levelSelectorField: UITextField = {
        let levelSelect = UITextField()
        levelSelect.translatesAutoresizingMaskIntoConstraints = false
        levelSelect.backgroundColor = UIColor(white: 0, alpha: 0.3)
        levelSelect.layer.cornerRadius = 5
        levelSelect.layer.masksToBounds = true
        levelSelect.textColor = UIColor.white
        return levelSelect
    }()
    let studentCourse: UILabel = {
        let course = UILabel()
        course.text = "Enter Course Title"
        course.translatesAutoresizingMaskIntoConstraints = false
        course.font = UIFont.systemFont(ofSize: 14)
        course.textColor = UIColor.white
        course.shadowColor = UIColor.lightGray
        course.layer.shadowOffset = CGSize(width: 0, height: 0)
        course.layer.shadowOpacity = 0.2
        course.layer.shadowRadius = 1
        course.textAlignment = .left
        return course
    }()
    
    lazy var courseField: UITextField = {
        let coursesField = UITextField()
        coursesField.translatesAutoresizingMaskIntoConstraints = false
        coursesField.backgroundColor = UIColor(white: 0, alpha: 0.3)
        coursesField.layer.cornerRadius = 5
		coursesField.delegate = self
        coursesField.layer.masksToBounds = true
        coursesField.textColor = UIColor.white
        return coursesField
    }()
    
    let courseCode: UILabel = {
        let crseCode = UILabel()
        crseCode.text = "Enter Course Code"
        crseCode.translatesAutoresizingMaskIntoConstraints = false
        crseCode.font = UIFont.systemFont(ofSize: 14)
        crseCode.textColor = UIColor.white
        crseCode.shadowColor = UIColor.lightGray
        crseCode.layer.shadowOffset = CGSize(width: 0, height: 0)
        crseCode.layer.shadowOpacity = 0.2
        crseCode.layer.shadowRadius = 1
        crseCode.textAlignment = .left
        return crseCode
    }()
    
    lazy var courseCodeField: UITextField = {
        let crseCodeField = UITextField()
        crseCodeField.translatesAutoresizingMaskIntoConstraints = false
        crseCodeField.backgroundColor = UIColor(white: 0, alpha: 0.3)
        crseCodeField.layer.cornerRadius = 5
		crseCodeField.delegate = self
        crseCodeField.layer.masksToBounds = true
        crseCodeField.textColor = UIColor.white
        return crseCodeField
    }()
    
    
    let lecturesID: UILabel = {
        let lecName = UILabel()
        lecName.text = "Enter Lecturer's ID"
        lecName.translatesAutoresizingMaskIntoConstraints = false
        lecName.font = UIFont.systemFont(ofSize: 14)
        lecName.textColor = UIColor.white
        lecName.shadowColor = UIColor.lightGray
        lecName.layer.shadowOffset = CGSize(width: 0, height: 0)
        lecName.layer.shadowOpacity = 0.2
        lecName.layer.shadowRadius = 1
        lecName.textAlignment = .left
        return lecName
    }()
    
    lazy var lecturerIDField: UITextField = {
        let lecIDField = UITextField()
        lecIDField.translatesAutoresizingMaskIntoConstraints = false
        lecIDField.backgroundColor = UIColor(white: 0, alpha: 0.3)
        lecIDField.layer.cornerRadius = 5
		lecIDField.delegate = self
        lecIDField.layer.masksToBounds = true
        lecIDField.textColor = UIColor.white
        return lecIDField
    }()
    
    
    let courseSessions: UILabel = {
        let courseSess = UILabel()
        courseSess.text = "Select Scheduled Lecture Time"
        courseSess.translatesAutoresizingMaskIntoConstraints = false
        courseSess.font = UIFont.systemFont(ofSize: 14)
        courseSess.textAlignment = .left
        courseSess.shadowColor = UIColor.lightGray
        courseSess.layer.shadowOffset = CGSize(width: 0, height: 0)
        courseSess.layer.shadowOpacity = 0.2
        courseSess.layer.shadowRadius = 1
        courseSess.textColor = UIColor.white
        return courseSess
    }()
    
    lazy var sessionField: UITextField = {
        let sessField = UITextField()
        sessField.translatesAutoresizingMaskIntoConstraints = false
        sessField.backgroundColor = UIColor(white: 0, alpha: 0.3)
        sessField.layer.cornerRadius = 5
        sessField.textColor = UIColor.white
        sessField.layer.masksToBounds = true
        return sessField
    }()
    
    let studentComplain: UILabel = {
        let courseSess = UILabel()
        courseSess.text = "Other Issues(Optional)"
        courseSess.translatesAutoresizingMaskIntoConstraints = false
        courseSess.font = UIFont.systemFont(ofSize: 14)
        courseSess.textColor = UIColor.white
        courseSess.shadowColor = UIColor.lightGray
        courseSess.layer.shadowOffset = CGSize(width: 0, height: 0)
        courseSess.layer.shadowOpacity = 0.2
        courseSess.layer.shadowRadius = 1
        courseSess.textAlignment = .left
        return courseSess
    }()
    
    lazy var complainBox: UITextView = {
        let complainBoxs = UITextView()
        complainBoxs.translatesAutoresizingMaskIntoConstraints = false
        complainBoxs.backgroundColor = UIColor(white: 0, alpha: 0.3)
        complainBoxs.layer.cornerRadius = 5
        complainBoxs.isEditable = true
        complainBoxs.textColor = UIColor.white
		complainBoxs.delegate = self
        complainBoxs.font = UIFont.systemFont(ofSize: 18)
        complainBoxs.layer.masksToBounds = true
        return complainBoxs
    }()
    
    let submitBtn: UIButton = {
        let subButton = UIButton(type: .system)
        subButton.setTitle("Submit", for: .normal)
        subButton.layer.cornerRadius = 5
        subButton.layer.masksToBounds = true
        subButton.translatesAutoresizingMaskIntoConstraints = false
        subButton.backgroundColor = UIColor(red: 110/255, green: 165/255, blue: 22/255, alpha: 1)
        subButton.setTitleColor(UIColor.white, for: .normal)
        subButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        subButton.addTarget(self, action: #selector(handleSubmit), for: .touchUpInside)
        return subButton
    }()
    
    func handleSubmit(){

        let email = FIRAuth.auth()?.currentUser?.email
        let ref = FIRDatabase.database().reference().child("FeedBacks").child("BeginningOfLecture")
        let childRef = ref.childByAutoId()
        if (hallNameField.text == "" || sessionField.text == ""){
            
            let alert = UIAlertController(title: "Alert", message: "Opps.. looks like you left some fields empty.Let's complete it.Thanks", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Close", style: UIAlertActionStyle.default
                , handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else{
        let values = ["complaint": complainBox.text, "course_code": courseCodeField.text, "course_title": courseField.text, "did_ac_work": AirStats as Any!, "did_fans_work": FanStats as Any!, "did_lights_work": LytStats as Any!, "did_plugs_work": PlgStats as Any!, "did_projector_work": ProStats as Any!, "did_wifi_work": YfyStats as Any!, "lecture_hall": hallNameField.text,"lecturer_id": lecturerIDField.text, "level": levelSelectorField.text, "scheduled_lec_time": sessionField.text, "school": schoolNameField.text, "student_type": studentTypeField.text, "date": dateLabel.text, "email": email]
            
//            let aiv = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
//            aiv.center = self.view.center
//            self.view.addSubview(aiv)
//            aiv.color = UIColor.purple
//            aiv.startAnimating()

			LoaderController.sharedInstance.showLoader()
        childRef.updateChildValues(values as Any as! [AnyHashable : Any], withCompletionBlock: { (error, ref) in
            if (error != nil){
                print (error!)
				LoaderController.sharedInstance.removeLoader()
//                aiv.stopAnimating()
            }
            else{
//                aiv.stopAnimating()
				LoaderController.sharedInstance.removeLoader()
                let completionController = CompletionController()
                self.present(completionController, animated: true, completion: nil)
            }
        })}
    }
	
    
    var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(handleLogout))
        addISButtonViaCode()
        addAirconISButtons()
        addWifiISButtons()
        addPlugsISButtons()
        addLightsISButtons()
        addFansISButtons()
        
       
        schoolData = ["School Of Technology", "Faculty Of Law", "Business School", "Public School And Governance"]
        
        sessionData = ["9:00am - 12:00pm", "1:00pm - 4:00pm", "5:00pm - 8:00pm", "6:00pm - 9:00pm"]
        sessionData1 = ["8:30am - 10:30am", "10:45am - 12:45pm", "2:00pm - 4:45pm", "5:00pm - 7:00pm"]
        
        
        levelData = ["Level 100", "Level 200", "Level 300", "Level 400", "Matured", "Post Graduate"]
        studTypeData = ["Regular", "Modular"]
        
        
        self.hallNameField.delegate = self
        
        
        schoolPicker.delegate = self
        levelPicker.delegate = self
        sessionPicker.delegate = self
        studentPicker.delegate = self
        
        schoolNameField.inputView = schoolPicker
        levelSelectorField.inputView = levelPicker
        sessionField.inputView = sessionPicker
        studentTypeField.inputView = studentPicker
        
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "complaint_app_bg")?.draw(in: self.view.bounds)
        
        if let image: UIImage = UIGraphicsGetImageFromCurrentImageContext(){
            UIGraphicsEndImageContext()
            self.view.backgroundColor = UIColor(patternImage: image)
        }else{
            UIGraphicsEndImageContext()
            debugPrint("Image not available")
        }
        
        
        setupToolbar()
        
        scrollView = UIScrollView(frame: view.bounds)
        scrollView.contentSize = view.bounds.size
        scrollView.backgroundColor = UIColor.clear
        scrollView.translatesAutoresizingMaskIntoConstraints = true
        

        view.addSubview(scrollView)
        scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scrollView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        
        scrollView.addSubview(dateLabel)
        dateLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        dateLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 5).isActive = true
        dateLabel.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -10).isActive = true
        dateLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        scrollView.addSubview(studentType)
        studentType.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        studentType.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 5).isActive = true
        studentType.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -10).isActive = true
        studentType.heightAnchor.constraint(equalToConstant: 30).isActive = true
        

        scrollView.addSubview(studentTypeField)
        studentTypeField.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        studentTypeField.topAnchor.constraint(equalTo: studentType.bottomAnchor, constant: 5).isActive = true
        studentTypeField.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -12).isActive = true
        studentTypeField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        scrollView.addSubview(hintView)
        hintView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        hintView.topAnchor.constraint(equalTo: studentTypeField.bottomAnchor, constant: 5).isActive = true
        hintView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -10).isActive = true
        hintView.heightAnchor.constraint(equalToConstant: 80).isActive = true

        hintView.addSubview(appHint)
        appHint.topAnchor.constraint(equalTo: hintView.topAnchor, constant: 5).isActive = true
        appHint.bottomAnchor.constraint(equalTo: hintView.bottomAnchor, constant: -5).isActive = true
        appHint.leftAnchor.constraint(equalTo: hintView.leftAnchor, constant: 5).isActive = true
        appHint.rightAnchor.constraint(equalTo: hintView.rightAnchor, constant: -5).isActive = true
        
        scrollView.addSubview(schoolName)
        schoolName.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        schoolName.topAnchor.constraint(equalTo: hintView.bottomAnchor, constant: 5).isActive = true
        schoolName.heightAnchor.constraint(equalToConstant: 30).isActive = true
        schoolName.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -10).isActive = true
        
        scrollView.addSubview(schoolNameField)
        schoolNameField.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        schoolNameField.topAnchor.constraint(equalTo: schoolName.bottomAnchor, constant: 5).isActive = true
        schoolNameField.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -12).isActive = true
        schoolNameField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        scrollView.addSubview(lectureHall)
        lectureHall.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        lectureHall.topAnchor.constraint(equalTo: schoolNameField.bottomAnchor, constant: 5).isActive = true
        lectureHall.heightAnchor.constraint(equalToConstant: 30).isActive = true
        lectureHall.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -10).isActive = true
        
        scrollView.addSubview(hallNameField)
        hallNameField.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        hallNameField.topAnchor.constraint(equalTo: lectureHall.bottomAnchor, constant: 5).isActive = true
        hallNameField.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -12).isActive = true
        hallNameField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        scrollView.addSubview(studentCourse)
        studentCourse.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        studentCourse.topAnchor.constraint(equalTo: hallNameField.bottomAnchor, constant: 5).isActive = true
        studentCourse.heightAnchor.constraint(equalToConstant: 30).isActive = true
        studentCourse.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -10).isActive = true
        
        scrollView.addSubview(courseField)
        courseField.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        courseField.topAnchor.constraint(equalTo: studentCourse.bottomAnchor, constant: 5).isActive = true
        courseField.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -12).isActive = true
        courseField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        scrollView.addSubview(courseCode)
        courseCode.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        courseCode.topAnchor.constraint(equalTo: courseField.bottomAnchor, constant: 5).isActive = true
        courseCode.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -12).isActive = true
        courseCode.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        scrollView.addSubview(courseCodeField)
        courseCodeField.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        courseCodeField.topAnchor.constraint(equalTo: courseCode.bottomAnchor, constant: 5).isActive = true
        courseCodeField.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -12).isActive = true
        courseCodeField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        scrollView.addSubview(lecturesID)
        lecturesID.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        lecturesID.topAnchor.constraint(equalTo: courseCodeField.bottomAnchor, constant: 5).isActive = true
        lecturesID.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -12).isActive = true
        lecturesID.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        scrollView.addSubview(lecturerIDField)
        lecturerIDField.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        lecturerIDField.topAnchor.constraint(equalTo: lecturesID.bottomAnchor, constant: 5).isActive = true
        lecturerIDField.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -12).isActive = true
        lecturerIDField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        scrollView.addSubview(studentLevel)
        studentLevel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        studentLevel.topAnchor.constraint(equalTo: lecturerIDField.bottomAnchor, constant: 5).isActive = true
        studentLevel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        studentLevel.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -10).isActive = true
        
        scrollView.addSubview(levelSelectorField)
        levelSelectorField.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        levelSelectorField.topAnchor.constraint(equalTo: studentLevel.bottomAnchor, constant: 5).isActive = true
        levelSelectorField.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -12).isActive = true
        levelSelectorField.heightAnchor.constraint(equalToConstant: 50).isActive = true

        
        scrollView.addSubview(courseSessions)
        courseSessions.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        courseSessions.topAnchor.constraint(equalTo: levelSelectorField.bottomAnchor, constant: 5).isActive = true
        courseSessions.heightAnchor.constraint(equalToConstant: 30).isActive = true
        courseSessions.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -10).isActive = true
        
        
        scrollView.addSubview(sessionField)
        sessionField.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        sessionField.topAnchor.constraint(equalTo: courseSessions.bottomAnchor, constant: 5).isActive = true
        sessionField.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -12).isActive = true
        sessionField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        

        scrollView.addSubview(projector)
        projector.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        projector.topAnchor.constraint(equalTo: sessionField.bottomAnchor, constant: 5).isActive = true
        projector.heightAnchor.constraint(equalToConstant: 25).isActive = true
        projector.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -10).isActive = true
        
        scrollView.addSubview(projectorCell)
        projectorCell.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        projectorCell.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -1).isActive = true
        projectorCell.topAnchor.constraint(equalTo: projector.bottomAnchor, constant: 5).isActive = true
        projectorCell.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        scrollView.addSubview(aircondition)
        aircondition.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        aircondition.topAnchor.constraint(equalTo: projectorCell.bottomAnchor, constant: 5).isActive = true
        aircondition.heightAnchor.constraint(equalToConstant: 25).isActive = true
        aircondition.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -10).isActive = true
        
        scrollView.addSubview(airconditionCell)
        airconditionCell.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        airconditionCell.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -1).isActive = true
        airconditionCell.topAnchor.constraint(equalTo: aircondition.bottomAnchor, constant: 5).isActive = true
        airconditionCell.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        scrollView.addSubview(wifi)
        wifi.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        wifi.topAnchor.constraint(equalTo: airconditionCell.bottomAnchor, constant: 5).isActive = true
        wifi.heightAnchor.constraint(equalToConstant: 25).isActive = true
        wifi.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -10).isActive = true
        
        scrollView.addSubview(wifiCell)
        wifiCell.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        wifiCell.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -1).isActive = true
        wifiCell.topAnchor.constraint(equalTo: wifi.bottomAnchor, constant: 5).isActive = true
        wifiCell.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        scrollView.addSubview(plugs)
        plugs.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        plugs.topAnchor.constraint(equalTo: wifiCell.bottomAnchor, constant: 5).isActive = true
        plugs.heightAnchor.constraint(equalToConstant: 25).isActive = true
        plugs.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -10).isActive = true
        
        scrollView.addSubview(plugsCell)
        plugsCell.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        plugsCell.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -1).isActive = true
        plugsCell.topAnchor.constraint(equalTo: plugs.bottomAnchor, constant: 5).isActive = true
        plugsCell.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        scrollView.addSubview(light)
        light.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        light.topAnchor.constraint(equalTo: plugsCell.bottomAnchor, constant: 5).isActive = true
        light.heightAnchor.constraint(equalToConstant: 25).isActive = true
        light.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -10).isActive = true
        
        scrollView.addSubview(lightCell)
        lightCell.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        lightCell.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -1).isActive = true
        lightCell.topAnchor.constraint(equalTo: light.bottomAnchor, constant: 5).isActive = true
        lightCell.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        scrollView.addSubview(fans)
        fans.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        fans.topAnchor.constraint(equalTo: lightCell.bottomAnchor, constant: 5).isActive = true
        fans.heightAnchor.constraint(equalToConstant: 25).isActive = true
        fans.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -10).isActive = true
        
        scrollView.addSubview(fansCell)
        fansCell.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        fansCell.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -1).isActive = true
        fansCell.topAnchor.constraint(equalTo: fans.bottomAnchor, constant: 5).isActive = true
        fansCell.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        scrollView.addSubview(studentComplain)
        studentComplain.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        studentComplain.topAnchor.constraint(equalTo: fansCell.bottomAnchor, constant: 5).isActive = true
        studentComplain.heightAnchor.constraint(equalToConstant: 30).isActive = true
        studentComplain.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -10).isActive = true
        
        scrollView.addSubview(complainBox)
        complainBox.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        complainBox.topAnchor.constraint(equalTo: studentComplain.bottomAnchor, constant: 5).isActive = true
        complainBox.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -12).isActive = true
        complainBox.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        scrollView.addSubview(submitBtn)
        submitBtn.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        submitBtn.topAnchor.constraint(equalTo: complainBox.bottomAnchor, constant: 15).isActive = true
        submitBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        submitBtn.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -10).isActive = true
        submitBtn.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -10).isActive = true
        }

	
    func setupToolbar(){
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: self.view.frame.size.height/6, width: self.view.frame.size.width, height: 40.0))
        
        toolBar.layer.position = CGPoint(x: self.view.frame.size.width/2, y: self.view.frame.size.height-20.0)
        
        toolBar.barStyle = UIBarStyle.blackTranslucent
        
        toolBar.tintColor = UIColor.white
        
        toolBar.backgroundColor = UIColor.lightGray
        
        let okBarBtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(HomeController.donePressed))
    
        
        toolBar.setItems([okBarBtn], animated: true)
        
        schoolNameField.inputAccessoryView = toolBar
        levelSelectorField.inputAccessoryView = toolBar
        sessionField.inputAccessoryView = toolBar
        studentTypeField.inputAccessoryView = toolBar
 }
    
    func donePressed(_sender: UIBarButtonItem){
        schoolNameField.resignFirstResponder()
        levelSelectorField.resignFirstResponder()
        sessionField.resignFirstResponder()
        studentTypeField.resignFirstResponder()
    }

//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        hallNameField.resignFirstResponder()
//        self.view.endEditing(true)
//    }
	
    
   
    
    func addISButtonViaCode(){
       
        let firstRadioButton:ISRadioButton = ISRadioButton(frame: CGRect(x: 10, y: 10, width: 150, height: 25))
        firstRadioButton.titleLabel?.font = UIFont.systemFont(ofSize: 14.0)
        firstRadioButton.setTitle("Yes", for:UIControlState())
        firstRadioButton.iconColor = UIColor.black
        firstRadioButton.indicatorColor = UIColor.white
        firstRadioButton.setTitleColor(UIColor.white, for: UIControlState())
        firstRadioButton.tag = 0
        firstRadioButton.iconSize.add(3)
        firstRadioButton.multipleSelectionEnabled = false
        firstRadioButton.addTarget(self, action: #selector(HomeController.selectedProjectorBtn(_:)), for: .touchUpInside)
        self.projectorCell.addSubview(firstRadioButton)
        
        let otherTitless:NSArray = NSArray(objects:"No", "N/A")
        
        let otherButtons:NSMutableArray = NSMutableArray();
        
        for i in 1...2 {
            let radio:ISRadioButton = ISRadioButton(frame: CGRect(x: CGFloat(
                30+(80 * i)), y: 10, width: 150, height: 25))
            radio.titleLabel?.font = UIFont.systemFont(ofSize: 14.0)
            radio.setTitle(otherTitless.object(at: i-1) as? String, for:UIControlState())
            radio.setTitleColor(UIColor.white, for:UIControlState())
            radio.iconOnRight = false;
            
            // Uncomment this to put icon on the right side
            radio.iconOnRight = false;
            radio.multipleSelectionEnabled = false
            radio.iconColor = UIColor.black
            radio.indicatorColor = UIColor.white
            radio.iconSize.add(3)
            radio.addTarget(self, action: #selector(HomeController.selectedProjectorBtn(_:)), for:.touchUpInside)
            otherButtons.add(radio)
            self.projectorCell.addSubview(radio)
            
        }
        firstRadioButton.otherButtons = (otherButtons as AnyObject as! Array<ISRadioButton>)
    }
    
    
    func selectedProjectorBtn(_ selected:ISRadioButton) {
        //let radio = selectedBtn.titleLabel!.text??
        let radPro = selected.titleLabel?.text!
        ProStats = radPro!
        print(radPro!)
    }
    
    func addAirconISButtons(){
        
        let firstRadioButton:ISRadioButton = ISRadioButton(frame: CGRect(x: 10, y: 10, width: 150, height: 25))
        firstRadioButton.titleLabel?.font = UIFont.systemFont(ofSize: 14.0)
        firstRadioButton.setTitle("Yes", for:UIControlState())
        firstRadioButton.iconColor = UIColor.black
        firstRadioButton.indicatorColor = UIColor.white
        firstRadioButton.setTitleColor(UIColor.white, for: UIControlState())
        firstRadioButton.tag = 0
        firstRadioButton.iconSize.add(3)
        firstRadioButton.multipleSelectionEnabled = false
        firstRadioButton.addTarget(self, action: #selector(HomeController.selectedAirBtn(_:)), for: .touchUpInside)
        self.airconditionCell.addSubview(firstRadioButton)
        
        let otherTitless:NSArray = NSArray(objects:"No", "N/A")
        
        let otherButtons:NSMutableArray = NSMutableArray();
        
        for i in 1...2 {
            let radio:ISRadioButton = ISRadioButton(frame: CGRect(x: CGFloat(
                30+(80 * i)), y: 10, width: 150, height: 25))
            radio.titleLabel?.font = UIFont.systemFont(ofSize: 14.0)
            radio.setTitle(otherTitless.object(at: i-1) as? String, for:UIControlState())
            radio.setTitleColor(UIColor.white, for:UIControlState())
            radio.iconOnRight = false;
            
            // Uncomment this to put icon on the right side
            radio.iconOnRight = false;
            radio.multipleSelectionEnabled = false
            radio.iconColor = UIColor.black
            radio.indicatorColor = UIColor.white
            radio.iconSize.add(3)
            radio.addTarget(self, action: #selector(HomeController.selectedAirBtn(_:)), for:.touchUpInside)
            otherButtons.add(radio)
            self.airconditionCell.addSubview(radio)
            
        }
        firstRadioButton.otherButtons = (otherButtons as AnyObject as! Array<
            ISRadioButton>)
    }
    
    
    func selectedAirBtn(_ selected:ISRadioButton){
        //let radio = selectedBtn.titleLabel!.text??
        let radAir = selected.titleLabel?.text
        AirStats = radAir!
        print(radAir!)
    }
    
    
    func addWifiISButtons(){
        
        let firstRadioButton:ISRadioButton = ISRadioButton(frame: CGRect(x: 10, y: 10, width: 150, height: 25))
        firstRadioButton.titleLabel?.font = UIFont.systemFont(ofSize: 14.0)
        firstRadioButton.setTitle("Yes", for:UIControlState())
        firstRadioButton.iconColor = UIColor.black
        firstRadioButton.indicatorColor = UIColor.white
        firstRadioButton.setTitleColor(UIColor.white, for: UIControlState())
        firstRadioButton.tag = 0
        firstRadioButton.iconSize.add(3)
        firstRadioButton.multipleSelectionEnabled = false
        firstRadioButton.addTarget(self, action: #selector(self.selectedWifiBtn(_:)), for: .touchUpInside)
        self.wifiCell.addSubview(firstRadioButton)
        
        let otherTitless:NSArray = NSArray(objects:"No", "N/A")
        
        let otherButtons:NSMutableArray = NSMutableArray();
        
        for i in 1...2 {
            let radio:ISRadioButton = ISRadioButton(frame: CGRect(x: CGFloat(
                30+(80 * i)), y: 10, width: 150, height: 25))
            radio.titleLabel?.font = UIFont.systemFont(ofSize: 14.0)
            radio.setTitle(otherTitless.object(at: i-1) as? String, for:UIControlState())
            radio.setTitleColor(UIColor.white, for:UIControlState())
            radio.iconOnRight = false;
            
            // Uncomment this to put icon on the right side
            radio.iconOnRight = false;
            radio.multipleSelectionEnabled = false
            radio.iconColor = UIColor.black
            radio.indicatorColor = UIColor.white
            radio.iconSize.add(3)
            radio.addTarget(self, action: #selector(HomeController.selectedWifiBtn(_:)), for:.touchUpInside)
            otherButtons.add(radio)
            self.wifiCell.addSubview(radio)
            
        }
        firstRadioButton.otherButtons = (otherButtons as AnyObject as! Array<
            ISRadioButton>)
    }
    
    
    func selectedWifiBtn(_ selected:ISRadioButton){
        //let radio = selectedBtn.titleLabel!.text??
        let radWifi = selected.titleLabel?.text
        YfyStats = radWifi!
        print(radWifi!)
    }

    
    
    func addPlugsISButtons() {
        
        let firstRadioButton:ISRadioButton = ISRadioButton(frame: CGRect(x: 10, y: 10, width: 150, height: 25))
        firstRadioButton.titleLabel?.font = UIFont.systemFont(ofSize: 14.0)
        firstRadioButton.setTitle("Yes", for:UIControlState())
        firstRadioButton.iconColor = UIColor.black
        firstRadioButton.indicatorColor = UIColor.white
        firstRadioButton.setTitleColor(UIColor.white, for: UIControlState())
        firstRadioButton.tag = 0
        firstRadioButton.iconSize.add(3)
        firstRadioButton.multipleSelectionEnabled = false
        firstRadioButton.addTarget(self, action: #selector(HomeController.selectedPlugBtn(_:)), for: .touchUpInside)
        self.plugsCell.addSubview(firstRadioButton)
        
        let otherTitless:NSArray = NSArray(objects:"No", "N/A")
        
        let otherButtons:NSMutableArray = NSMutableArray();
        
        for i in 1...2 {
            let radio:ISRadioButton = ISRadioButton(frame: CGRect(x: CGFloat(
                30+(80 * i)), y: 10, width: 150, height: 25))
            radio.titleLabel?.font = UIFont.systemFont(ofSize: 14.0)
            radio.setTitle(otherTitless.object(at: i-1) as? String, for:UIControlState())
            radio.setTitleColor(UIColor.white, for:UIControlState())
            radio.iconOnRight = false;
            
            // Uncomment this to put icon on the right side
            radio.iconOnRight = false;
            radio.multipleSelectionEnabled = false
            radio.iconColor = UIColor.black
            radio.indicatorColor = UIColor.white
            radio.iconSize.add(3)
            radio.addTarget(self, action: #selector(HomeController.selectedPlugBtn(_:)), for:.touchUpInside)
            otherButtons.add(radio)
            self.plugsCell.addSubview(radio)
            
        }
        firstRadioButton.otherButtons = (otherButtons as AnyObject as! Array<
            ISRadioButton>)
    }
    
    
    func selectedPlugBtn(_ selected:ISRadioButton){
        //let radio = selectedBtn.titleLabel!.text??
        let radPlug = selected.titleLabel?.text
        PlgStats = radPlug!
        print(radPlug!)
    }
    
    func addLightsISButtons() {
        
        let firstRadioButton:ISRadioButton = ISRadioButton(frame: CGRect(x: 10, y: 10, width: 150, height: 25))
        firstRadioButton.titleLabel?.font = UIFont.systemFont(ofSize: 14.0)
        firstRadioButton.setTitle("Yes", for:UIControlState())
        firstRadioButton.iconColor = UIColor.black
        firstRadioButton.indicatorColor = UIColor.white
        firstRadioButton.setTitleColor(UIColor.white, for: UIControlState())
        firstRadioButton.tag = 0
        firstRadioButton.iconSize.add(3)
        firstRadioButton.multipleSelectionEnabled = false
        firstRadioButton.addTarget(self, action: #selector(HomeController.selectedLightBtn(_:)), for: .touchUpInside)
        self.lightCell.addSubview(firstRadioButton)
        
        let otherTitless:NSArray = NSArray(objects:"No", "N/A")
        
        let otherButtons:NSMutableArray = NSMutableArray();
        
        for i in 1...2 {
            let radio:ISRadioButton = ISRadioButton(frame: CGRect(x: CGFloat(
                30+(80 * i)), y: 10, width: 150, height: 25))
            radio.titleLabel?.font = UIFont.systemFont(ofSize: 14.0)
            radio.setTitle(otherTitless.object(at: i-1) as? String, for:UIControlState())
            radio.setTitleColor(UIColor.white, for:UIControlState())
            radio.iconOnRight = false;
            
            // Uncomment this to put icon on the right side
            radio.iconOnRight = false;
            radio.multipleSelectionEnabled = false
            radio.iconColor = UIColor.black
            radio.indicatorColor = UIColor.white
            radio.iconSize.add(3)
            radio.addTarget(self, action: #selector(HomeController.selectedLightBtn(_:)), for:.touchUpInside)
            otherButtons.add(radio)
            self.lightCell.addSubview(radio)
            
        }
        firstRadioButton.otherButtons = (otherButtons as AnyObject as! Array<
            ISRadioButton>)
    }
    func selectedLightBtn(_ selected:ISRadioButton){
        //let radio = selectedBtn.titleLabel!.text??
        let radLight = selected.titleLabel?.text
        LytStats = radLight!
        print(radLight!)
    }
    
    func addFansISButtons() {
        
        let firstRadioButton:ISRadioButton = ISRadioButton(frame: CGRect(x: 10, y: 10, width: 150, height: 25))
        firstRadioButton.titleLabel?.font = UIFont.systemFont(ofSize: 14.0)
        firstRadioButton.setTitle("Yes", for:UIControlState())
        firstRadioButton.iconColor = UIColor.black
        firstRadioButton.indicatorColor = UIColor.white
        firstRadioButton.setTitleColor(UIColor.white, for: UIControlState())
        firstRadioButton.tag = 0
        firstRadioButton.iconSize.add(3)
        firstRadioButton.multipleSelectionEnabled = false
        firstRadioButton.addTarget(self, action: #selector(HomeController.selectedFanBtn(_:)), for: .touchUpInside)
        self.fansCell.addSubview(firstRadioButton)
        
        let otherTitless:NSArray = NSArray(objects:"No", "N/A")
        
        let otherButtons:NSMutableArray = NSMutableArray();
        
        for i in 1...2 {
            let radio:ISRadioButton = ISRadioButton(frame: CGRect(x: CGFloat(
                30+(80 * i)), y: 10, width: 150, height: 25))
            radio.titleLabel?.font = UIFont.systemFont(ofSize: 14.0)
            radio.setTitle(otherTitless.object(at: i-1) as? String, for:UIControlState())
            radio.setTitleColor(UIColor.white, for:UIControlState())
            radio.iconOnRight = false;
            
            // Uncomment this to put icon on the right side
            radio.iconOnRight = false;
            radio.multipleSelectionEnabled = false
            radio.iconColor = UIColor.black
            radio.indicatorColor = UIColor.white
            radio.iconSize.add(3)
            radio.addTarget(self, action: #selector(HomeController.selectedFanBtn(_:)), for:.touchUpInside)
            otherButtons.add(radio)
            self.fansCell.addSubview(radio)
            
        }
        firstRadioButton.otherButtons = (otherButtons as AnyObject as! Array<
            ISRadioButton>)
    }
    
    func selectedFanBtn(_ selected:ISRadioButton){
        //let radio = selectedBtn.titleLabel!.text??
        let rad = selected.titleLabel?.text
        FanStats = rad!
        print(rad!)
    }  
        
        
        
    func handleLogout(){
        GIDSignIn.sharedInstance().signOut()
        let loginController = LoginController()
        present(loginController, animated: true, completion: nil)
    }

    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView.tag == 1 {
            
            return schoolData[row]
            
        }
        
        if pickerView.tag == 2 {
            
            return levelData[row]
            
        }
        
        if pickerView.tag == 3 {
            if (studentTypeField.text == "Regular"){
                return sessionData[row]
            }
            else{
                return sessionData1[row]
            }
        }
        
        if pickerView.tag == 4{
            return studTypeData[row]
        }
        
        return nil
        
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if pickerView.tag == 1 {
            schoolNameField.text = schoolData[row]
        }
        if pickerView.tag == 2 {
            levelSelectorField.text = levelData[row]
        }
        if pickerView.tag == 3 {
            if (studentTypeField.text == "Regular"){
                sessionField.text = sessionData[row]
            }
            else {
                sessionField.text = sessionData1[row]
            }
        }
        if pickerView.tag == 4 {
            studentTypeField.text = studTypeData[row]
        }
    }


    func textFieldShouldReturn(_ textField: UITextField) ->Bool{
        textField.resignFirstResponder()
        return true
    }
	
	
	func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool
	{
		if(text == "\n")
		{
			view.endEditing(true)
			return false
		}
		else
		{
			return true
		}
	}

}




extension UIScrollView{
    func setContentViewSize(offset:CGFloat = 0.0) {
        showsVerticalScrollIndicator = false
        
        var maxHeight : CGFloat = 0
        for view in subviews {
            if view.isHidden {
                continue
            }
            let newHeight = view.frame.origin.y + view.frame.height
            if newHeight > maxHeight {
                maxHeight = newHeight
            }
        }
        // set content size
        contentSize = CGSize(width: contentSize.width, height: maxHeight + offset)
   }
}
