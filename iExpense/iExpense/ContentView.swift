//
//  ContentView.swift
//  iExpense
//
//  Created by Jan Stusio on 11/03/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationStack {
            List {
                Section("Personal expenses"){
                    ForEach(expenses.itemsPriv) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                            }
                            
                            Spacer()
                            
                            Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "PLN"))
                                .foregroundColor(item.amount < 10 ? .yellow : (item.amount > 100 ? .red : .black))
                        }
                    }
                    .onDelete(perform: removeItemsPriv) // exists only dor dorEach
                }
                
                Section("Business expenses"){
                    ForEach(expenses.items) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                            }
                            
                            Spacer()
                            
                            Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "PLN"))
                                .foregroundColor(item.amount < 10 ? .yellow : (item.amount > 100 ? .red : .black))
                        }
                    }
                    .onDelete(perform: removeItems) // exists only dor dorEach
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)// IndexSet is a sorted set of integers
    }
    func removeItemsPriv(at offsets: IndexSet) {
        expenses.itemsPriv.remove(atOffsets: offsets)// IndexSet is a sorted set of integers
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
