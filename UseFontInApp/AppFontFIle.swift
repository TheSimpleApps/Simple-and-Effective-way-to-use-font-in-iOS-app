//
//  AppFontFIle.swift
//  UseFontInApp
//
//  Created by Karamjeet Singh on 24/04/18.
//  Copyright © 2018 TheSimpleApps@gmail.com. All rights reserved.
//

import Foundation
import UIKit

// Usage Examples

let system12              = Font(.system, size: .standard(.h5)).instance
let robotoThin20          = Font(.installed(.RobotoThin), size: .standard(.h1)).instance
let robotoBlack14         = Font(.installed(.RobotoBlack), size: .standard(.h4)).instance
let helveticaLight13      = Font(.custom("GillSans-Italic"), size: .custom(13.0)).instance
let monoSpacedDigit       = Font(.monoSpacedDigit(size: 25,weight: 50), size: .standard(.h1)).instance
let DomotikaTrialHeavy16  = Font(.installed(.DomotikaTrialHeavy), size: .standard(.h5)).instance
let BubblerOne18          = Font(.installed(.BubblerOne), size: .standard(.h2)).instance


struct Font {
    
    enum FontType {
        case installed(FontName)
        case custom(String)
        case system
        case systemBold
        case systemItatic
        case systemWeighted(weight: Double)
        case monoSpacedDigit(size: Double, weight: Double)
    }
    enum FontSize {
        case standard(StandardSize)
        case custom(Double)
        var value: Double {
            switch self {
            case .standard(let size):
                return size.rawValue
            case .custom(let customSize):
                return customSize
            }
        }
    }
    enum FontName: String {
        case RobotoBlack            = "Roboto-Black"
        case RobotoBlackItalic      = "Roboto-BlackItalic"
        case RobotoBold             = "Roboto-Bold"
        case RobotoBoldItalic       = "Roboto-BoldItalic"
        case RobotoItalic           = "Roboto-Italic"
        case RobotoLight            = "Roboto_Light"
        case RobotoLightItalic      = "Roboto-LightItalic"
        case RobotoMedium           = "Roboto-Medium"
        case RobotoMediumItalic     = "Roboto-MediumItalic"
        case RobotoRegular          = "Roboto-Regular"
        case RobotoThin             = "Roboto-Thin"
        case RobotoThinItalic       = "Roboto-ThinItalic"
        
        case BubblerOne             = "BubblerOne"
    
       case DomotikaTrialHeavy                  =  "DomotikaTrial-Heavy"
       case DomotikaTrialLightItalic            =  "DomotikaTrial-LightItalic"
       case DomotikaTrialBold                   =  "DomotikaTrial-Bold"
       case DomotikaTrialExtraLightItalic       =  "DomotikaTrial-ExtraLightItalic"
       case DomotikaTrialBlackItalic            =  "DomotikaTrial-BlackItalic"
       case DomotikaTrialThin                   =  "DomotikaTrial-Thin"
       case DomotikaTrialMedium                 =  "DomotikaTrial-Medium"
       case DomotikaTrialBlack                  =  "DomotikaTrial-Black"
       case DomotikaTrialBoldItalic             =  "DomotikaTrial-BoldItalic"
       case DomotikaTrialItalic                 =  "DomotikaTrial-Italic"
       case DomotikaTrialHeavyItalic            =  "DomotikaTrial-HeavyItalic"
       case DomotikaTrialMediumItalic           =  "DomotikaTrial-MediumItalic"
       case DomotikaTrialThinItalic             =  "DomotikaTrial-ThinItalic"
       case DomotikaTrialExtraLight             =  "DomotikaTrial-ExtraLight"
       case DomotikaTrialLight                  =  "DomotikaTrial-Light"
       case DomotikaTrialRegular                =  "DomotikaTrial-Regular"
    }
    enum StandardSize: Double {
        case h1 = 20.0
        case h2 = 18.0
        case h3 = 16.0
        case h4 = 14.0
        case h5 = 12.0
        case h6 = 10.0
    }
    
    
    var type: FontType
    var size: FontSize
    init(_ type: FontType, size: FontSize) {
        self.type = type
        self.size = size
    }
}

extension Font {
    
    var instance: UIFont {
        
        var instanceFont: UIFont!
        switch type {
        case .custom(let fontName):
            guard let font =  UIFont(name: fontName, size: CGFloat(size.value)) else {
                fatalError("\(fontName) font is not installed, make sure it added in Info.plist and logged with Utility.logAllAvailableFonts()")
            }
            instanceFont = font
        case .installed(let fontName):
            guard let font =  UIFont(name: fontName.rawValue, size: CGFloat(size.value)) else {
                fatalError("\(fontName.rawValue) font is not installed, make sure it added in Info.plist and logged with Utility.logAllAvailableFonts()")
            }
            instanceFont = font
        case .system:
            instanceFont = UIFont.systemFont(ofSize: CGFloat(size.value))
        case .systemBold:
            instanceFont = UIFont.boldSystemFont(ofSize: CGFloat(size.value))
        case .systemItatic:
            instanceFont = UIFont.italicSystemFont(ofSize: CGFloat(size.value))
        case .systemWeighted(let weight):
            instanceFont = UIFont.systemFont(ofSize: CGFloat(size.value),
                                             weight: UIFont.Weight(rawValue: CGFloat(weight)))
        case .monoSpacedDigit(let size, let weight):
            instanceFont = UIFont.monospacedDigitSystemFont(ofSize: CGFloat(size),
                                                            weight: UIFont.Weight(rawValue: CGFloat(weight)))
        }
        return instanceFont
    }
}

class Utility {
    /// Logs all available fonts from iOS SDK and installed custom font
    class func logAllAvailableFonts() {
        for family in UIFont.familyNames {
            print("\(family)")
            for name in UIFont.fontNames(forFamilyName: family) {
                print("   \(name)")
            }
        }
    }
}
