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
    
    @discardableResult
    public func equalTo(_ ms : ELModelEquatableType...) -> ELLayoutCombinationConstraintModel {
        for index in 0..<models.count {
            let model = models[index]
            let equatable = index < ms.count ? ms[index] : ms[0]
            model.equalTo(equatable)
        }
        return self
    }    
    
    @discardableResult
    public func greaterThanOrEqualTo(_ ms : ELModelEquatableType...) -> ELLayoutCombinationConstraintModel {
        for index in 0..<models.count {
            let model = models[index]
            let equatable = index < ms.count ? ms[index] : ms[0]
            model.equalTo(equatable)
        }
        return self
    }
    
    @discardableResult
    public func lessThanOrEqualTo(_ ms : ELModelEquatableType...) -> ELLayoutCombinationConstraintModel {
        for index in 0..<models.count {
            let model = models[index]
            let equatable = index < ms.count ? ms[index] : ms[0]
            model.equalTo(equatable)
        }
        return self
    }
    
    @discardableResult
    func mutipliers(_ ms : CGFloat...) -> ELLayoutCombinationConstraintModel {
        for index in 0..<models.count {
            let model = models[index]
            let mutiplier = index < ms.count ? ms[index] : ms[0]
            model.mutiplier(mutiplier)
        }
        return self
    }
    
    @discardableResult
    func mutipliers(_ m : CGFloat) -> ELLayoutCombinationConstraintModel {
        for index in 0..<models.count {
            let model = models[index]
            model.mutiplier(m)
        }
        return self
    }
    
    @discardableResult
    func prioritys(_ ps : UILayoutPriority...) -> ELLayoutCombinationConstraintModel {
        for index in 0..<models.count {
            let model = models[index]
            let priority = index < ps.count ? ps[index] : ps[0]
            model.priority(priority)
        }
        return self
    }
    
    @discardableResult
    func prioritys(_ p : UILayoutPriority) -> ELLayoutCombinationConstraintModel {
        for index in 0..<models.count {
            let model = models[index]
            model.priority(p)
        }
        return self
    }
    
    @discardableResult
    func constants(_ cs : CGFloat...) -> ELLayoutCombinationConstraintModel {
        for index in 0..<models.count {
            let model = models[index]
            let constant = index < cs.count ? cs[index] : cs[0]
            model.constant(constant)
        }
        return self
    }
    
    @discardableResult
    func constants(_ c : CGFloat) -> ELLayoutCombinationConstraintModel {
        for index in 0..<models.count {
            let model = models[index]
            model.constant(c)
        }
        return self
    }
    
    @discardableResult
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
