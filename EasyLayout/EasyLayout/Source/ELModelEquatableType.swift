//
//  ELModelEquatableType.swift
//  EasyLayout
//
//  Created by AugustRush on 5/2/16.
//  Copyright © 2016 August. All rights reserved.
//

import UIKit

public protocol ELModelEquatableType {
    func supplementModel(m : ELLayoutConstraintModel);
}

extension ELLayoutConstraintModel : ELModelEquatableType {
    public func supplementModel(m: ELLayoutConstraintModel) {
        m.toView = self.view
        m.toAttribute = self.attribute
        //operator priority '+' > '==' ,so need to assigment, or change the operator priority
        m.constant = self.constant
        m.mutiplier = self.mutiplier
    }
}

extension Int : ELModelEquatableType {
    public func supplementModel(m: ELLayoutConstraintModel) {
        configurationModel(m, constant: CGFloat(self))
    }
}

extension Double : ELModelEquatableType {
    public func supplementModel(m: ELLayoutConstraintModel) {
        configurationModel(m, constant: CGFloat(self))
    }
}

extension CGFloat : ELModelEquatableType {
    public func supplementModel(m: ELLayoutConstraintModel) {
        configurationModel(m, constant: self)
    }
}

extension View : ELModelEquatableType {
    public func supplementModel(m: ELLayoutConstraintModel) {
        m.toView = self
        m.toAttribute = m.attribute
    }
}


private func configurationModel(m : ELLayoutConstraintModel , constant : CGFloat) {
    if m.attribute != NSLayoutAttribute.Width
        && m.attribute != NSLayoutAttribute.Height {
        m.toView = m.view.superview
        m.toAttribute = m.attribute
    }else{
        m.toView = nil
        m.toAttribute = NSLayoutAttribute.NotAnAttribute
    }
    m.constant = constant
}