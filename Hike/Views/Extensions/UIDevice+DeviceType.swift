//
//  UIDevice+DeviceType.swift
//  Features
//
//  Created by Manuel Cubillo on 1/25/19.
//  Copyright © 2019 Manuel Cubillo. All rights reserved.
//

import UIKit

extension UIDevice {
    enum DeviceType {
        case iPhone5SSE, iPhone66S78, iPhone6P6SP7P8P, iPhoneXR, iPhoneXXS, iPhoneXSMax, Unknown
    }
    
    var device: UIDevice.DeviceType {
        get {
            if self.userInterfaceIdiom == .phone {
                switch UIScreen.main.nativeBounds.height {
                    case 1136.0:
                        return .iPhone5SSE
                    case 1334:
                        return .iPhone66S78
                    case 2208:
                        return .iPhone6P6SP7P8P
                    case 1792.0:
                        return .iPhoneXR
                    case 2436:
                        return .iPhoneXXS
                    case 2688.0:
                        return .iPhoneXSMax
                    default:
                        return .Unknown
                }
            }
            
            return .Unknown
        }
    }
}
