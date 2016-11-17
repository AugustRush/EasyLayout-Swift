//
//  ELConstraintModelSequenceTypeExtension.swift
//  EasyLayout
//
//  Created by AugustRush on 5/3/16.
//  Copyright © 2016 August. All rights reserved.
//

import Foundation

extension Sequence where Iterator.Element : ELLayoutConstraintModel {
    
    //MARK: public methods
    public func equalTo(paramater : ELModelArrayEquatableType) -> Void {
       paramater.supplementModels(self as! [ELLayoutConstraintModel], relation: .equal)
    }
    
    public func greaterThanOrEqualTo(paramater : ELModelArrayEquatableType) -> Void {
        paramater.supplementModels(self as! [ELLayoutConstraintModel], relation: .greaterThanOrEqual)
    }
    
    public func lessThanOrEqualTo(paramater : ELModelArrayEquatableType) -> Void {
        paramater.supplementModels(self as! [ELLayoutConstraintModel], relation: .lessThanOrEqual)
    }
}
