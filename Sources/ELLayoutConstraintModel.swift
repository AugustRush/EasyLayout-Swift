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

public class ELLayoutConstraintModel {
    internal weak var view : View!
    internal weak var toView : View!
    internal var relation : NSLayoutRelation = .Equal
    internal var attribute : NSLayoutAttribute!
    internal var toAttribute : NSLayoutAttribute!
    internal var priority : UILayoutPriority = UILayoutPriorityDefaultHigh
    internal var mutiplier : CGFloat = 1.0
    internal var constant : CGFloat = 0.0
    private weak var realConstraint : NSLayoutConstraint?
    //This method must be call when all properties has been set value
    lazy var identifier : String = {
        var str = String()
        str = str + String(unsafeAddressOf(self.view))
        str = str + "/" + String(self.attribute.rawValue)
        if self.relation != .Equal {
            str = str + "/" + String(self.relation.rawValue)
            str = str + "/" + String(unsafeAddressOf(self.toView))
            str = str + "/" + String(self.toAttribute.rawValue)
        }
        return str
    }()
    //MARK: init
    init(view : View, attribute : NSLayoutAttribute) {
        self.view = view
        self.attribute = attribute
    }
    //MARK: public methods
    public func equalTo(paramater : ELModelEquatableType) -> ELLayoutConstraintModel {
        relation = .Equal
        paramater.supplementModel(self);
        return self
    }
    
    public func greaterThanOrEqualTo(paramater : ELModelEquatableType) -> ELLayoutConstraintModel {
        relation = .GreaterThanOrEqual
        paramater.supplementModel(self)
        return self
    }
    
    public func lessThanOrEqualTo(paramater : ELModelEquatableType) -> ELLayoutConstraintModel {
        relation = .LessThanOrEqual
        paramater.supplementModel(self)
        return self
    }
    
    func mutiplier(m : CGFloat) -> ELLayoutConstraintModel {
        mutiplier = mutiplier * m
        return self
    }
    
    func priority(p : UILayoutPriority) -> ELLayoutConstraintModel {
        priority = p
        return self
    }
    
    func constant(c : CGFloat) -> ELLayoutConstraintModel {
        constant = constant + c
        return self
    }

    func isSameAs(model : ELLayoutConstraintModel) -> Bool {
        return (self.identifier == model.identifier)
            && (self.toView == model.toView)
            && (self.mutiplier == model.mutiplier);
    }
    //MARK: constraint
    func constraint() -> NSLayoutConstraint {
        if realConstraint == nil {
            realConstraint =  NSLayoutConstraint(item : self.view,
                                                 attribute : self.attribute,
                                                 relatedBy : self.relation,
                                                 toItem : self.toView,
                                                 attribute : self.toAttribute,
                                                 multiplier : self.mutiplier,
                                                 constant : self.constant)
        }
        
        return realConstraint!
    }
}