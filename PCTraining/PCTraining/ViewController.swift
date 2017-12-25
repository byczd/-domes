//
//  ViewController.swift
//  PCTraining
//
//  Created by wumeng on 2017/12/8.
//  Copyright © 2017年 wumeng. All rights reserved.
//



import UIKit
import AVFoundation

var userDFTrainCount = "userDFTrainCount"

class ViewController: UIViewController ,UITextFieldDelegate {
    

    @IBOutlet weak var _countLabel: UITextField!//次数label
    @IBOutlet weak var _timeLabel: UILabel!//时间label
    @IBOutlet weak var _statueLabel: UILabel! // statu btn
    @IBOutlet weak var StartBtn: UIButton! //开始按钮

    var voiceData:[Data]?
    var timerIndex = 0 // 计时index
    var trainCount:Int = 0 //训练次数
    var timer:Timer? // 计时器
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK :- 开始训练
    @IBAction func startAction(_ sender: Any) {
        let btn = sender as! UIButton
        if btn.isSelected == false {
            if trainCount == 0{
                simpleAlert(message: "请输入训练次数")
                return
            }
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerAciton), userInfo: nil, repeats: true)
            btn.isSelected = true
        }else{
            btn.isSelected = false
            timer?.invalidate()
            timerIndex = trainCount * 10
            self._timeLabel.text = "\(timerIndex) " + "s"
        }
    }
    
    @objc func timerAciton() -> () {
        timerIndex -= 1
        self._timeLabel.text = "\(timerIndex) " + "s"
        
        //状态设定
        let halfTen = timerIndex%5
        if halfTen == 0 {
            if timerIndex%10 == 0 {
                _statueLabel.text = "收"
                _statueLabel.backgroundColor = UIColor.red
                
            }else{
                _statueLabel.text = "放"
                _statueLabel.backgroundColor = UIColor.blue
            }
            //震动提示
            AudioServicesPlaySystemSound (kSystemSoundID_Vibrate);
        }
        
        
        if timerIndex == 0 {
            self.timer?.invalidate()
            simpleAlert(message: "训练完成")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! RecordVoiceVC
        vc.complation = {
            print("complation")
        }
    }
    

    //MARK :- 开始录音
    @IBAction func recordAction(_ sender: Any) {
        performSegue(withIdentifier: "IdentiferRecordVoice", sender: "123")
    }
    
    @objc func doneAction() -> () {
        guard _countLabel.isFirstResponder else{
            return
        }
        
        let inputCount = _countLabel.text ?? "0"
        let intIndex = Int.init(inputCount) ?? 0
        if intIndex > 0 {
            trainCount = intIndex
            timerIndex = trainCount * 10
            self._timeLabel.text = "\(timerIndex) " + "s"
            
            //保留记录
            UserDefaults.standard.set(trainCount, forKey: userDFTrainCount)
            UserDefaults.standard.synchronize()
        }
        _countLabel.resignFirstResponder()
    }
}

extension ViewController {
    private func setUpUI() -> () {
        // 1.
        _countLabel.keyboardType = .phonePad
        _countLabel.delegate = self
        _countLabel.inputAccessoryView = getToolbar()
        
        // 2.
        _statueLabel.layer.cornerRadius = 50.0
        _statueLabel.clipsToBounds = true
        
        // 3.
        StartBtn.setTitle("重新开始", for: .selected)
        
        // 4.默认训练次数
        let trianCount = UserDefaults.standard.integer(forKey: userDFTrainCount)
        if trianCount > 0 {
            self.trainCount = trianCount
            self.timerIndex = self.trainCount * 10
            _countLabel.text = self.trainCount.description
            self._timeLabel.text = "\(timerIndex) " + "s"
        }
    }
    
    private func getToolbar()->(UIToolbar){
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: 35))
        toolbar.tintColor = UIColor.blue
        toolbar.backgroundColor = UIColor.lightGray
        let done = UIBarButtonItem(title: "完成", style: .plain, target: self, action: #selector(doneAction))
        let space = UIBarButtonItem(barButtonSystemItem:.fixedSpace, target: nil, action: nil)
        space.width = self.view.bounds.size.width - 50
        toolbar.items = [space,done]
        return toolbar
    }
    
    private func simpleAlert (message:String) -> () {
        let alert = UIAlertController(title: "提示", message: message, preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "确定", style: .default) { (action) in
            
        }
        alert.addAction(confirmAction)
        self.present(alert, animated: true, completion: nil)
    }
}

