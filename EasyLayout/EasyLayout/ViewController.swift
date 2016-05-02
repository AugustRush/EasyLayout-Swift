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
            make.ELLeft == 10.0
            make.ELTop == 10
            make.ELBottom == -10
            make.ELRight == -10
        }
        
        secondView.remakeConstraints { (make) in
            make.ELLeft == 40
            make.ELTop == 40
            make.ELBottom == -40
            make.ELRight == -40
        }
        
        thirdView.remakeConstraints { (make) in
            make.ELLeft == 70
            make.ELTop == 70
            make.ELBottom == -70
            make.ELRight == -70
        }
        fouthView.remakeConstraints { (make) in
            make.ELLeft == 100
            make.ELTop == 100
            make.ELBottom == -100
            make.ELRight == -100
        }
    }
    
    func layoutStyle2() {
        firstView.remakeConstraints { (make) in
            make.ELLeft == 10
            make.ELTop == 10
            make.ELWidth == self.view.ELWidth / 2 - 30
            make.ELHeight == self.view.ELHeight / 3 - 30
        }
        
        secondView.remakeConstraints { (make) in
            make.ELTop == 10
            make.ELRight == -10
            make.ELWidth == self.firstView
            make.ELHeight == self.firstView
        }
        
        thirdView.remakeConstraints { (make) in
            make.ELTop == self.firstView.ELBottom + 10
            make.ELLeft == 10
            make.ELWidth == self.firstView
            make.ELHeight == self.firstView
        }
        
        fouthView.remakeConstraints { (make) in
            make.ELTop == self.secondView.ELBottom + 10
            make.ELRight == -10
            make.ELWidth == self.firstView
            make.ELHeight == self.firstView
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

