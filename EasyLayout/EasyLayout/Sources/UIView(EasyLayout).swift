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
    
    func remakeConstraints(closure : ELMakerClosure) {
        self.translatesAutoresizingMaskIntoConstraints = false
        maker.removeAll()
        closure(make: maker)
        maker.install()
    }

    func updateConstraints(closure : ELMakerClosure) {
        self.translatesAutoresizingMaskIntoConstraints = false
        closure(make: maker)
        maker.updateExsit()
    }
    
    //MARK: ELLayoutAttributeProtocol
    var ELLeft : ELLayoutConstraintModel {
        return constraintModel(.Left)
    }
    
    var ELRight : ELLayoutConstraintModel {
        return constraintModel(.Right)
    }
    
    var ELTop : ELLayoutConstraintModel {
        return constraintModel(.Top)
    }
    
    var ELBottom : ELLayoutConstraintModel {
        return constraintModel(.Bottom)
    }
    
    var ELWidth : ELLayoutConstraintModel {
        return constraintModel(.Width)
    }
    
    var ELHeight : ELLayoutConstraintModel {
        return constraintModel(.Height)
    }
    
    var ELNone : ELLayoutConstraintModel {
        return constraintModel(.NotAnAttribute)
    }
    var ELCenterX : ELLayoutConstraintModel {
        return constraintModel(.CenterX)
    }
    var ELCenterY : ELLayoutConstraintModel {
        return constraintModel(.CenterY)
    }
    var ELLeading : ELLayoutConstraintModel {
        return constraintModel(.Leading)
    }
    var ELTrailing : ELLayoutConstraintModel {
        return constraintModel(.Trailing)
    }
    var ELBaseline : ELLayoutConstraintModel {
        return constraintModel(.Baseline)
    }
    var ELLastBaseline : ELLayoutConstraintModel {
        return constraintModel(.LastBaseline)
    }
    
    var ELSize: ELLayoutCombinationConstraintModel {
        let width = constraintModel(.Width)
        let height = constraintModel(.Height)
        return ELLayoutCombinationConstraintModel(ms: width,height)
    }
    
    var ELCenter: ELLayoutCombinationConstraintModel {
        let centerX = constraintModel(.CenterX)
        let centerY = constraintModel(.CenterY)
        return ELLayoutCombinationConstraintModel(ms: centerX,centerY)
    }
    
    var ELAllEdges: ELLayoutCombinationConstraintModel {
        let top = constraintModel(.Top)
        let left = constraintModel(.Left)
        let bottom = constraintModel(.Bottom)
        let right = constraintModel(.Right)
        return ELLayoutCombinationConstraintModel(ms: top,left,bottom,right)
    }
    
    @available(iOS 8.0, *)
    var ELFirstBaseline : ELLayoutConstraintModel {
        return constraintModel(.FirstBaseline)
    }
    @available(iOS 8.0, *)
    var ELLeftMargin : ELLayoutConstraintModel {
        return constraintModel(.LeftMargin)
    }
    @available(iOS 8.0, *)
    var ELRightMargin : ELLayoutConstraintModel {
        return constraintModel(.RightMargin)
    }
    @available(iOS 8.0, *)
    var ELBottomMargin : ELLayoutConstraintModel {
        return constraintModel(.BottomMargin)
    }
    @available(iOS 8.0, *)
    var ELLeadingMargin : ELLayoutConstraintModel {
        return constraintModel(.LeadingMargin)
    }
    @available(iOS 8.0, *)
    var ELTrailingMargin : ELLayoutConstraintModel {
        return constraintModel(.TrailingMargin)
    }
    @available(iOS 8.0, *)
    var ELCenterXWithMargins : ELLayoutConstraintModel {
        return constraintModel(.CenterXWithinMargins)
    }
    @available(iOS 8.0, *)
    var ELCenterYWithMargins : ELLayoutConstraintModel {
        return constraintModel(.CenterYWithinMargins)
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

private var ELLayoutConstraintMakerIdentifier = "_EasyLayoutMaker_"
