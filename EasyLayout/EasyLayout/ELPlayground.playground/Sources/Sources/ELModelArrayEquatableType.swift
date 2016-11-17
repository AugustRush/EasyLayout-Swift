//
//  ELModelArrayEquatableType.swift
//  EasyLayout
//
//  Created by AugustRush on 5/3/16.
//  Copyright © 2016 August. All rights reserved.
//

#if os(iOS) || os(tvOS)
import UIKit
#else
import AppKit
#endif

public protocol ELModelArrayEquatableType {
    func supplementModels(models : [ELLayoutConstraintModel], relation : NSLayoutRelation);
}

extension View : ELModelArrayEquatableType {
    public func supplementModels(models: [ELLayoutConstraintModel], relation: NSLayoutRelation) {
        for model in models {
            model.toView = self
            model.toAttribute = model.attribute
            model.relation = relation
        }
    }
}

extension Array where Iterator.Element : ELModelEquatableType  {

}
