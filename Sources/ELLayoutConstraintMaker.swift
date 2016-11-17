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
    
    @discardableResult
    public func ELCombination(attrs: NSLayoutAttribute...) -> ELLayoutCombinationConstraintModel {
        var models : [ELLayoutConstraintModel] = Array()
        
        attrs.forEach { (attr) in
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
    
    //MARK: public methods
    func install() {
        for model in tmpModels {
            self.installConstraint(model: model)
        }
        tmpModels.removeAll()
    }
    
    func removeAll() {
        for model in installedModels.values {
            model.constraint().isActive = false
        }
        installedModels.removeAll()
    }
    
    func updateExsit() {
        for model in tmpModels {
            let identifier = model.identifier
            let exsitModel = installedModels[identifier]
            if let m = exsitModel {
                if m.isSameAs(model: model) {
                    m.constant = model.constant
                    m.constraint().constant = model.constant
                }else{
                    m.constraint().isActive = false
                    self.installConstraint(model: model)
                }
            }else{
                self.installConstraint(model: model)
            }
        }
        //remove all tmp models
        tmpModels.removeAll()
    }
    
    //MARK: private methods
    private func constraintModel(_ att : NSLayoutAttribute) -> ELLayoutConstraintModel {
        let model = ELLayoutConstraintModel(view: refereneView!,attribute: att)
        tmpModels.append(model)
        return model
    }
    
    private func installConstraint(model : ELLayoutConstraintModel) {
        let constraint = model.constraint()
        constraint.isActive = true
        let identifier = model.identifier
        installedModels[identifier] = model
    }
}
