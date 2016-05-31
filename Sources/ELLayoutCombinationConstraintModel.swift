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

public class ELLayoutCombinationConstraintModel {
    private var models : [ELLayoutConstraintModel] = Array()
    private var modelsDict : [NSLayoutAttribute : WeakContainer<ELLayoutConstraintModel>] = Dictionary()
    
    init(ms : ELLayoutConstraintModel...) {
        for m in ms {
            models.append(m)
            modelsDict[m.attribute] = WeakContainer(v : m)
        }
    }
    
    init(ms : [ELLayoutConstraintModel]) {
        for m in ms {
            models.append(m)
            modelsDict[m.attribute] = WeakContainer(v : m)
        }
    }
    
    public func equalTo(ms : ELModelEquatableType...) -> ELLayoutCombinationConstraintModel {
        for index in 0..<models.count {
            let model = models[index]
            let equatable = index < ms.count ? ms[index] : ms[0]
            model.equalTo(equatable)
        }
        return self
    }    
    
    public func greaterThanOrEqualTo(ms : ELModelEquatableType...) -> ELLayoutCombinationConstraintModel {
        for index in 0..<models.count {
            let model = models[index]
            let equatable = index < ms.count ? ms[index] : ms[0]
            model.equalTo(equatable)
        }
        return self
    }
    
    public func lessThanOrEqualTo(ms : ELModelEquatableType...) -> ELLayoutCombinationConstraintModel {
        for index in 0..<models.count {
            let model = models[index]
            let equatable = index < ms.count ? ms[index] : ms[0]
            model.equalTo(equatable)
        }
        return self
    }
    
    func mutipliers(ms : CGFloat...) -> ELLayoutCombinationConstraintModel {
        for index in 0..<models.count {
            let model = models[index]
            let mutiplier = index < ms.count ? ms[index] : ms[0]
            model.mutiplier(mutiplier)
        }
        return self
    }
    
    func mutipliers(m : CGFloat) -> ELLayoutCombinationConstraintModel {
        for index in 0..<models.count {
            let model = models[index]
            model.mutiplier(m)
        }
        return self
    }
    
    func prioritys(ps : UILayoutPriority...) -> ELLayoutCombinationConstraintModel {
        for index in 0..<models.count {
            let model = models[index]
            let priority = index < ps.count ? ps[index] : ps[0]
            model.priority(priority)
        }
        return self
    }
    
    func prioritys(p : UILayoutPriority) -> ELLayoutCombinationConstraintModel {
        for index in 0..<models.count {
            let model = models[index]
            model.priority(p)
        }
        return self
    }
    
    func constants(cs : CGFloat...) -> ELLayoutCombinationConstraintModel {
        for index in 0..<models.count {
            let model = models[index]
            let constant = index < cs.count ? cs[index] : cs[0]
            model.constant(constant)
        }
        return self
    }
    
    func constants(c : CGFloat) -> ELLayoutCombinationConstraintModel {
        for index in 0..<models.count {
            let model = models[index]
            model.constant(c)
        }
        return self
    }
    
    func constraint(attribute : NSLayoutAttribute) -> NSLayoutConstraint? {
        let model = modelsDict[attribute]?.value as ELLayoutConstraintModel?
        return model?.constraint()
    }
}

private class WeakContainer<T : AnyObject> {
    weak var value : T?
    init(v : T) {
        value = v
    }
}
