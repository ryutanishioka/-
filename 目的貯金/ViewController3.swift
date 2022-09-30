//
//  ViewController3.swift
//  目的貯金
//
//  Created by  RyutaNishioka on 2019/08/13.
//  Copyright © 2019 Ryuta Nishioka. All rights reserved.
//

import UIKit

class ViewController3: UIViewController {

    
    @IBOutlet var goukei: UILabel!
    @IBOutlet var nokorikinngaku: UILabel!
    @IBOutlet var mokuhyoukinngaku: UILabel!
    @IBOutlet var SpanDay: UILabel!
    @IBOutlet var shinnchoku: UILabel!
    
    let hozon = UserDefaults.standard
    
    var mk = String()
    var spanDay = String()
    var text = String()
    var c = 0
    var d = 0.1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
        //viewWillは、viewが生成される前なので、
        //既にlabel.textが切り替わってるように見える
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//貯金合計額の値を代入
        goukei.text = text
        hozon.set(Int(text), forKey: "a")
        
//目標金額の値を代入
        mokuhyoukinngaku.text = mk
        hozon.set(Int(mk), forKey: "b")
        
        
//残りの金額の値を代入
        if hozon.object(forKey: "a") != nil{
            
            let a = hozon.object(forKey: "a") as! Int
            let b = hozon.object(forKey: "b") as! Int
            
            c = b - a
            
            nokorikinngaku.text = String(c)
            
            hozon.set(c, forKey: "c")
            
            print("残額")
            print(c)
        }
        
//残り日数の表示
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ja_JP")
        formatter.dateFormat = "yyyy年MM月dd日"
        let date = formatter.date(from: spanDay)
        
        //残り日数を算出
        let Now = NSDate()
        let span = date!.timeIntervalSince(Now as Date)
        //差分
        let spanday = Double(span/60/60/24)
        
        //Double型にして少数第一位を繰り上げ→整数表示
        let spanday1 = ceil(spanday)
        let spanday2 = Int(spanday1)
        SpanDay.text = String(spanday2)
        
        print("残り日数")
        print(spanday2)
        
        
//進捗％の表示
        if hozon.object(forKey: "a") != nil{
            
            let a = hozon.object(forKey: "a") as! Double
            let b = hozon.object(forKey: "b") as! Double
            
            //割合を計算し、少数第２位を切り捨て
            d = a / b * 100
            let dd = floor(d * 10) / 10
            
            print("進捗")
            print(dd)
        
            shinnchoku.text = String(dd)
        }
 }
        
    
    
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

    
}
