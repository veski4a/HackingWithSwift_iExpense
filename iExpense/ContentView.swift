//
//  ContentView.swift
//  iExpense
//
//  Created by Veselin Stefanov on 6.10.20.
//

import SwiftUI

struct ContentView: View {
    @State private var numbers = [Int]()
    @State private var currrentNumber = 1
    
    var body: some View {
        NavigationView{
            VStack{
                List{
                    ForEach(numbers, id: \.self){
                        Text("\($0)")
                    }
                    .onDelete(perform: removeRows)
                }
                
                Button("Add number"){
                    numbers.append(currrentNumber)
                    currrentNumber += 1
                }
            }
            .navigationBarItems(leading: EditButton())
        }
    }
    
    private func removeRows(at offset: IndexSet){
        numbers.remove(atOffsets: offset)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
