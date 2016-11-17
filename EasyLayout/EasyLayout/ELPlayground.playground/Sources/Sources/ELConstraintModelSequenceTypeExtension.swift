//
//  ELConstraintModelSequenceTypeExtension.swift
//  EasyLayout
//
//  Created by AugustRush on 5/3/16.
//  Copyright © 2016 August. All rights reserved.
//

import Foundation

extension Array where Generator.Element : ELLayoutConstraintModel {
    
    //MARK: public methods
    public func equalTo(_ paramater : ELModelArrayEquatableType) -> Void {
       paramater.supplementModels(self as! [ELLayoutConstraintModel], relation: .Equal)
    }
    
    public func greaterThanOrEqualTo(_ paramater : ELModelArrayEquatableType) -> Void {
        paramater.supplementModels(self as! [ELLayoutConstraintModel], relation: .GreaterThanOrEqual)
    }
    
    public func lessThanOrEqualTo(_ paramater : ELModelArrayEquatableType) -> Void {
        paramater.supplementModels(self as! [ELLayoutConstraintModel], relation: .LessThanOrEqual)
    }
}
