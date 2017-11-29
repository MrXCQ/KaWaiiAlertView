//
//  ViewController.swift
//  KaWaiiAlertView
//
//  Created by zc on 2017/11/22.
//  Copyright © 2017年 IMpBear. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let view1 : KawaiiAlert = KawaiiAlert.init(title: "提示", detailTitle: "检测到未绑定设备哦,立即绑定吗?",
                                               image: UIImage.init(named: "empty_page_fmf@2x"),
                                               btnTitle: "确定", detailHeight: 50)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func ShowView(_ sender: Any) {
        
        view1 .showView()
        view1 .clickAction = { (AnyObject) -> () in
            
         print("isClick --- \(AnyObject)")
            
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

