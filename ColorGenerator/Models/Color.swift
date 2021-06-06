//
//  Color.swift
//  ColorGenerator
//
//  Created by Anna Ostapenko on 06.06.21.
//

import Foundation
import UIKit

struct Color {
    var redValue: Float
    var greenValue: Float
    var blueValue: Float
    var alphaValue: Float
    
    var getColor: UIColor {
        UIColor(red: CGFloat(redValue) / 255, green: CGFloat(greenValue) / 255, blue: CGFloat(blueValue) / 255, alpha: CGFloat(alphaValue))
    }
}
