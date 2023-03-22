//
//  ExpenceItem.swift
//  iExpense
//
//  Created by Jan Stusio on 11/03/2023.
//

import Foundation

struct ExpenseItem: Codable, Hashable, Identifiable{
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
