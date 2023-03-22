//
//  ContentView.swift
//  Typst
//
//  Created by Aleks Rutins on 3/22/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            Text(String(add(left: 4, right: 5)))
            Text(String(mul(left: 16, right: 4)))
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
