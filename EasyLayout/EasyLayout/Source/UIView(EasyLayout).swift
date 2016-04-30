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
    //MARK: Make Constraints Methods
    typealias ELMakerClosure = (make : ELLayoutConstraintMaker) -> Void
    func makeConstraints(closure : ELMakerClosure) {
        self.translatesAutoresizingMaskIntoConstraints = false
        closure(make: maker)
        maker.install()
    }
    
    //MARK: ELLayoutAttributeProtocol
    var ELLeft : ELLayoutConstraintModel {
        return constraintModel(NSLayoutAttribute.Left)
    }
    
    var ELRight : ELLayoutConstraintModel {
        return constraintModel(NSLayoutAttribute.Right)
    }
    
    var ELTop : ELLayoutConstraintModel {
        return constraintModel(NSLayoutAttribute.Top)
    }
    
    var ELBottom : ELLayoutConstraintModel {
        return constraintModel(NSLayoutAttribute.Bottom)
    }
    
    private func constraintModel(attribute : NSLayoutAttribute) -> ELLayoutConstraintModel {
        let model = ELLayoutConstraintModel(view: self,attribute: attribute)
        return model
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
