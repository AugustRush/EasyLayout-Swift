//
//  ELLayoutAttributeProtocol.swift
//  EasyLayout
//
//  Created by AugustRush on 4/28/16.
//  Copyright © 2016 August. All rights reserved.
//

import UIKit

protocol ELLayoutAttributeProtocol {
    var ELLeft : ELLayoutConstraintModel { get }
    var ELRight : ELLayoutConstraintModel { get }
    var ELTop : ELLayoutConstraintModel { get }
    var ELBottom : ELLayoutConstraintModel { get }
    var ELWidth : ELLayoutConstraintModel { get }
    var ELHeight : ELLayoutConstraintModel { get }
    var ELNone : ELLayoutConstraintModel { get }
    var ELCenterX : ELLayoutConstraintModel { get }
    var ELCenterY : ELLayoutConstraintModel { get }
    var ELLeading : ELLayoutConstraintModel { get }
    var ELTrailing : ELLayoutConstraintModel { get }
    var ELBaseline : ELLayoutConstraintModel { get }
    var ELLastBaseline : ELLayoutConstraintModel { get }
    var ELSize : ELLayoutCombinationConstraintModel { get }
    
    //
    @available(iOS 8.0, *)
    var ELFirstBaseline : ELLayoutConstraintModel { get }
    @available(iOS 8.0, *)
    var ELLeftMargin : ELLayoutConstraintModel { get }
    @available(iOS 8.0, *)
    var ELRightMargin : ELLayoutConstraintModel { get }
    @available(iOS 8.0, *)
    var ELBottomMargin : ELLayoutConstraintModel { get }
    @available(iOS 8.0, *)
    var ELLeadingMargin : ELLayoutConstraintModel { get }
    @available(iOS 8.0, *)
    var ELTrailingMargin : ELLayoutConstraintModel { get }
    @available(iOS 8.0, *)
    var ELCenterXWithMargins : ELLayoutConstraintModel { get }
    @available(iOS 8.0, *)
    var ELCenterYWithMargins : ELLayoutConstraintModel { get }
}
