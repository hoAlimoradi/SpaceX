//
//  extension+UIColor.swift
//  SpaceX
//
//  Created by ho on 4/8/1403 AP.
//

import Foundation
import UIKit

extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        let scanner = Scanner(string: hex)
        scanner.scanLocation = 0
        
        var rgbValue: UInt64 = 0
        
        scanner.scanHexInt64(&rgbValue)
        
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        
        self.init(
            red: CGFloat(r) / 0xff,
            green: CGFloat(g) / 0xff,
            blue: CGFloat(b) / 0xff, alpha: alpha
        )
    }
}


extension UIColor {
    convenience init(hex: String) {
        let scanner = Scanner(string: hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines))
        if hex.hasPrefix("#") {
            scanner.currentIndex = scanner.string.index(after: scanner.string.startIndex)
        }

        var color: UInt64 = 0

        scanner.scanHexInt64(&color)

        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask

        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0

        self.init(red: red, green: green, blue: blue, alpha: 1)
    }

        /// Generates a pair of matching and aesthetically pleasing colors for a gradient.
        static func generateGradientColors() -> [UIColor] {
            // Base hue for the first color
            let baseHue: CGFloat = CGFloat(arc4random_uniform(256)) / 255.0
            
            // Create a range to ensure the second color is close to the first on the color wheel
            let hueRange: CGFloat = 0.1 // Adjust this for more or less variation
            
            // Ensure the second hue is within 0 to 1 after adjustment
            let secondHue = (baseHue + hueRange).truncatingRemainder(dividingBy: 1.0)
            
            // Define saturation and brightness to ensure the colors are vibrant and aesthetically pleasing
            let saturation: CGFloat = 0.5 + CGFloat(arc4random_uniform(50)) / 100.0 // Range: 0.5 to 1.0
            let brightness: CGFloat = 0.85 + CGFloat(arc4random_uniform(30)) / 100.0 // Range: 0.85 to 1.15, capped at 1.0
            
            // Generate the two colors
            let color1 = UIColor(hue: baseHue, saturation: saturation, brightness: brightness, alpha: 1.0)
            let color2 = UIColor(hue: secondHue, saturation: saturation, brightness: brightness, alpha: 1.0)
            
            return [color1, color2]
        }
  
}
 

// MARK: CustomPopup
extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}
