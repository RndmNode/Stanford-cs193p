//
//  PaletteManager.swift
//  Emoji Art
//
//  Created by Taylor Zeller on 5/19/24.
//

import SwiftUI

struct PaletteManager: View {
    let stores: [PaletteStore]
    
    var body: some View {
        NavigationSplitView {
            List(stores) { store in
                Text(store.name)
            }
        } detail: {
            Text("Choose a store")
        }
    }
}

//#Preview {
//    PaletteManager()
//}
