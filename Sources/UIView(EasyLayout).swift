
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

public typealias ELMakerClosure = (make : ELLayoutConstraintMaker) -> Void

extension View : ELLayoutAttributeProtocol {
    //MARK: Make Constraints Methods
    public func makeConstraints(closure : ELMakerClosure) {
        self.translatesAutoresizingMaskIntoConstraints = false
        closure(make: maker)
        maker.install()
    }
    
    public func remakeConstraints(closure : ELMakerClosure) {
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
    public var ELLeft : ELLayoutConstraintModel {
        return constraintModel(.Left)
    }
    
    public var ELRight : ELLayoutConstraintModel {
        return constraintModel(.Right)
    }
    
    public var ELTop : ELLayoutConstraintModel {
        return constraintModel(.Top)
    }
    
    public var ELBottom : ELLayoutConstraintModel {
        return constraintModel(.Bottom)
    }
    
    public var ELWidth : ELLayoutConstraintModel {
        return constraintModel(.Width)
    }
    
    public var ELHeight : ELLayoutConstraintModel {
        return constraintModel(.Height)
    }
    
    public var ELNone : ELLayoutConstraintModel {
        return constraintModel(.NotAnAttribute)
    }
    public var ELCenterX : ELLayoutConstraintModel {
        return constraintModel(.CenterX)
    }
    public var ELCenterY : ELLayoutConstraintModel {
        return constraintModel(.CenterY)
    }
    public var ELLeading : ELLayoutConstraintModel {
        return constraintModel(.Leading)
    }
    public var ELTrailing : ELLayoutConstraintModel {
        return constraintModel(.Trailing)
    }
    public var ELBaseline : ELLayoutConstraintModel {
        return constraintModel(.Baseline)
    }
    public var ELLastBaseline : ELLayoutConstraintModel {
        return constraintModel(.LastBaseline)
    }
    
    public var ELSize: ELLayoutCombinationConstraintModel {
        let width = constraintModel(.Width)
        let height = constraintModel(.Height)
        return ELLayoutCombinationConstraintModel(ms: width,height)
    }
    
    public var ELCenter: ELLayoutCombinationConstraintModel {
        let centerX = constraintModel(.CenterX)
        let centerY = constraintModel(.CenterY)
        return ELLayoutCombinationConstraintModel(ms: centerX,centerY)
    }
    
    public var ELAllEdges: ELLayoutCombinationConstraintModel {
        let top = constraintModel(.Top)
        let left = constraintModel(.Left)
        let bottom = constraintModel(.Bottom)
        let right = constraintModel(.Right)
        return ELLayoutCombinationConstraintModel(ms: top,left,bottom,right)
    }
    
    public func ELCombination(attrs: NSLayoutAttribute...) -> ELLayoutCombinationConstraintModel {
        var models : [ELLayoutConstraintModel] = Array()
        for attr in attrs {
            let m = constraintModel(attr)
            models.append(m)
        }
        return ELLayoutCombinationConstraintModel(ms: models)
    }
    
    @available(iOS 8.0, *)
    public var ELFirstBaseline : ELLayoutConstraintModel {
        return constraintModel(.FirstBaseline)
    }
    @available(iOS 8.0, *)
    public var ELLeftMargin : ELLayoutConstraintModel {
        return constraintModel(.LeftMargin)
    }
    @available(iOS 8.0, *)
    public var ELRightMargin : ELLayoutConstraintModel {
        return constraintModel(.RightMargin)
    }
    @available(iOS 8.0, *)
    public var ELBottomMargin : ELLayoutConstraintModel {
        return constraintModel(.BottomMargin)
    }
    @available(iOS 8.0, *)
    public var ELLeadingMargin : ELLayoutConstraintModel {
        return constraintModel(.LeadingMargin)
    }
    @available(iOS 8.0, *)
    public var ELTrailingMargin : ELLayoutConstraintModel {
        return constraintModel(.TrailingMargin)
    }
    @available(iOS 8.0, *)
    public var ELCenterXWithMargins : ELLayoutConstraintModel {
        return constraintModel(.CenterXWithinMargins)
    }
    @available(iOS 8.0, *)
    public var ELCenterYWithMargins : ELLayoutConstraintModel {
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
