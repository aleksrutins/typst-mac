//
//  ContentView.swift
//  Typst
//
//  Created by Aleks Rutins on 3/22/23.
//

import SwiftUI
private var renderPDF: Task? = Task {
}
struct ContentView: View {
    @State private var code: String = "Hello World!"
    @State private var pdfData: Data = Data()
    var body: some View {
        HStack {
            TextEditor(text: $code)
                .font(.body.monospaced())
                .padding()
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 6))
                .shadow(radius: 2)
                .task {
                    renderPDF = Task {
                        let result = compile_str(code: code)
                        print(Data(bytes: result.data, count: result.size))
                        pdfData = Data(bytes: result.data, count: result.size)
                    }
                }
                .onChange(of: code) { newCode in
                    renderPDF?.cancel()
                    renderPDF = Task {
                        let result = compile_str(code: newCode)
                        print(Data(bytes: result.data, count: result.size))
                        pdfData = Data(bytes: result.data, count: result.size)
                    }
                }
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
