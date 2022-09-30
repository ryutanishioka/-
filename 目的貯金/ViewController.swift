//
//  ViewController.swift
//  目的貯金
//
//  Created by  RyutaNishioka on 2019/08/11.
//  Copyright © 2019 Ryuta Nishioka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var chokinngaku: UILabel!
    @IBOutlet var firstGuide: UILabel!
    @IBOutlet var Chokinn: UIButton!
    
    let hozon = UserDefaults.standard
    var count = 0
    var mk = ""
    var spanDay = ""
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
    
    //起動時にvc2の目標金額があれば呼び出す。
        if hozon.object(forKey: "b") != nil{
            let mk1 = hozon.object(forKey: "b")as! Int
            let mk2 = String(mk1)
            mk = mk2
            
            hozon.set(mk, forKey: "b")
        }
        
    //起動時にvc2の日付があれば呼び出す。
        if hozon.object(forKey: "d") != nil{
            let spanDay1 = hozon.object(forKey: "d")as! String
            let spanDay2 = spanDay1
            spanDay = spanDay2
            
            hozon.set(spanDay, forKey: "d")
            
        }
        
        if (hozon.object(forKey: "b") == nil) && (hozon.object(forKey: "d") == nil) {
            Chokinn.isEnabled = false
            print("貯金ボタン押せない")
        }
        
        
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("目標金額・日数")
        print(mk)
        print(spanDay)
        //最初の表示は０になるようにする
        chokinngaku.text = "0"
        count = 0
        
    //初回起動時のみ文章表示
        if hozon.object(forKey: "first") == nil{
            
            firstGuide.isHidden = false
            hozon.set(true, forKey: "first")

        }else{
            
            firstGuide.isHidden = true
             print("2回目以降")
    }
    }
    
    //ボタン配置
    @IBAction func clear(_ sender: Any) {
        count = 0
        chokinngaku.text = String(count)
    }
    
    @IBAction func ０(_ sender: Any) {
        count = count * 10
        count = count + 0
        chokinngaku.text = String(count)
    }
    
    @IBAction func １(_ sender: Any) {
        count = count * 10
        count = count + 1
        chokinngaku.text = String(count)
    }
    
    @IBAction func ２(_ sender: Any) {
        count = count * 10
        count = count + 2
        chokinngaku.text = String(count)
    }
    
    @IBAction func ３(_ sender: Any) {
        count = count * 10
        count = count + 3
        chokinngaku.text = String(count)
    }
    
    @IBAction func ４(_ sender: Any) {
        count = count * 10
        count = count + 4
        chokinngaku.text = String(count)
    }
    
    @IBAction func ５(_ sender: Any) {
        count = count * 10
        count = count + 5
        chokinngaku.text = String(count)
    }
    
    @IBAction func ６(_ sender: Any) {
        count = count * 10
        count = count + 6
        chokinngaku.text = String(count)
    }
    
    @IBAction func ７(_ sender: Any) {
        count = count * 10
        count = count + 7
        chokinngaku.text = String(count)
    }
    
    @IBAction func ８(_ sender: Any) {
        count = count * 10
        count = count + 8
        chokinngaku.text = String(count)
    }
    
    @IBAction func ９(_ sender: Any) {
        count = count * 10
        count = count + 9
        chokinngaku.text = String(count)
    }
    
    
    //result画面に遷移するコード
    @IBAction func chokinn(_ sender: Any) {
       
        //値を計算し、保存させる
        if hozon.object(forKey: "a") != nil{
            
            let count1 = hozon.object(forKey: "a") as! Int
            count = count1 + count
            hozon.set(count, forKey: "a")
            
            performSegue(withIdentifier: "perform", sender: nil)
        }
     }
    
   
    
    //ViewController3に値を遷移
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "perform" {
            let vc3 = segue.destination as! ViewController3
            
            vc3.text = String(count)
            vc3.mk = self.mk
            vc3.spanDay = self.spanDay
            
            print("vc3に遷移しました。")
            print(count)
            print(mk)
            print(spanDay)
            
        }
    }
}

