// Copyright (c) Facebook, Inc. and its affiliates.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

import Foundation

extension ConfigurationWebpImageHint: AlertOptions {
  // MARK: AlertOptions

  var title: String {
    switch self {
    case .default:
      return NSLocalizedString("Default", comment: "Webp image hint title")
    case .photo:
      return NSLocalizedString("Photo", comment: "Webp image hint title")
    case .picture:
      return NSLocalizedString("Picture", comment: "Webp image hint title")
    case .graph:
      return NSLocalizedString("Graph", comment: "Webp image hint title")
    }
  }

  var isAvailable: Bool {
    return true
  }

  static var allValues: [ConfigurationWebpImageHint] = [.default, .photo, .picture, .graph]
}

extension ConfigurationViewModel {
  enum DefaultBackgroundColor: AlertOptions {
    case black
    case white
    case blue
    case red
    case green

    var color: UIColor {
      switch self {
      case .black:
        return .black
      case .white:
        return .white
      case .blue:
        return .blue
      case .red:
        return .red
      case .green:
        return .green
      }
    }

    init(color: UIColor) {
      var components: (red: CGFloat, green: CGFloat, blue: CGFloat) = (0, 0, 0)
      color.getRed(&components.red, green: &components.green, blue: &components.blue, alpha: nil)

      switch components {
      case (0, 0, 0): self = .black
      case (1, 1, 1): self = .white
      case (1, 0, 0): self = .red
      case (0, 1, 0): self = .green
      case (0, 0, 1): self = .blue
      default: self = .white
      }
    }

    // MARK: AlertOptions

    var title: String {
      switch self {
      case .black:
        return NSLocalizedString("Black", comment: "Default background color title")
      case .white:
        return NSLocalizedString("White", comment: "Default background color title")
      case .red:
        return NSLocalizedString("Red", comment: "Default background color title")
      case .green:
        return NSLocalizedString("Green", comment: "Default background color title")
      case .blue:
        return NSLocalizedString("Blue", comment: "Default background color title")
      }
    }

    var isAvailable: Bool {
      return true
    }

    static var allValues: [DefaultBackgroundColor] = [.black, .white, .blue, .red, .green]
  }

  enum WebpMethod: Int, AlertOptions {
    case one = 1
    case two = 2
    case three = 3
    case four = 4
    case five = 5
    case six = 6

    // MARK: AlertOptions

    var title: String {
      return "\(self.rawValue)"
    }

    var isAvailable: Bool {
      return true
    }

    static var allValues: [WebpMethod] = [.one, .two, .three, .four, .five, .six]
  }
}
