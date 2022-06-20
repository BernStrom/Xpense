//
//  ContentView.swift
//  Xpense
//
//  Created by Bern N on 6/20/22.
//

import SwiftUI

struct ExpenseItem {
    let name: String
    let type: String
    let amount: Double
}

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]()
}

struct ContentView: View {
    @StateObject var expenses = Expenses()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items, id: \.name) { item in
                    Text(item.name)
                }
                .onDelete(perform: removeItems)
            }
            .toolbar {
                Button {
                    let expense = ExpenseItem(name: "Test", type: "Personal", amount: 5)
                    expenses.items.append(expense)
                } label: {
                    Image(systemName: "plus")
                }
            }
            .navigationTitle("Xpense")
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
