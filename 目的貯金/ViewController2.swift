//
//  ViewController2.swift
//  目的貯金
//
//  Created by  RyutaNishioka on 2019/08/13.
//  Copyright © 2019 Ryuta Nishioka. All rights reserved.
//

import UIKit

class ViewController2:
        UIViewController,UITextFieldDelegate {
    
    @IBOutlet var mokuhyoukinngaku: UITextField!
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var dateLabel: UILabel!
    
    let hozon = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mokuhyoukinngaku.delegate = self
        
    //〇〇年〇〇月〇〇日の出力
        let date = DateFormatter()
        date.dateStyle = .long
        date.timeStyle = .none
        date.locale = Locale(identifier: "ja_JP")
        let now = Date()
    //dateLabelに今日の日付を表示
        let dateString = date.string(from: now)
        dateLabel.text = dateString

       
    }
    
//バックボタン
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
//returnキーを押したあと、キーボードを閉じる
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        mokuhyoukinngaku.resignFirstResponder()
        return true
    }

//datePickerの日付をUILabelに表示
    @IBAction func dateDone(_ sender: Any) {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ja_JP")
        formatter.dateFormat = "yyyy年MM月dd日"
        dateLabel.text = "\(formatter.string(from: datePicker.date))"
    
        hozon.set(dateLabel.text, forKey: "d")
        
    //目標金額の保存
        if (hozon.object(forKey: "b") != nil){
            
            let mokukinn = mokuhyoukinngaku.text!
            
            hozon.set(mokukinn, forKey: "b")
        
        
        performSegue(withIdentifier: "perform1", sender: nil)
   
    }
    }
        
//ViewController3に画面遷移
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "perform1"{
            let vc = segue.destination as! ViewController
            vc.mk = self.mokuhyoukinngaku.text!
            vc.spanDay = self.dateLabel.text!
            print("vc2から目標金額・日数の遷移")
            print(mokuhyoukinngaku.text!)
            print(dateLabel.text!)
            
        }
    }
        
    }
