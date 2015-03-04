//
//  TimerViewController.swift
//  OriginalLIT
//
//  Created by 若松　夕夏 on 2015/02/28.
//  Copyright (c) 2015年 Yuka Wakamatsu. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController , UITextFieldDelegate {

    var str : String!
    var countdowntimer : NSTimer!

       override func viewDidLoad() {
        super.viewDidLoad()
        
        // UITextFieldを作成する.
        let myTextField: UITextField = UITextField(frame: CGRectMake(0,0,200,30))
        // 表示する文字を代入する.
        myTextField.text = ""
        // Delegateを設定する.
        myTextField.delegate = self
        // 枠を表示する.
        myTextField.borderStyle = UITextBorderStyle.RoundedRect
        
        // UITextFieldの表示する位置を設定する.
        myTextField.layer.position = CGPoint(x:self.view.bounds.width/2,y:100);
        
        // Viewに追加する.
        self.view.addSubview(myTextField)

        // Do any additional setup after loading the view.
        
    }
       
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /*
    UITextFieldが編集された直後に呼ばれる.
    */
    func textFieldDidBeginEditing(textField: UITextField){
        println("textFieldDidBeginEditing:" + textField.text)
    }
    /*
    テキストが編集された際に呼ばれる.
    */
    func textField(textField: UITextField!, shouldChangeCharactersInRange range: NSRange, replacementString string: String!) {
       
        // 入力済みの文字と入力された文字を合わせて取得.
        str = textField.text
    }
    

    
    /*
    UITextFieldが編集終了する直前に呼ばれる.
    */
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        println("textFieldShouldEndEditing:" + textField.text)
        
        return true
        
    }
    
    /*
    改行ボタンが押された際に呼ばれる.
    */
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    @IBAction func btstart(){
        countdowntimer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "timerRun", userInfo: nil, repeats: true)
        
    }
    func onUpdate(timer : NSTimer , str : String){
        var number = str.toInt()!
        number -= 1
        if number == 0 {
            if timer.valid  { //タイマーが動いていたらってこと
                //timerを停止する.
                
                timer.invalidate()
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
