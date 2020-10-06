//
//  ContentView.swift
//  iExpense
//
//  Created by Veselin Stefanov on 6.10.20.
//

import SwiftUI

struct SecondView: View{
    @Environment(\.presentationMode) private var presentationMode
    
    var body: some View{
        Button("Dismiss"){
            presentationMode.wrappedValue.dismiss()
        }
    }
}

struct ContentView: View {
    @State private var showingSheet = false
    
    var body: some View {
        Button("Show sheet"){
            showingSheet.toggle()
        }
        .sheet(isPresented: $showingSheet){
            SecondView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
