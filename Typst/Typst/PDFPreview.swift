//
//  PDFPreview.swift
//  Typst
//
//  Created by Aleks Rutins on 3/23/23.
//

import Foundation
import SwiftUI
import PDFKit

struct PDFPreview : NSViewRepresentable {
    @Binding var data: Data
    
    func makeNSView(context: Context) -> PDFView {
        return PDFView()
    }
    
    func updateNSView(_ nsView: PDFView, context: Context) {
        nsView.document = PDFDocument(data: data)
    }
}
