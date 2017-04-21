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


        


}

