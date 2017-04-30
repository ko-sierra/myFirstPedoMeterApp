//
//  ViewController.swift
//  PedometerApp
//
//  Created by 清水光二 on 2017/04/19.
//  Copyright © 2017年 koji. All rights reserved.
//

import UIKit
import CoreMotion
import UserNotifications

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var Label1: UILabel!
    @IBOutlet weak var Label2: UILabel!
    
    @IBOutlet weak var goalTextField: UITextField!
    
    @IBAction func catchEvent(_ sender: UITextField) {
        Label2.text = sender.text
    }                           
    
    // class wide constant !!
    let pedometer = CMPedometer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 背景をタップしたらdismissKeyboardメソッドを呼ぶように設定する
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target:self, action:#selector(dismissKeyboard))
        self.view.addGestureRecognizer(tapGesture)
        
        //デリゲート先を指定
        goalTextField.delegate = self
        
        // CMPedometerの確認
        if(CMPedometer.isStepCountingAvailable()){
            
            self.pedometer.startUpdates(from: NSDate() as Date) {
                (data: CMPedometerData?, error) -> Void in
                //メインスレッドで実行する方
                DispatchQueue.main.async(execute: { () -> Void in
                    if(error == nil){
                        
                        // 歩数
                        let steps = data!.numberOfSteps
                        self.Label1.text = "steps: \(steps)"
                    }
                })
            }
        }
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //改行、または、Returnキーが押されたら呼び出されるメソッド
    func textFieldShouldReturn(_ textField:UITextField) -> Bool {
        //キーボードをしまう
        Label2.text = goalTextField.text
        
        // キーボードを閉じる
        textField.resignFirstResponder()
        
        return true
    }
    
    func dismissKeyboard(){
        // キーボードを閉じる
        view.endEditing(true)
    }
    
    //通知機能（目標値:歩数）目標値に近づいた時に出てくる(コンテンツ)
//    func setNotification() {
//        let content = UNMutableNotificationContent()
//        content.title = "あともう少し頑張れ　　👏"
//        content.subtitle = "応援"
//        content.body  = "やれるとこまで頑張ろう"
//        content.sound = UNNotificationSound.default()
//    }
    
        
        
//        //通知カテゴリの生成
//        let category = getCategory()
//        
//        // UNUserNotificationCenterへの通知カテゴリの登録
//        center.setNotificationCategories([category])
//        
//        // Contentの生成
//        let content = getContent()
//        
//        //通知トリガの生成
//        let trigger = getTimerTrigger()
//        
//        // リクエストの生成
//        let request = UNNotificationRequest(identifier: "TimerAlarm", content: content, trigger: trigger)
//        
//        //UNUserNotificationCenterへのリクエストの登録
//        center.add(request) { (error : Error?) in
//            if let theError = error {
//                print(theError.localizedDescription)
//            }
//        }
        
        
        

        
        
//        // ローカル通知が発動するtrigger（目標値マッチ）を作成
//        let calendar = NSCalendar.current
//        let dateComponents = calendar.dateComponents([.year, .month, .day, .hour, .minute], from: task.date as Date)
//        let trigger = UNCalendarNotificationTrigger.init(dateMatching: dateComponents, repeats: false)

    
//    //位置情報の変化を受け取る
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//    }
//    
//    func setNotification {
//        let content = UNMutableNotificationContent()
//        content.title = "あともう少し頑張れ　👏"
//        
//        // ローカル通知が発動するtrigger（歩数マッチ）を作成
//        var keySteps = 10000
//        let trigger: UNNotificationTrigger
//        trigger =
//        
//        // ローカル通知を登録
//        let center = UNUserNotificationCenter.current()
//        center.add(request) { (error) in
//            print(error)
//        
//    }
    
    // UNMutableNotificationContent 作成
//    let content2 = UNMutableNotificationContent()
//    content2.title = "Hello!"
//    content2.body = "It's time!"
//    content2.sound = UNNotificationSound.default()
//    
//    // UNCalendarNotificationTrigger 作成
//    let date = DateComponents(month:7, day:7, hour:12, minute:0)
//    let trigger2 = UNCalendarNotificationTrigger.init(dateMatching: date, repeats: false)
//    
//    // id, content, trigger から UNNotificationRequest 作成
//    let request = UNNotificationRequest.init(identifier: "CalendarNotification", content: content2, trigger: trigger2)
//    
//    // UNUserNotificationCenter に request を追加
//    let center = UNUserNotificationCenter.current()
//    center.add(request)


        


}

