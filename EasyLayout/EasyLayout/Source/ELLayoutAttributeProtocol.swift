//
//  ELLayoutAttributeProtocol.swift
//  EasyLayout
//
//  Created by AugustRush on 4/28/16.
//  Copyright © 2016 August. All rights reserved.
//

import UIKit

protocol ELLayoutAttributeProtocol {
    var ELLeft : ELConstraintItem { get }
    var ELRight : ELConstraintItem { get }
    var ELTop : ELConstraintItem { get }
    var ELBottom : ELConstraintItem { get }
}
