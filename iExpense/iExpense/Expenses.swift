//
//  Expenses.swift
//  iExpense
//
//  Created by Jan Stusio on 11/03/2023.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]() {
        didSet {
            let encoder = JSONEncoder()
            
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    @Published var itemsPriv = [ExpenseItem]() {
        didSet {
            let encoder = JSONEncoder()
            
            if let encodedPriv = try? encoder.encode(items) {
                UserDefaults.standard.set(encodedPriv, forKey: "ItemsPriv")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        
        items = []
        
        if let savedItemsPriv = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItemsPriv = try? JSONDecoder().decode([ExpenseItem].self, from: savedItemsPriv) {
                itemsPriv = decodedItemsPriv
                return
            }
        }
        
        itemsPriv = []
    }
}
