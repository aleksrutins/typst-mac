//
//  ContentView.swift
//  Typst
//
//  Created by Aleks Rutins on 3/22/23.
//

import SwiftUI

struct ContentView: View {
    @State private var code: String = "Hello World!" {
        didSet {
            let result = compile_str(code: code)
            pdfData = Data(bytes: result.data, count: result.size)
        }
    }
    @State private var pdfData: Data = Data()
    var body: some View {
        HStack {
            TextEditor(text: $code)
                .font(.body.monospaced())
                .padding()
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 6))
                .shadow(radius: 2)
            PDFPreview(data: $pdfData).clipShape(RoundedRectangle(cornerRadius: 6)).shadow(radius: 2)
        }
        .padding()
        .background(.thinMaterial)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
