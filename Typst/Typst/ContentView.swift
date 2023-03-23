//
//  ContentView.swift
//  Typst
//
//  Created by Aleks Rutins on 3/22/23.
//

import SwiftUI

struct ContentView: View {
    @State private var code: String = "Hello World!"
    var pdfData: Data {
        let result = compile_str(code: code)
        return Data(bytes: result.data, count: result.size)
    }
    var body: some View {
        HStack {
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
