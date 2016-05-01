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
        layoutStyle1()
    }

    //MARK: layout methods
    func layoutStyle1() {
        firstView.makeConstraints { (make) in
            make.ELLeft.equalTo(self.view.ELLeft).constant(10)
            make.ELTop.equalTo(self.view.ELTop).constant(10)
            make.ELBottom.equalTo(self.view.ELBottom).constant(-10)
            make.ELRight.equalTo(self.view.ELRight).constant(-10)
        }
        
        secondView.makeConstraints { (make) in
            make.ELLeft.equalTo(self.view.ELLeft).constant(40)
            make.ELTop.equalTo(self.view.ELTop).constant(40)
            make.ELBottom.equalTo(self.view.ELBottom).constant(-40)
            make.ELRight.equalTo(self.view.ELRight).constant(-40)
        }
        
        thirdView.makeConstraints { (make) in
            make.ELLeft.equalTo(self.view.ELLeft).constant(70)
            make.ELTop.equalTo(self.view.ELTop).constant(70)
            make.ELBottom.equalTo(self.view.ELBottom).constant(-70)
            make.ELRight.equalTo(self.view.ELRight).constant(-70)
        }
        fouthView.makeConstraints { (make) in
            make.ELLeft.equalTo(self.view.ELLeft).constant(100)
            make.ELTop.equalTo(self.view.ELTop).constant(100)
            make.ELBottom.equalTo(self.view.ELBottom).constant(-100)
            make.ELRight.equalTo(self.view.ELRight).constant(-100)
        }
    }
    
    func layoutStyle2() {
        firstView.remakeConstraints { (make) in
            make.ELLeft.equalTo(self.view.ELLeft).constant(10)
            make.ELTop.equalTo(self.view.ELTop).constant(10)
            make.ELWidth.equalTo(self.view.ELWidth).mutiplier(0.4)
            make.ELHeight.equalTo(self.view.ELHeight).mutiplier(0.4)
        }
        
        secondView.remakeConstraints { (make) in
            make.ELRight.equalTo(self.view.ELRight).constant(-10)
            make.ELTop.equalTo(self.view.ELTop).constant(10)
            make.ELWidth.equalTo(self.view.ELWidth).mutiplier(0.4)
            make.ELHeight.equalTo(self.view.ELHeight).mutiplier(0.4)
        }
        
        thirdView.remakeConstraints { (make) in
            make.ELLeft.equalTo(self.firstView.ELLeft)
            make.ELTop.equalTo(self.firstView.ELBottom).constant(10)
            make.ELWidth.equalTo(self.firstView.ELWidth)
            make.ELHeight.equalTo(self.firstView.ELHeight)
        }
        
        fouthView.remakeConstraints { (make) in
            make.ELLeft.equalTo(self.secondView.ELLeft)
            make.ELTop.equalTo(self.secondView.ELBottom).constant(10)
            make.ELWidth.equalTo(self.secondView.ELWidth)
            make.ELHeight.equalTo(self.secondView.ELHeight)
        }

    }
    
    func layoutStyle3() {
        firstView.updateConstraints { (make) in
            make.ELLeft.equalTo(self.view.ELLeft).constant(50)
            make.ELTop.equalTo(self.view.ELTop).constant(50)
            make.ELBottom.equalTo(self.view.ELBottom).constant(-50)
            make.ELRight.equalTo(self.view.ELRight).constant(-50)
        }
    }
    
    //MARK: event methods
    @IBAction func remakeConstraints(sender: AnyObject) {
        layoutStyle2()
        UIView.animateWithDuration(0.5) { 
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func removeAllConstraints(sender: AnyObject) {
        firstView.makeConstraints { (make) in
            make.removeAll()
        }
        secondView.makeConstraints { (make) in
            make.removeAll()
        }
        thirdView.makeConstraints { (make) in
            make.removeAll()
        }
        fouthView.makeConstraints { (make) in
            make.removeAll()
        }

    }
    
    @IBAction func updateAllConstrinats(sender: AnyObject) {
        layoutStyle3()
        UIView.animateWithDuration(0.5) { 
            self.view.layoutIfNeeded()
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

