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
    private weak var view : View!
    private weak var toView : View!
    private var mutiplier : CGFloat = 1.0
    private var relation : NSLayoutRelation = .Equal
    private var attribute : NSLayoutAttribute!
    private var toAttribute : NSLayoutAttribute!
    private var constant : CGFloat = 0.0
    
    //MARK: init
    init(view : View, attribute : NSLayoutAttribute) {
        self.view = view
        self.attribute = attribute
    }
    //MARK: public methods
    func equalTo(model : ELLayoutConstraintModel) -> ELLayoutConstraintModel {
        relation = .Equal
        toView = model.view
        toAttribute = model.attribute
        return self
    }
    
    func greaterThanOrEqualTo(model : ELLayoutConstraintModel) -> ELLayoutConstraintModel {
        relation = .GreaterThanOrEqual
        toView = model.view
        toAttribute = model.attribute
        return self
    }
    
    func lessThanOrEqualTo(model : ELLayoutConstraintModel) -> ELLayoutConstraintModel {
        relation = .LessThanOrEqual
        toView = model.view
        toAttribute = model.attribute
        return self
    }
    
    func mutiplier(m : CGFloat) -> ELLayoutConstraintModel {
        mutiplier = m
        return self
    }
    
    func constant(c : CGFloat) -> ELLayoutConstraintModel {
        constant = c
        return self
    }

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
