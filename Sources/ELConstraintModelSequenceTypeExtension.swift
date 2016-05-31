//
//  ELConstraintModelSequenceTypeExtension.swift
//  EasyLayout
//
//  Created by AugustRush on 5/3/16.
//  Copyright © 2016 August. All rights reserved.
//

import Foundation

extension _ArrayType where Generator.Element : ELLayoutConstraintModel {
    
    //MARK: public methods
    public func equalTo(paramater : ELModelArrayEquatableType) -> Void {
       paramater.supplementModels(self as! [ELLayoutConstraintModel], relation: .Equal)
    }
    
    public func greaterThanOrEqualTo(paramater : ELModelArrayEquatableType) -> Void {
        paramater.supplementModels(self as! [ELLayoutConstraintModel], relation: .GreaterThanOrEqual)
    }
    
    public func lessThanOrEqualTo(paramater : ELModelArrayEquatableType) -> Void {
        paramater.supplementModels(self as! [ELLayoutConstraintModel], relation: .LessThanOrEqual)
    }
}