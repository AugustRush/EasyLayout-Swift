//
//  ELLayoutConstraintModel.swift
//  EasyLayout
//
//  Created by AugustRush on 4/28/16.
//  Copyright © 2016 August. All rights reserved.
//

#if os(iOS) || os(tvOS)
import UIKit
#else
import AppKit
#endif

class ELLayoutConstraintModel {
    
    //MARK: public methods
    func equalTo(_ : ELConstraintItem) {
        
    }
    
    func greaterThanOrEqualTo(_ : ELConstraintItem) {
        
    }
    
    func lessThanOrEqualTo(_ : ELConstraintItem) {
        
    }

    //MARK: internal
    private var item1 = ELConstraintItem()
    private var item2 = ELConstraintItem()
}

struct ELConstraintItem {
    weak var view : View!
    var mutiplier : Float = 1.0
    var relation : NSLayoutRelation = .Equal
    var attribute : NSLayoutAttribute!
    var constant : Float = 0.0
}
