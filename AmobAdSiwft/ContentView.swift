//
//  ContentView.swift
//  AmobAdSiwft
//
//  Created by Carlos Henrique Pereira do Carmo on 17/12/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NativeAdCardViewControllerWrapper()
            .frame(height: 300)
            .padding(10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NativeAdCardViewControllerWrapper()
    }
}
