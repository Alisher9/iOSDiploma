// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {

  internal enum Common {
    /// taboo
    internal static let app = L10n.tr("Localizable", "Common.App")
    /// Continue
    internal static let `continue` = L10n.tr("Localizable", "Common.Continue")
    /// Done
    internal static let done = L10n.tr("Localizable", "Common.Done")
    /// Error!
    internal static let error = L10n.tr("Localizable", "Common.Error")
    /// Failure!
    internal static let failure = L10n.tr("Localizable", "Common.Failure")
    /// Favorites
    internal static let favorite = L10n.tr("Localizable", "Common.Favorite")
    /// Genres
    internal static let genre = L10n.tr("Localizable", "Common.Genre")
    /// Home
    internal static let home = L10n.tr("Localizable", "Common.Home")
    /// Profile
    internal static let profile = L10n.tr("Localizable", "Common.Profile")
    /// Success!
    internal static let success = L10n.tr("Localizable", "Common.Success")
    /// Unauthorized
    internal static let unauthorized = L10n.tr("Localizable", "Common.Unauthorized")
  }

  internal enum GenrePicker {
    /// Adventure
    internal static let adventure = L10n.tr("Localizable", "GenrePicker.Adventure")
    /// Next
    internal static let button = L10n.tr("Localizable", "GenrePicker.Button")
    /// Comedy
    internal static let comedy = L10n.tr("Localizable", "GenrePicker.Comedy")
    /// Tap on genres you like. Hold to remove the genres you don't like
    internal static let description = L10n.tr("Localizable", "GenrePicker.Description")
    /// Detective
    internal static let detective = L10n.tr("Localizable", "GenrePicker.Detective")
    /// Drama
    internal static let drama = L10n.tr("Localizable", "GenrePicker.Drama")
    /// Family
    internal static let family = L10n.tr("Localizable", "GenrePicker.Family")
    /// Fiction
    internal static let fiction = L10n.tr("Localizable", "GenrePicker.Fiction")
    /// Fighters
    internal static let fighters = L10n.tr("Localizable", "GenrePicker.Fighters")
    /// Gothic
    internal static let gothic = L10n.tr("Localizable", "GenrePicker.Gothic")
    /// History
    internal static let history = L10n.tr("Localizable", "GenrePicker.History")
    /// Kids
    internal static let kids = L10n.tr("Localizable", "GenrePicker.Kids")
    /// Melodrama
    internal static let melodrama = L10n.tr("Localizable", "GenrePicker.Melodrama")
    /// Military
    internal static let military = L10n.tr("Localizable", "GenrePicker.Military")
    /// Musical
    internal static let musical = L10n.tr("Localizable", "GenrePicker.Musical")
    /// Mystic
    internal static let mystic = L10n.tr("Localizable", "GenrePicker.Mystic")
    /// Romantic
    internal static let romantic = L10n.tr("Localizable", "GenrePicker.Romantic")
    /// Sci-Fi
    internal static let sciFi = L10n.tr("Localizable", "GenrePicker.SciFi")
    /// Thriller
    internal static let thriller = L10n.tr("Localizable", "GenrePicker.Thriller")
    /// Discover new genres
    internal static let title = L10n.tr("Localizable", "GenrePicker.Title")
    /// Western
    internal static let western = L10n.tr("Localizable", "GenrePicker.Western")
  }

  internal enum Login {
    /// Login
    internal static let enter = L10n.tr("Localizable", "Login.Enter")
    /// Enter password
    internal static let enterPassword = L10n.tr("Localizable", "Login.EnterPassword")
    /// Enter phone number
    internal static let enterPhoneNumber = L10n.tr("Localizable", "Login.EnterPhoneNumber")
    /// Forget password?
    internal static let forgetPassword = L10n.tr("Localizable", "Login.ForgetPassword")
    /// No account yet?
    internal static let noAccount = L10n.tr("Localizable", "Login.NoAccount")
    /// Registration
    internal static let registration = L10n.tr("Localizable", "Login.Registration")
    /// Wrong credentials
    internal static let wrongCredentials = L10n.tr("Localizable", "Login.WrongCredentials")
  }

  internal enum Onboarding {
    /// Begin
    internal static let begin = L10n.tr("Localizable", "Onboarding.Begin")
    /// Looking for a movie longer than watching?
    internal static let description1 = L10n.tr("Localizable", "Onboarding.Description1")
    /// Recommended films of your favorite genres
    internal static let description2 = L10n.tr("Localizable", "Onboarding.Description2")
    /// Also update and share with loved ones
    internal static let description3 = L10n.tr("Localizable", "Onboarding.Description3")
    /// Next
    internal static let next = L10n.tr("Localizable", "Onboarding.Next")
    /// Save search time
    internal static let title1 = L10n.tr("Localizable", "Onboarding.Title1")
    /// We take into account your interests
    internal static let title2 = L10n.tr("Localizable", "Onboarding.Title2")
    /// Create your favorite movie list
    internal static let title3 = L10n.tr("Localizable", "Onboarding.Title3")
  }

  internal enum SignUp {
    /// Enter name
    internal static let enterName = L10n.tr("Localizable", "SignUp.EnterName")
    /// Enter password
    internal static let enterPassword = L10n.tr("Localizable", "SignUp.EnterPassword")
    /// Repeat password
    internal static let enterPasswordAgain = L10n.tr("Localizable", "SignUp.EnterPasswordAgain")
    /// Enter phone number
    internal static let enterPhoneNumber = L10n.tr("Localizable", "SignUp.EnterPhoneNumber")
    /// Enter surname
    internal static let enterSurname = L10n.tr("Localizable", "SignUp.EnterSurname")
    /// Enter credentials
    internal static let infoTitle = L10n.tr("Localizable", "SignUp.InfoTitle")
    /// Passwords does not match.
    internal static let passwordsDoesNotMatch = L10n.tr("Localizable", "SignUp.PasswordsDoesNotMatch")
    /// Phone number
    internal static let phoneNumber = L10n.tr("Localizable", "SignUp.PhoneNumber")
    /// Register
    internal static let register = L10n.tr("Localizable", "SignUp.Register")
    /// Registration
    internal static let registration = L10n.tr("Localizable", "SignUp.Registration")
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
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
