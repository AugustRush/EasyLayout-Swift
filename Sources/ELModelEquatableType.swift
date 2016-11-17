//
//  ELModelEquatableType.swift
//  EasyLayout
//
//  Created by AugustRush on 5/2/16.
//  Copyright © 2016 August. All rights reserved.
//

import UIKit

public protocol ELModelEquatableType {
    func supplementModel(_ m : ELLayoutConstraintModel);
}

extension ELLayoutConstraintModel : ELModelEquatableType {
    public func supplementModel(_ m: ELLayoutConstraintModel) {
        m.toView = self.view
        m.toAttribute = self.attribute
        //operator priority '+' > '==' ,so need to assigment, or change the operator priority
        m.constant = self.constant
        m.mutiplier = self.mutiplier
    }
}

extension Int : ELModelEquatableType {
    public func supplementModel(_ m: ELLayoutConstraintModel) {
        configurationModel(m, constant: CGFloat(self))
    }
}

extension Double : ELModelEquatableType {
    public func supplementModel(_ m: ELLayoutConstraintModel) {
        configurationModel(m, constant: CGFloat(self))
    }
}

extension CGFloat : ELModelEquatableType {
    public func supplementModel(_ m: ELLayoutConstraintModel) {
        configurationModel(m, constant: self)
    }
}

extension View : ELModelEquatableType {
    public func supplementModel(_ m: ELLayoutConstraintModel) {
        m.toView = self
        m.toAttribute = m.attribute
    }
}

private func configurationModel(_ m : ELLayoutConstraintModel , constant : CGFloat) {
    if m.attribute != NSLayoutAttribute.width
        && m.attribute != NSLayoutAttribute.height {
        m.toView = m.view.superview
        m.toAttribute = m.attribute
    }else{
        m.toView = nil
        m.toAttribute = NSLayoutAttribute.notAnAttribute
    }
    m.constant = constant
}
