//
//  Extensions.swift
//  Emoji Art
//
//  Created by Taylor Zeller on 4/22/24.
//

import SwiftUI

typealias CGOffest = CGSize

extension String {
    var uniqued: String {
        reduce(into: "") { sofar, element in
            if !sofar.contains(element) {
                sofar.append(element)
            }
        }
    }
}
