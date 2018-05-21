//
//  ViewController.swift
//  notify
//
//  Created by admin on 21/05/18.
//  Copyright © 2018 iwebsapp. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController, UNUserNotificationCenterDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        UNUserNotificationCenter.current().delegate = self
    }
 
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .sound])
    }
    
    @IBAction func send(_ sender: UIButton) {
        let time = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false )
        let shi = UNNotificationAction(identifier: "shi", title: "Shii", options: [])
        let nocheto = UNNotificationAction(identifier: "nocheto", title: "Nu cheto", options: [])
        let categ = UNNotificationCategory(identifier: "categ", actions: [shi,nocheto], intentIdentifiers: [],  options: [])
        UNUserNotificationCenter.current().setNotificationCategories([categ])
        let conten = UNMutableNotificationContent()
        conten.title = "¿Sabias qué?"
        //conten.subtitle = "Subtitulo de la notificacion"
        conten.body = "Esta es la pareja del siglo!"
        conten.sound = UNNotificationSound.default()
        conten.categoryIdentifier = "categ"
        if let path = Bundle.main.path(forResource: "imagen", ofType: "jpg") {
            let url = URL(fileURLWithPath: path)
            do{
                let img = try UNNotificationAttachment(identifier: "img", url: url, options: nil )
                conten.attachments = [img]
            }catch{
                print("no cargo la imagen")
            }
        }
        
        let req = UNNotificationRequest(identifier: "notifi1", content: conten, trigger: time)
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().add(req) { (error) in
            if let err = error {
                print("se ha producido un error", err)
            }
        }
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        if response.actionIdentifier == "shi" {
            self.view.backgroundColor = UIColor.red
        }
        if response.actionIdentifier == "nocheto" {
            self.view.backgroundColor = UIColor.white
            UNUserNotificationCenter.current().removeDeliveredNotifications(withIdentifiers: ["notifi1"])
        }
    }
    
}

