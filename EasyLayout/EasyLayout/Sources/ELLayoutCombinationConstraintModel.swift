//
//  ELLayoutCombinationConstraintModel.swift
//  EasyLayout
//
//  Created by AugustRush on 5/5/16.
//  Copyright © 2016 August. All rights reserved.
//

#if os(iOS) || os(tvOS)
import UIKit
#else
import AppKit
#endif

class ELLayoutCombinationConstraintModel {
    var models : [ELLayoutConstraintModel] = Array()
    
    init(ms : ELLayoutConstraintModel...) {
        for m in ms {
            models.append(m)
        }
    }
    
    func equalTo(ms : ELModelEquatableType...) -> ELLayoutCombinationConstraintModel {
        assert(ms.count == models.count, "passed [ELModelEquatableType] count should be equal to your attributes count")
        for index in 0..<models.count {
            let model = models[index]
            model.equalTo(ms[index])
        }
        return self
    }    
    
    func greaterThanOrEqualTo(ms : ELModelEquatableType...) -> ELLayoutCombinationConstraintModel {
        assert(ms.count == models.count, "passed [ELModelEquatableType] count should be equal to your attributes count")
        for index in 0..<models.count {
            let model = models[index]
            model.equalTo(ms[index])
        }
        return self
    }
    
    func lessThanOrEqualTo(ms : [ELModelEquatableType]) -> ELLayoutCombinationConstraintModel {
        assert(ms.count == models.count, "passed [ELModelEquatableType] count should be equal to your attributes count")
        for index in 0..<models.count {
            let model = models[index]
            model.equalTo(ms[index])
        }
        return self
    }
    
    func mutipliers(ms : CGFloat...) -> ELLayoutCombinationConstraintModel {
        assert(ms.count == models.count, "passed [ELModelEquatableType] count should be equal to your attributes count")
        for index in 0..<models.count {
            let model = models[index]
            model.mutiplier(ms[index])
        }
        return self
    }
    
    func prioritys(ps : UILayoutPriority...) -> ELLayoutCombinationConstraintModel {
        assert(ps.count == models.count, "passed [ELModelEquatableType] count should be equal to your attributes count")
        for index in 0..<models.count {
            let model = models[index]
            model.priority(ps[index])
        }
        return self
    }
    
    func constants(cs : CGFloat...) -> ELLayoutCombinationConstraintModel {
        assert(cs.count == models.count, "passed [ELModelEquatableType] count should be equal to your attributes count")
        for index in 0..<models.count {
            let model = models[index]
            model.constant(cs[index])
        }
        return self
    }

}