//
//  HomeView.swift
//  DoughRiseChallenge
//
//  Created by Andres Pulgarin on 6/28/23.
//

import SwiftUI

struct HomeView: View {
    //Sample Categories and Arrays
    @State private var categories = Category.getTestCategory()
    @State private var budget = Budget.getTestBudget()
    //Add Transaction Button
    @State private var showAddTransactionMenu = false
    @State private var newTransactionAmount = 0.0
    @State private var newTransactionCategory = Category.getTestCategory()[0]
    var body: some View {
        ZStack{
            backgroundColor
            ScrollView{
                budgetOverview
            }
            
            addTransactionButton
                            .padding()
                            //bottom right
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
        }
        .toolbar{
            ToolbarItem(placement: .navigationBarLeading){
                budgetSelection
            }
            ToolbarItem(placement: .navigationBarTrailing){
                HStack {
                    Image("ic-share")
                    Image("ic-dots")
                }
            }
        }
        .sheet(isPresented: $showAddTransactionMenu) {
            transactionMenu
        }

    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

extension HomeView {
    //MARK: Components
    private var backgroundColor: some View {
        ZStack{
            Color("WhiteBackground")
                .edgesIgnoringSafeArea(.all)
            VStack{
                Color("PurpleTopBar")
                    .frame(height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                    .edgesIgnoringSafeArea(.top)
                Spacer()
            }
        }
    }
    private var budgetSelection: some View {
        //can implement onTapGesture in future here
        HStack{
            Text(budget.title)
                .font(.budgetTitle)
                .foregroundColor(.white)
            Image("ic-arrow")
        }
    }
    private var progressBar: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 300, height: 25)
                .foregroundColor(Color("GrayBar"))
            RoundedRectangle(cornerRadius: 10)
                .frame(width: CGFloat(budget.totalSpent / budget.totalAmount) * 300, height: 25)
                .foregroundColor(Color("PurpleButton"))
        }
    }
    private var addTransactionButton: some View {
        Button(action: {
            showAddTransactionMenu = true
        }) {
            Image("ic-addTransButton")
                .resizable()
                .frame(width: 56, height: 56)
        }
    }
    private var transactionMenu: some View {
        NavigationView {
            Form {
                Section(header: Text("Amount")) {
                    TextField("Amount", value: $newTransactionAmount, formatter: NumberFormatter())
                }
                Section(header: Text("Category")) {
                    Picker("Category", selection: $newTransactionCategory) {
                        ForEach(categories) { category in
                            Text(category.title).tag(category)
                        }
                    }
                }
                Button(action: {
                    showAddTransactionMenu = false
                    addTransaction(amount: newTransactionAmount, category: newTransactionCategory)
                }) {
                    Text("Add Transaction")
                }
            }
            .navigationTitle("Add Transaction")
        }
    }
    private var categorySummary: some View {
        ForEach(categories) {  category in
            VStack{
                HStack{
                    ZStack{
                        Circle()
                            .fill(Color(category.color))
                            .frame(width: 41, height: 41)
                        Image(category.icon)
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundColor(.green)
                    }
                    VStack(alignment: .leading) {
                        Text(category.title)
                            .font(.categoryTitle)
                        HStack{
                            Text("Spent")
                                .foregroundColor(Color("GrayText"))
                            Text("$\(category.totalSpent, specifier: "%.0f")")
                                .foregroundColor(Color("GreenMoney"))
                            Text("of $\(category.totalAmount, specifier: "%.0f")")
                                .foregroundColor(Color("GrayText"))
                        }
                        .font(.categorySubTitle)
                    }
                    Spacer()
                    VStack(alignment: .trailing) {
                        Text("$\(category.totalLeft, specifier: "%.0f")")
                            .font(.categoryValue)
                            .foregroundColor(Color("GreenMoney"))
                        Text("left")
                            .font(.categoryLeft)
                    }
                }
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 300, height: 10)
                        .foregroundColor(Color("GrayBar"))
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: CGFloat(category.totalSpent / category.totalAmount) * 300, height: 10)
                        .foregroundColor(Color(category.color))
                }
            }
        }
    }



    private var budgetOverview: some View {
        ZStack{
            Color(.white)
            VStack{
                Text("June 2023")
                    .font(.monthTitle)
                    .foregroundColor(Color("GreenMoney"))
                    .padding(5)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color("GreenMoney"))
                            .opacity(0.2)
                    )

                HStack{
                    VStack{
                        Text("Spent")
                            .font(.spentSubTitle)
                            .foregroundColor(Color("GrayText"))
                        Text("\(budget.totalSpent, specifier: "%.2f")")
                            .font(.spentValue)
                    }
                    Image("ic-verticalLine")
                    VStack{
                        Text("Available")
                            .font(.spentSubTitle)
                            .foregroundColor(Color("GrayText"))
                        Text("\(budget.totalLeft, specifier: "%.2f")")
                            .font(.availableValue)
                            .foregroundColor(Color("GreenMoney"))
                            
                    }
                    Image("ic-verticalLine")
                    VStack{
                        Text("Budget")
                            .font(.spentSubTitle)
                            .foregroundColor(Color("GrayText"))
                        Text("\(budget.totalAmount, specifier: "%.2f")")
                            .font(.spentValue)
                    }
                }
                progressBar
                categorySummary
                Spacer()
            }
            .padding()
        }
        .frame(width: 350, height: 550)
        .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
        .padding(.top, 15)
    }
//MARK: Functions
    private func addTransaction(amount: Double, category: Category) {
        // Match the index of selected category in the categories
        if let index = categories.firstIndex(where: { $0.id == category.id }) {
            // Update the totalSpent and totalLeft properties of the category
            categories[index].totalSpent += amount
            categories[index].totalLeft -= amount
            
            // Update the totalSpent and totalLeft properties of the budget
            budget.totalSpent += amount
            budget.totalLeft -= amount
        }
    }

}
