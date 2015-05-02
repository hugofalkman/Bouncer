//
//  AppDelegate.swift
//  Bouncer
//
//  Created by H Hugo Falkman on 2015-05-02.
//  Copyright (c) 2015 H Hugo Fakman. All rights reserved.
//

import UIKit
import CoreMotion


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    struct Motion {
        static let Manager = CMMotionManager()
    }

}

