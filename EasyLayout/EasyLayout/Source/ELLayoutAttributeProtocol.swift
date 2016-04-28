//
//  ELLayoutAttributeProtocol.swift
//  EasyLayout
//
//  Created by AugustRush on 4/28/16.
//  Copyright © 2016 August. All rights reserved.
//

import UIKit

protocol ELLayoutAttributeProtocol {
    var ELLeft : ELLayoutConstraintModel { get }
    var ELRight : ELLayoutConstraintModel { get }
    var ELTop : ELLayoutConstraintModel { get }
    var ELBottom : ELLayoutConstraintModel { get }
}
