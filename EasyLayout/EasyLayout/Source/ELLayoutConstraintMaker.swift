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
    private var models : [ELLayoutConstraintModel] = Array()
    
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
        for model in models {
            model.constraint().active = true
        }
    }
    
    func removeAll() {
        for model in models {
            model.constraint().active = false
        }
        models.removeAll()
    }
    
    func updateExsit() {
        
    }
    
    //MARK: private methods
    private func constraintModel(att : NSLayoutAttribute) -> ELLayoutConstraintModel {
        let model = ELLayoutConstraintModel(view: refereneView!,attribute: att)
        models.append(model)
        return model
    }
}
