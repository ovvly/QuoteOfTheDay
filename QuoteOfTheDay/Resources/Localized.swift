// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {

  internal enum QuotesList {
    internal enum Settings {
      /// Kategoria: 
      internal static let categoryType = L10n.tr("Localizable", "QuotesList.Settings.categoryType")
      /// Widok: 
      internal static let viewType = L10n.tr("Localizable", "QuotesList.Settings.viewType")
      internal enum Category {
        /// -brak-
        internal static let `none` = L10n.tr("Localizable", "QuotesList.Settings.Category.none")
      }
      internal enum ViewType {
        /// Autor
        internal static let author = L10n.tr("Localizable", "QuotesList.Settings.ViewType.author")
        /// Cytat
        internal static let quote = L10n.tr("Localizable", "QuotesList.Settings.ViewType.quote")
      }
    }
  }

  internal enum Tabbar {
    internal enum Name {
      /// Lista
      internal static let list = L10n.tr("Localizable", "Tabbar.Name.list")
      /// Losowe
      internal static let random = L10n.tr("Localizable", "Tabbar.Name.random")
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle = Bundle(for: BundleToken.self)
}
// swiftlint:enable convenience_type
