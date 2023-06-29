//
//  Category.swift
//  DoughRiseChallenge
//
//  Created by Andres Pulgarin on 6/28/23.
//

import Foundation

struct Category: Identifiable, Hashable {
    var id = UUID()
    var title: String
    var icon: String
    var color: String
    var totalAmount: Double
    var totalLeft: Double
    var totalSpent: Double
    
    
    
    
    //sample categories
    static func getTestCategory() -> [Category] {
        var categories = [Category]()
        
        categories.append(Category(title: "Food", icon: "ic-food", color: "BlueFood", totalAmount: 100, totalLeft: 80, totalSpent: 20))
        categories.append(Category(title: "Shopping", icon: "ic-shopping", color: "BlueShopping", totalAmount: 1000, totalLeft: 100,totalSpent: 900))
        categories.append(Category(title: "Transportation", icon: "ic-transportation", color: "YellowTransport", totalAmount: 100, totalLeft: 0, totalSpent: 100))
        categories.append(Category(title: "Education", icon: "ic-education", color: "BlueEducation", totalAmount: 250, totalLeft: 100, totalSpent: 150))
        return categories
    }
}
struct Budget{
    var title: String
    var totalAmount: Double
    var totalLeft: Double
    var totalSpent: Double
    
    //sample budget
    static func getTestBudget() -> Budget {
        let categories = Category.getTestCategory()
        let totalSpent = categories.reduce(0) { $0 + $1.totalSpent }
        let totalAmount = 2000.0
        let totalLeft = totalAmount - totalSpent
        let testBudget = Budget(title: "Monthly Budget", totalAmount: totalAmount, totalLeft: totalLeft, totalSpent: totalSpent)
        return testBudget
    }
}

