//
//  MylocalNotify.swift
//  upgradetodobin
//
//  Created by 박현수 on 2021/08/06.
//

import Foundation
import UserNotifications


func authorize_Noti() -> Void{
    UNUserNotificationCenter.current().requestAuthorization(options: [UNAuthorizationOptions.sound, .alert , .badge]) { (granted ,error) in
        if granted {
           return print("granted")
        } else{
           return print("error")
        }
    }
    
}
func notifySchedule(t:String) -> Void {
    let content = UNMutableNotificationContent()
    content.title = "알림"
    content.subtitle = t
    content.sound = UNNotificationSound.default
    
    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 60, repeats: false)
    
    let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
    
    UNUserNotificationCenter.current().add(request)
}


func makeString(arr:[String] , index:[Int]) -> String {
    var temp:String = ""
    for cnt in index{
        temp = temp + arr[cnt]
    }
    return temp
}
