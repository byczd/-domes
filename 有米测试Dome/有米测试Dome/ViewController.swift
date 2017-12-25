//
//  ViewController.swift
//  有米测试Dome
//
//  Created by wumeng on 2017/12/12.
//  Copyright © 2017年 wumeng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let infos = InfosOfDeviceManager().getInfo()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

