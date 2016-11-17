
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

public typealias ELMakerClosure = (_ make : ELLayoutConstraintMaker) -> Void

extension View : ELLayoutAttributeProtocol {
    //MARK: Make Constraints Methods
    public func makeConstraints(closure : ELMakerClosure) {
        self.translatesAutoresizingMaskIntoConstraints = false
        closure(maker)
        maker.install()
    }
    
    public func remakeConstraints(closure : ELMakerClosure) {
        self.translatesAutoresizingMaskIntoConstraints = false
        maker.removeAll()
        closure(maker)
        maker.install()
    }

    func updateConstraints(closure : ELMakerClosure) {
        self.translatesAutoresizingMaskIntoConstraints = false
        closure(maker)
        maker.updateExsit()
    }
    
    //MARK: ELLayoutAttributeProtocol
    public var ELLeft : ELLayoutConstraintModel {
        return constraintModel(.left)
    }
    
    public var ELRight : ELLayoutConstraintModel {
        return constraintModel(.right)
    }
    
    public var ELTop : ELLayoutConstraintModel {
        return constraintModel(.top)
    }
    
    public var ELBottom : ELLayoutConstraintModel {
        return constraintModel(.bottom)
    }
    
    public var ELWidth : ELLayoutConstraintModel {
        return constraintModel(.width)
    }
    
    public var ELHeight : ELLayoutConstraintModel {
        return constraintModel(.height)
    }
    
    public var ELNone : ELLayoutConstraintModel {
        return constraintModel(.notAnAttribute)
    }
    public var ELCenterX : ELLayoutConstraintModel {
        return constraintModel(.centerX)
    }
    public var ELCenterY : ELLayoutConstraintModel {
        return constraintModel(.centerY)
    }
    public var ELLeading : ELLayoutConstraintModel {
        return constraintModel(.leading)
    }
    public var ELTrailing : ELLayoutConstraintModel {
        return constraintModel(.trailing)
    }
   
    public var ELLastBaseline : ELLayoutConstraintModel {
        return constraintModel(.lastBaseline)
    }
    
    public var ELSize: ELLayoutCombinationConstraintModel {
        let width = constraintModel(.width)
        let height = constraintModel(.height)
        return ELLayoutCombinationConstraintModel(ms: width,height)
    }
    
    public var ELCenter: ELLayoutCombinationConstraintModel {
        let centerX = constraintModel(.centerX)
        let centerY = constraintModel(.centerY)
        return ELLayoutCombinationConstraintModel(ms: centerX,centerY)
    }
    
    public var ELAllEdges: ELLayoutCombinationConstraintModel {
        let top = constraintModel(.top)
        let left = constraintModel(.left)
        let bottom = constraintModel(.bottom)
        let right = constraintModel(.right)
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
        return constraintModel(.firstBaseline)
    }
    @available(iOS 8.0, *)
    public var ELLeftMargin : ELLayoutConstraintModel {
        return constraintModel(.leftMargin)
    }
    @available(iOS 8.0, *)
    public var ELRightMargin : ELLayoutConstraintModel {
        return constraintModel(.rightMargin)
    }
    @available(iOS 8.0, *)
    public var ELBottomMargin : ELLayoutConstraintModel {
        return constraintModel(.bottomMargin)
    }
    @available(iOS 8.0, *)
    public var ELLeadingMargin : ELLayoutConstraintModel {
        return constraintModel(.leadingMargin)
    }
    @available(iOS 8.0, *)
    public var ELTrailingMargin : ELLayoutConstraintModel {
        return constraintModel(.trailingMargin)
    }
    @available(iOS 8.0, *)
    public var ELCenterXWithMargins : ELLayoutConstraintModel {
        return constraintModel(.centerXWithinMargins)
    }
    @available(iOS 8.0, *)
    public var ELCenterYWithMargins : ELLayoutConstraintModel {
        return constraintModel(.centerYWithinMargins)
    }
    
    private func constraintModel(_ attribute : NSLayoutAttribute) -> ELLayoutConstraintModel {
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
