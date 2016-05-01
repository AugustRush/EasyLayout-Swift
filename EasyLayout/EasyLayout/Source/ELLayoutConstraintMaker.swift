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
