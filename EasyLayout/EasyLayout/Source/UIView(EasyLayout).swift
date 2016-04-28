//
//  UIView(EasyLayout).swift
//  EasyLayout
//
//  Created by AugustRush on 4/28/16.
//  Copyright © 2016 August. All rights reserved.
//

#if os(iOS) || os(tvOS)
import UIKit
public typealias View = UIView
#else
import AppKit
public typealias View = NSView
#endif

extension View : ELLayoutAttributeProtocol {
    typealias ELMaker = (make : ELLayoutConstraintMaker) -> Void
    //MARK: Make Constraints Methods
    func makeConstraints(maker : ELMaker) {
        
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
    
    private var maker : ELLayoutConstraintMaker {
        get {
            var make = objc_getAssociatedObject(self, &ELLayoutConstraintMakerIdentifier) as? ELLayoutConstraintMaker
            if make == nil {
                make = ELLayoutConstraintMaker(view : self)
                objc_setAssociatedObject(self, &ELLayoutConstraintMakerIdentifier, make, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
            return make!
        }
    }
}

private var ELLayoutConstraintMakerIdentifier = "_"
