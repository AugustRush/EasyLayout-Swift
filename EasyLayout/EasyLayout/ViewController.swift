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
        firstView.remakeConstraints { (make) in
            make.ELLeft.equalTo(10.0)
            make.ELTop.equalTo(10)
            make.ELBottom.equalTo(-10)
            make.ELRight.equalTo(-10)
        }
        
        secondView.remakeConstraints { (make) in
            make.ELLeft.equalTo(40)
            make.ELTop.equalTo(40)
            make.ELBottom.equalTo(-40)
            make.ELRight.equalTo(-40)
        }
        
        thirdView.remakeConstraints { (make) in
            make.ELLeft.equalTo(70)
            make.ELTop.equalTo(70)
            make.ELBottom.equalTo(-70)
            make.ELRight.equalTo(-70)
        }
        fouthView.remakeConstraints { (make) in
            make.ELLeft.equalTo(100)
            make.ELTop.equalTo(100)
            make.ELBottom.equalTo(-100)
            make.ELRight.equalTo(-100)
        }
    }
    
    func layoutStyle2() {
        firstView.remakeConstraints { (make) in
            make.ELLeft.equalTo(10)
            make.ELTop.equalTo(10)
            make.ELWidth.equalTo(140)
            make.ELHeight.equalTo(160)
        }
        
        secondView.remakeConstraints { (make) in
            make.ELTop.equalTo(10)
            make.ELRight.equalTo(-10)
            make.ELWidth.equalTo(self.firstView)
            make.ELHeight.equalTo(self.firstView)
        }
        
        thirdView.remakeConstraints { (make) in
            make.ELTop.equalTo(self.firstView.ELBottom).constant(10)
            make.ELLeft.equalTo(10)
            make.ELWidth.equalTo(self.firstView)
            make.ELHeight.equalTo(self.firstView)
        }
        
        fouthView.remakeConstraints { (make) in
            make.ELTop.equalTo(self.secondView.ELBottom).constant(10)
            make.ELRight.equalTo(-10)
            make.ELWidth.equalTo(self.firstView)
            make.ELHeight.equalTo(self.firstView)
        }

    }
    
    func layoutStyle3() {

    }
    
    //MARK: event methods
    @IBAction func initialLayout(sender: AnyObject) {
        layoutStyle1()
        UIView.animateWithDuration(0.5) {
            self.view.layoutIfNeeded()
        }
    }
    
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

