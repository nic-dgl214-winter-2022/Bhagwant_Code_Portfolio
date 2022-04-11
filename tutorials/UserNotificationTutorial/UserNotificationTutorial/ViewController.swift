//
//  ViewController.swift
//  UserNotificationTutorial
//
//  Created by BHAGWANT SINGH on 2022-04-10.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //step 1 - Ask for permission
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound]) {  (granted, error)in
        }
        
        //step 2 - create the notification content
        let content = UNMutableNotificationContent()
        content.title = "Hey I am a notification!"
        content.body = "How is it!"
        
        //step 3 -  Create notification trigger
        let date = Date().addingTimeInterval(10)
        let dateComponents = Calendar.current.dateComponents([ .year, .month, .day, .hour , .minute , .second], from: date)
        let trigger =  UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        
        //setp 4 - create a request
        let uuidString = UUID().uuidString
        let request =  UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
        
        //setp 5 - register the request
        center.add(request) { (error) in
            //check error parameter and handle any error
        }
    }


}

