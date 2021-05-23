// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "ColorAsset.Color", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetColorTypeAlias = ColorAsset.Color
@available(*, deprecated, renamed: "ImageAsset.Image", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetImageTypeAlias = ImageAsset.Image

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
internal enum Asset {
  internal static let _1 = ImageAsset(name: "1")
  internal static let _10 = ImageAsset(name: "10")
  internal static let _11 = ImageAsset(name: "11")
  internal static let _111 = ImageAsset(name: "111")
  internal static let _112 = ImageAsset(name: "112")
  internal static let _113 = ImageAsset(name: "113")
  internal static let _12 = ImageAsset(name: "12")
  internal static let _13 = ImageAsset(name: "13")
  internal static let _14 = ImageAsset(name: "14")
  internal static let _15 = ImageAsset(name: "15")
  internal static let _16 = ImageAsset(name: "16")
  internal static let _17 = ImageAsset(name: "17")
  internal static let _18 = ImageAsset(name: "18")
  internal static let _19 = ImageAsset(name: "19")
  internal static let _2 = ImageAsset(name: "2")
  internal static let _20 = ImageAsset(name: "20")
  internal static let _21 = ImageAsset(name: "21")
  internal static let _22 = ImageAsset(name: "22")
  internal static let _23 = ImageAsset(name: "23")
  internal static let _24 = ImageAsset(name: "24")
  internal static let _3 = ImageAsset(name: "3")
  internal static let _4 = ImageAsset(name: "4")
  internal static let _5 = ImageAsset(name: "5")
  internal static let _6 = ImageAsset(name: "6")
  internal static let _7 = ImageAsset(name: "7")
  internal static let _8 = ImageAsset(name: "8")
  internal static let _9 = ImageAsset(name: "9")
  internal static let arrowRightIcon = ImageAsset(name: "arrowRightIcon")
  internal static let back = ImageAsset(name: "back")
  internal static let cross = ImageAsset(name: "cross")
  internal static let crossBlack = ImageAsset(name: "cross_black")
  internal static let failure = ImageAsset(name: "failure")
  internal static let favorite = ImageAsset(name: "favorite")
  internal static let logo = ImageAsset(name: "logo")
  internal static let seach = ImageAsset(name: "seach")
  internal static let settingsIcon = ImageAsset(name: "settings_icon")
  internal static let sherlock = ImageAsset(name: "sherlock")
  internal static let success = ImageAsset(name: "success")
  internal static let tabbarFavorite = ImageAsset(name: "tabbarFavorite")
  internal static let tabbarGenre = ImageAsset(name: "tabbarGenre")
  internal static let tabbarHome = ImageAsset(name: "tabbarHome")
  internal static let tabbarProfile = ImageAsset(name: "tabbarProfile")
  internal static let ticket = ImageAsset(name: "ticket")
  internal static let visibilityOff = ImageAsset(name: "visibility_off")
  internal static let visibilityOn = ImageAsset(name: "visibility_on")
  internal static let weatherBackground = ImageAsset(name: "weatherBackground")
  internal static let weatherColor = ColorAsset(name: "weatherColor")
  internal static let weatherImage = ImageAsset(name: "weatherImage")
  internal static let onboarding1 = ImageAsset(name: "onboarding_1")
  internal static let onboarding2 = ImageAsset(name: "onboarding_2")
  internal static let onboarding3 = ImageAsset(name: "onboarding_3")
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

internal final class ColorAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Color = NSColor
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Color = UIColor
  #endif

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  internal private(set) lazy var color: Color = {
    guard let color = Color(asset: self) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }()

  fileprivate init(name: String) {
    self.name = name
  }
}

internal extension ColorAsset.Color {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  convenience init?(asset: ColorAsset) {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

internal struct ImageAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Image = UIImage
  #endif

  internal var image: Image {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    let name = NSImage.Name(self.name)
    let image = (bundle == .main) ? NSImage(named: name) : bundle.image(forResource: name)
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }
}

internal extension ImageAsset.Image {
  @available(macOS, deprecated,
    message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
  convenience init?(asset: ImageAsset) {
    #if os(iOS) || os(tvOS)
    let bundle = BundleToken.bundle
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
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
