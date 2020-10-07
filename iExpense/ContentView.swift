//
//  ContentView.swift
//  iExpense
//
//  Created by Veselin Stefanov on 6.10.20.
//

import SwiftUI

struct ExpenseItem {
    let name: String
    let type: String
    let amount: Int
}

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]()
}

struct ContentView: View {
    @ObservedObject var expenses = Expenses()
    
    var body: some View {
        NavigationView{
            List{
                ForEach(expenses.items, id: \.name){ item in
                    Text(item.name)
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("iExpenses")
            .navigationBarItems(trailing: Button(action:{
                let expense = ExpenseItem(name: "Test", type: "Personal", amount: 5)
                expenses.items.append(expense)
            }){
                Image(systemName: "plus")
            })
        }
    }
    
    private func removeItems(at offsets: IndexSet){
        expenses.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
