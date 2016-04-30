//
//  ViewController.swift
//  EasyLayout
//
//  Created by AugustRush on 4/28/16.
//  Copyright © 2016 August. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var thirdView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var fouthView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        firstView.makeConstraints { (make) in
            make.ELLeft.equalTo(self.view.ELLeft).constant(10)
            make.ELTop.equalTo(self.view.ELTop).constant(10)
            make.ELBottom.equalTo(self.view.ELBottom).constant(-10)
            make.ELRight.equalTo(self.view.ELRight).constant(-10)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

