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
