//
//  ELOperatorsOverloading.swift
//  EasyLayout
//
//  Created by AugustRush on 5/2/16.
//  Copyright © 2016 August. All rights reserved.
//

#if os(iOS) || os(tvOS)
import UIKit
#else
import AppKit
#endif

@discardableResult
public func ==(lhs : ELLayoutConstraintModel,  rhs: ELModelEquatableType) -> ELLayoutConstraintModel {
    return lhs.equalTo(rhs)
}

@discardableResult
public func >=(lhs : ELLayoutConstraintModel,  rhs: ELModelEquatableType) -> ELLayoutConstraintModel {
    return lhs.greaterThanOrEqualTo(rhs)
}

@discardableResult
public func <=(lhs : ELLayoutConstraintModel,  rhs: ELModelEquatableType) -> ELLayoutConstraintModel {
    return lhs.lessThanOrEqualTo(rhs)
}

@discardableResult
public func + (lhs : ELLayoutConstraintModel,  rhs: Int) -> ELLayoutConstraintModel {
    return lhs.constant(CGFloat(rhs))
}

@discardableResult
public func + (lhs : ELLayoutConstraintModel,  rhs: Float) -> ELLayoutConstraintModel {
    return lhs.constant(CGFloat(rhs))
}

@discardableResult
public func + (lhs : ELLayoutConstraintModel,  rhs: Double) -> ELLayoutConstraintModel {
    return lhs.constant(CGFloat(rhs))
}

@discardableResult
public func + (lhs : ELLayoutConstraintModel,  rhs: CGFloat) -> ELLayoutConstraintModel {
    return lhs.constant(rhs)
}

@discardableResult
public func - (lhs : ELLayoutConstraintModel,  rhs: Int) -> ELLayoutConstraintModel {
    return lhs.constant(CGFloat(-rhs))
}

@discardableResult
public func - (lhs : ELLayoutConstraintModel,  rhs: Float) -> ELLayoutConstraintModel {
    return lhs.constant(CGFloat(-rhs))
}

@discardableResult
public func - (lhs : ELLayoutConstraintModel,  rhs: Double) -> ELLayoutConstraintModel {
    return lhs.constant(CGFloat(-rhs))
}

@discardableResult
public func - (lhs : ELLayoutConstraintModel,  rhs: CGFloat) -> ELLayoutConstraintModel {
    return lhs.constant(-rhs)
}

@discardableResult
public func * (lhs : ELLayoutConstraintModel,  rhs: Int) -> ELLayoutConstraintModel {
    return lhs.mutiplier(CGFloat(rhs))
}

@discardableResult
public func * (lhs : ELLayoutConstraintModel,  rhs: Float) -> ELLayoutConstraintModel {
    return lhs.mutiplier(CGFloat(rhs))
}

@discardableResult
public func * (lhs : ELLayoutConstraintModel,  rhs: Double) -> ELLayoutConstraintModel {
    return lhs.mutiplier(CGFloat(rhs))
}

@discardableResult
public func * (lhs : ELLayoutConstraintModel,  rhs: CGFloat) -> ELLayoutConstraintModel {
    return lhs.mutiplier(rhs)
}

@discardableResult
public func / (lhs : ELLayoutConstraintModel,  rhs: Int) -> ELLayoutConstraintModel {
    let m = 1.0 / CGFloat(rhs);
    return lhs.mutiplier(m);
}

@discardableResult
public func / (lhs : ELLayoutConstraintModel,  rhs: Float) -> ELLayoutConstraintModel {
    let m = 1.0 / CGFloat(rhs);
    return lhs.mutiplier(m)
}

@discardableResult
public func / (lhs : ELLayoutConstraintModel,  rhs: Double) -> ELLayoutConstraintModel {
    let m = 1.0 / CGFloat(rhs);
    return lhs.mutiplier(m)
}

@discardableResult
public func / (lhs : ELLayoutConstraintModel,  rhs: CGFloat) -> ELLayoutConstraintModel {
    let m = 1.0 / rhs;
    return lhs.mutiplier(m)
}



