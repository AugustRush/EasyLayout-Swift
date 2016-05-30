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
            make.ELAllEdges.equalTo(0)
        }
        
        secondView.remakeConstraints { (make) in
            make.ELAllEdges.equalTo(40,40,-40,-40)
        }
        
        thirdView.remakeConstraints { (make) in
            make.ELAllEdges.equalTo(80,80,-80,-80)
        }
        
        fouthView.remakeConstraints { (make) in
            make.ELAllEdges.equalTo(120,120,-120,-120)
        }
    }
    
    func layoutStyle2() {
        firstView.remakeConstraints { (make) in
            make.ELCombination(.Left,.Top)
                .equalTo(10,10)
            make.ELSize.equalTo(self.view).mutipliers(0.5).constants(-30)
        }
        
        secondView.remakeConstraints { (make) in
            make.ELTop == 10
            make.ELRight == -10
            make.ELSize.equalTo(self.firstView)
        }
        
        thirdView.remakeConstraints { (make) in
            make.ELTop == self.firstView.ELBottom + 10
            make.ELLeft == 10
            make.ELSize.equalTo(self.firstView)
        }
        
        fouthView.remakeConstraints { (make) in
            make.ELTop == self.secondView.ELBottom + 10
            make.ELRight == -10
            make.ELSize.equalTo(self.firstView)
        }
    }
    
    func layoutStyle3() {
        firstView.updateConstraints { (make) in
           make.ELSize.equalTo(self.view).constants(-20)
        }
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

