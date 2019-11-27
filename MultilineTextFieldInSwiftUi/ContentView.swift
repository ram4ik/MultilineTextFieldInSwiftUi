//
//  ContentView.swift
//  MultilineTextFieldInSwiftUi
//
//  Created by ramil on 27.11.2019.
//  Copyright © 2019 com.ri. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var txt = ""
    var body: some View {
        VStack(spacing: 15) {
            MultiLineTF(txt: $txt)
                .border(Color.gray.opacity(0.5), width: 1)
            Button(action: {
                print(self.txt)
            }) {
                Text("Print Text").padding()
            }.background(Color.blue)
            .foregroundColor(.white)
            .clipShape(Capsule())
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct MultiLineTF: UIViewRepresentable {
    
    @Binding var txt: String
    
    func makeCoordinator() -> MultiLineTF.Coordinator {
        return MultiLineTF.Coordinator(parent1: self)
    }
    
    func makeUIView(context: UIViewRepresentableContext<MultiLineTF>) -> UITextView {
        let tview = UITextView()
        tview.isEditable = true
        tview.isUserInteractionEnabled = true
        tview.isScrollEnabled = true
        tview.text = "Type Something"
        tview.textColor = .gray
        tview.font = .systemFont(ofSize: 20)
        tview.delegate = context.coordinator
        return tview
    }
    
    func updateUIView(_ uiView: UITextView, context: UIViewRepresentableContext<MultiLineTF>) {
        
    }
    
    class Coordinator: NSObject, UITextViewDelegate {
        
        var parent: MultiLineTF
        
        init(parent1: MultiLineTF) {
            parent = parent1
        }
        
        func textViewDidChange(_ textView: UITextView) {
            self.parent.txt = textView.text
        }
        
        func textViewDidBeginEditing(_ textView: UITextView) {
            textView.text = ""
            // for dark mode, using as text color...
            textView.textColor = .label
        }
    }
}
