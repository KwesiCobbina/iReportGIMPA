//
//  HomeCell.swift
//  iReport Gimpa
//
//  Created by Kwesi Cobbina on 02/06/2017.
//  Copyright © 2017 Kwesi Cobbina. All rights reserved.
//

import UIKit

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
var levelData: [String] = [String]()


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



let schoolName: UILabel = {
    let schName = UILabel()
    schName.text = "Select School"
    schName.translatesAutoresizingMaskIntoConstraints = false
    schName.font = UIFont.systemFont(ofSize: 14)
    schName.textColor = UIColor.white
    schName.textAlignment = .left
    return schName
}()

var schoolNameField: UITextField = {
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

var hallNameField: UITextField = {
    let hallField = UITextField()
    hallField.translatesAutoresizingMaskIntoConstraints = false
    hallField.backgroundColor = UIColor(white: 0, alpha: 0.3)
    hallField.layer.cornerRadius = 5
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

var levelSelectorField: UITextField = {
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
    course.text = "Enter Course Code/Title"
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

var courseField: UITextField = {
    let coursesField = UITextField()
    coursesField.translatesAutoresizingMaskIntoConstraints = false
    coursesField.backgroundColor = UIColor(white: 0, alpha: 0.3)
    coursesField.layer.cornerRadius = 5
    coursesField.layer.masksToBounds = true
    coursesField.textColor = UIColor.white
    return coursesField
}()


let lecturesName: UILabel = {
    let lecName = UILabel()
    lecName.text = "Enter Lecturer's Name"
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

var lecturerNameField: UITextField = {
    let lecNameField = UITextField()
    lecNameField.translatesAutoresizingMaskIntoConstraints = false
    lecNameField.backgroundColor = UIColor(white: 0, alpha: 0.3)
    lecNameField.layer.cornerRadius = 5
    lecNameField.layer.masksToBounds = true
    lecNameField.textColor = UIColor.white
    return lecNameField
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

var lecturerIDField: UITextField = {
    let lecIDField = UITextField()
    lecIDField.translatesAutoresizingMaskIntoConstraints = false
    lecIDField.backgroundColor = UIColor(white: 0, alpha: 0.3)
    lecIDField.layer.cornerRadius = 5
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

var sessionField: UITextField = {
    let sessField = UITextField()
    sessField.translatesAutoresizingMaskIntoConstraints = false
    sessField.backgroundColor = UIColor(white: 0, alpha: 0.3)
    sessField.layer.cornerRadius = 5
    sessField.textColor = UIColor.white
    sessField.layer.masksToBounds = true
    return sessField
}()

let startSessions: UILabel = {
    let courseSess = UILabel()
    courseSess.text = "Actual Start Time"
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

var startField: UITextField = {
    let sessField = UITextField()
    sessField.translatesAutoresizingMaskIntoConstraints = false
    sessField.backgroundColor = UIColor(white: 0, alpha: 0.3)
    sessField.layer.cornerRadius = 5
    sessField.keyboardType = UIKeyboardType.numbersAndPunctuation
    sessField.textColor = UIColor.white
    sessField.layer.masksToBounds = true
    return sessField
}()

let stopSessions: UILabel = {
    let courseSess = UILabel()
    courseSess.text = "Actual End Time"
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

var stopField: UITextField = {
    let sessField = UITextField()
    sessField.translatesAutoresizingMaskIntoConstraints = false
    sessField.backgroundColor = UIColor(white: 0, alpha: 0.3)
    sessField.layer.cornerRadius = 5
    sessField.keyboardType = UIKeyboardType.numbersAndPunctuation
    sessField.textColor = UIColor.white
    sessField.layer.masksToBounds = true
    return sessField
}()

let coveredTopics: UILabel = {
    let courseSess = UILabel()
    courseSess.text = "Topics Covered"
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

var TopicsBox: UITextView = {
    let complainBoxs = UITextView()
    complainBoxs.translatesAutoresizingMaskIntoConstraints = false
    complainBoxs.backgroundColor = UIColor(white: 0, alpha: 0.3)
    complainBoxs.layer.cornerRadius = 5
    complainBoxs.isEditable = true
    complainBoxs.textColor = UIColor.white
    complainBoxs.font = UIFont.systemFont(ofSize: 18)
    complainBoxs.layer.masksToBounds = true
    return complainBoxs
}()



let studentComplain: UILabel = {
    let courseSess = UILabel()
    courseSess.text = "Other Issues"
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

var complainBox: UITextView = {
    let complainBoxs = UITextView()
    complainBoxs.translatesAutoresizingMaskIntoConstraints = false
    complainBoxs.backgroundColor = UIColor(white: 0, alpha: 0.3)
    complainBoxs.layer.cornerRadius = 5
    complainBoxs.isEditable = true
    complainBoxs.textColor = UIColor.white
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
    subButton.addTarget(HomeController.self, action: #selector(handleSubmit), for: .touchUpInside)
    return subButton
}()

//func handleSubmit(){
//    let completionController = CompletionController()
//    present(completionController, animated: true, completion: nil)
//    print()
//    print(schoolNameField.text!)
//    print(complainBox.text)
//    print(courseField.text!)
//    print(lecturerNameField.text!)
//    print(lecturerIDField.text!)
//
//}


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


func selectedProjectorBtn(_ selected:ISRadioButton) -> String {
    //let radio = selectedBtn.titleLabel!.text??
    let radPro = (selected.titleLabel?.text)!
    print(radPro)
    return radPro
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
    firstRadioButton.addTarget(self, action: #selector(HomeController.selectedWifiBtn(_:)), for: .touchUpInside)
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
    print(radLight!)
}

func handleFans(_ isRadioButton:ISRadioButton){
    if isRadioButton.tag == 1000 {
        
        //if isRadioButton.isEqual(self.btnAttributed1) {
        
        let myString = NSMutableAttributedString(string:"New Text")
        
        myString.addAttribute(NSForegroundColorAttributeName, value: UIColor.red, range: NSRange(location:0, length: 3))
        myString.addAttribute(NSForegroundColorAttributeName, value: UIColor.blue, range: NSRange(location:4, length: 4))
        
        let myString2 = NSMutableAttributedString(string:"Old Text")
        
        myString2.addAttribute(NSForegroundColorAttributeName, value: UIColor.green, range: NSRange(location:0, length: 3))
        myString2.addAttribute(NSForegroundColorAttributeName, value: UIColor.blue, range: NSRange(location:4, length: 4))
        
    }
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
    print(rad!)
}
