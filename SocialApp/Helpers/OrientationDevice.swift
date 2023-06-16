//
//  OrientationDevice.swift
//  SocialApp
//
//  Created by Олеся on 16.06.2023.
//

import Foundation
import UIKit

enum Orientation {
    static var isLandscape: Bool {
        UIScreen.main.bounds.width > UIScreen.main.bounds.height
    }
}
