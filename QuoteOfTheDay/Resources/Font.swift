//
// Created by Jakub Sowa on 24/03/2021.
//

import Foundation
import SwiftUI

extension Font {
    enum Charter {
        static func roman(size: CGFloat) -> Font {
            font(.roman, size: size)
        }

        static func italic(size: CGFloat) -> Font {
            font(.italic, size: size)
        }

        static func bold(size: CGFloat) -> Font {
            font(.bold, size: size)
        }

        private static func font(_ font: CharterFont, size: CGFloat) -> Font {
            .custom(font.rawValue, size: size)
        }
    }
}

private enum CharterFont: String {
    case roman = "Charter-Roman"
    case italic = "Charter-Italic"
    case bold = "Charter-Bold"
}