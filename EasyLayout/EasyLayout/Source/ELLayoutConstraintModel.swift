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
    weak var view : View!
    weak var toView : View!
    var mutiplier : CGFloat = 1.0
    var relation : NSLayoutRelation = .Equal
    var attribute : NSLayoutAttribute!
    var toAttribute : NSLayoutAttribute!
    var constant : CGFloat = 0.0
    //MARK: constraint
    lazy var constraint : NSLayoutConstraint = {
        return NSLayoutConstraint(item : self.view,
                                  attribute : self.attribute,
                                  relatedBy : self.relation,
                                  toItem : self.toView,
                                  attribute : self.toAttribute,
                                  multiplier : self.mutiplier,
                                  constant : self.constant)
        
    }()
}
