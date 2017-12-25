//
//  RecordVoiceVC.swift
//  PCTraining
//
//  Created by wumeng on 2017/12/11.
//  Copyright © 2017年 wumeng. All rights reserved.
//

import UIKit
import AVFoundation

class RecordVoiceVC: UIViewController {

    
    @IBOutlet weak var _finnishBtn: UIBarButtonItem!
    
    var complation:(()->())?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    func recordAction() -> () {
        //let player = AVAudioPlayer()
    }
    
    
    @IBAction func finishAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        self.complation?()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
