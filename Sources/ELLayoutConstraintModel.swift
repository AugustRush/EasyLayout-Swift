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
    internal var relation : NSLayoutRelation = .equal
    internal var attribute : NSLayoutAttribute!
    internal var toAttribute : NSLayoutAttribute!
    internal var priority : UILayoutPriority = UILayoutPriorityDefaultHigh
    internal var mutiplier : CGFloat = 1.0
    internal var constant : CGFloat = 0.0
    private weak var realConstraint : NSLayoutConstraint?
    //This method must be call when all properties has been set value
    lazy var identifier : String = {
        var str = String()
        let viewAddr = unsafeBitCast(self.view, to: Int.self)
        str = str + String(viewAddr)
        str = str + "/" + String(self.attribute.rawValue)
        if self.relation != .equal {
            str = str + "/" + String(self.relation.rawValue)
            let toViewAddr = unsafeBitCast(self.toView, to: Int.self)
            str = str + "/" + String(toViewAddr)
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
    @discardableResult
    public func equalTo(_ paramater : ELModelEquatableType) -> ELLayoutConstraintModel {
        relation = .equal
        paramater.supplementModel(self);
        return self
    }
    
    @discardableResult
    public func greaterThanOrEqualTo(_ paramater : ELModelEquatableType) -> ELLayoutConstraintModel {
        relation = .greaterThanOrEqual
        paramater.supplementModel(self)
        return self
    }
    
    @discardableResult
    public func lessThanOrEqualTo(_ paramater : ELModelEquatableType) -> ELLayoutConstraintModel {
        relation = .lessThanOrEqual
        paramater.supplementModel(self)
        return self
    }
    
    @discardableResult
    func mutiplier(_ m : CGFloat) -> ELLayoutConstraintModel {
        mutiplier = mutiplier * m
        return self
    }
    
    @discardableResult
    func priority(_ p : UILayoutPriority) -> ELLayoutConstraintModel {
        priority = p
        return self
    }
    
    @discardableResult
    func constant(_ c : CGFloat) -> ELLayoutConstraintModel {
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
