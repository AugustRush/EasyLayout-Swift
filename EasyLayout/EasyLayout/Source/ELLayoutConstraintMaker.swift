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
    //MARK:properties
    private unowned var refereneView : View //Weak should be an optional value,use unowned
    var models : [ELLayoutConstraintModel] = Array()
    
    //MARK: init method
    init(view : View) {
        refereneView = view
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
    
    //MARK: public methods
    func install() {
        for model in models {
            model.constraint.active = true
        }
    }
    
    //MARK: private methods
    private func constraintModel(attribute : NSLayoutAttribute) -> ELLayoutConstraintModel {
        let model = ELLayoutConstraintModel(view: refereneView,attribute: attribute)
        models.append(model)
        return model
    }
    
}
