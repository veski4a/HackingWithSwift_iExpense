//
//  AddView.swift
//  iExpense
//
//  Created by Veselin Stefanov on 13.10.20.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var expenses: Expenses
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = ""
    @State private var showingWrongAmountAlert = false
    
    static let types = ["Business", "Personal"]
    
    var body: some View {
        NavigationView{
            Form{
                TextField("Name", text: $name)
                
                Picker("Type", selection: $type){
                    ForEach(Self.types, id: \.self){
                        Text($0)
                    }
                }
                
                TextField("Amount", text: $amount)
                    .keyboardType(.decimalPad)
            }
            .navigationBarTitle("Add new expense")
            .navigationBarItems(trailing: Button("Save"){
                if let actualAmount = Int(amount){
                    let item = ExpenseItem(name: name, type: type, amount: actualAmount)
                    self.expenses.items.append(item)
                    presentationMode.wrappedValue.dismiss()
                }
                else{
                    showingWrongAmountAlert = true
                }
            })
            .alert(isPresented: $showingWrongAmountAlert){
                Alert(title: Text("Incorrect amount"), message: Text("\(amount) is not a number"), dismissButton: .default(Text("OK")){
                    amount = ""
                })
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
