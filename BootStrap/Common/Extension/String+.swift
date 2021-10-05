//
//  String+.swift
//
//

import Foundation

extension String {
    func trimTrailingWhitespace() -> String {
        if let trailingWs = self.range(of: "\\s+$", options: .regularExpression) {
            return self.replacingCharacters(in: trailingWs, with: "")
        } else {
            return self
        }
    }
}

public extension String {
    var toURL: URL? {
        return URL(string: self)
    }
}
