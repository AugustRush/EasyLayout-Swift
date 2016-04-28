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
    weak var refereneView : View?
    
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
    
    private func constraintModel(attribute : NSLayoutAttribute) -> ELLayoutConstraintModel {
        let model = ELLayoutConstraintModel()
        return model
    }
    
}
