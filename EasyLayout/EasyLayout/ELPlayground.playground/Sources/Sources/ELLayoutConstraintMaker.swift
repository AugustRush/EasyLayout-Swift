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

public class ELLayoutConstraintMaker : ELLayoutAttributeProtocol {
    //MARK: properties
    private weak var refereneView : View?
    //use for store constraints models temporary
    private var tmpModels : [ELLayoutConstraintModel] = Array()
    //has installed constraint's Models
    private var installedModels : [String : ELLayoutConstraintModel] = Dictionary()
    
    //MARK: init method
    init(view : View) {
        refereneView = view
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
    
    //MARK: public methods
    func install() {
        for model in tmpModels {
            self.installConstraint(model)
        }
        tmpModels.removeAll()
    }
    
    func removeAll() {
        for model in installedModels.values {
            model.constraint().active = false
        }
        installedModels.removeAll()
    }
    
    func updateExsit() {
        for model in tmpModels {
            let identifier = model.identifier
            let exsitModel = installedModels[identifier]
            if let m = exsitModel {
                if m.isSameAs(model) {
                    m.constant = model.constant
                    m.constraint().constant = model.constant
                }else{
                    m.constraint().active = false
                    self.installConstraint(model)
                }
            }else{
                self.installConstraint(model)
            }
        }
        //remove all tmp models
        tmpModels.removeAll()
    }
    
    //MARK: private methods
    private func constraintModel(att : NSLayoutAttribute) -> ELLayoutConstraintModel {
        let model = ELLayoutConstraintModel(view: refereneView!,attribute: att)
        tmpModels.append(model)
        return model
    }
    
    private func installConstraint(model : ELLayoutConstraintModel) {
        let constraint = model.constraint()
        constraint.active = true
        let identifier = model.identifier
        installedModels[identifier] = model
    }
}
