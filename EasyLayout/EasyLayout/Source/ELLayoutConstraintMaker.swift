//
//  ELLayoutConstraintMaker.swift
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

class ELLayoutConstraintMaker : ELLayoutAttributeProtocol {
    weak var refereneView : View?
    
    init(view : View) {
        refereneView = view
    }
    
    //MARK: ELLayoutAttributeProtocol
    var ELLeft : ELConstraintItem {
        return constraintItem(NSLayoutAttribute.Left)
    }
    
    var ELRight : ELConstraintItem {
        return constraintItem(NSLayoutAttribute.Right)
    }
    
    var ELTop : ELConstraintItem {
        return constraintItem(NSLayoutAttribute.Top)
    }
    
    var ELBottom : ELConstraintItem {
        return constraintItem(NSLayoutAttribute.Bottom)
    }
    
    private func constraintItem(attribute : NSLayoutAttribute) -> ELConstraintItem {
        let item = ELConstraintItem()
        return item
    }
    
}
