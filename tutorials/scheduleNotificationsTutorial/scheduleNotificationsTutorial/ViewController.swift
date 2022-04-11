//
//  ViewController.swift
//  scheduleNotificationsTutorial
//
//  Created by BHAGWANT SINGH on 2022-04-10.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    @IBOutlet var titleTF: UITextField!

    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var messageTF: UITextField!
    
    let notificationCenter = UNUserNotificationCenter.current()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        notificationCenter.requestAuthorization(options: [.alert , .sound]) { (permissionGranted, error) in
            if(!permissionGranted){
                print("Permission Denied")
            }
        }
    }

    @IBAction func scheduleAction(_ sender: Any) {
        notificationCenter.getNotificationSettings { (settings) in
            DispatchQueue.main.async {
                
            let title = self.titleTF.text!
            let message = self.messageTF.text!
            let date = self.datePicker.date
            if(settings.authorizationStatus == .authorized){
                let content = UNMutableNotificationContent()
                content.title = title
                content.body = message
                let dateComp = Calendar.current.dateComponents([.year ,.month , .day , .hour , .minute], from: date)
                let trigger = UNCalendarNotificationTrigger(dateMatching: dateComp, repeats: false)
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                self.notificationCenter.add (request){ (error) in
                    if( error != nil){
                        print("Error" + error.debugDescription)
                        return
                    }
                }
                let ac = UIAlertController(title: "Notificaiton Scheduled", message: "At " +  self.formattedDate(date: date), preferredStyle: .alert)
                ac.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in}))
                self.present(ac, animated: true)
            }
            else {
                let ac = UIAlertController(title: "Enable Notifications", message: "To use this feature you must turn on your Notificaitons for this app in settings" +  self.formattedDate(date: date), preferredStyle: .alert)
                let goToSettings = UIAlertAction(title: "Settings", style: .default) { (_) in
                    guard let settingURL =  URL(string: UIApplication.openSettingsURLString)
                    else{
                        return
                    }
                    if(UIApplication.shared.canOpenURL(settingURL)){
                        UIApplication.shared.open(settingURL) { (_) in}
                    }
                }
                ac.addAction(goToSettings)
                ac.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { (_) in}))
                self.present(ac, animated: true)
            }
            }
        }
    }
    
    func  formattedDate(date: Date) -> String {
        let formatter =  DateFormatter()
        formatter.dateFormat = "d MMM y HH:MM"
        return formatter.string(from: date)
    }
}

