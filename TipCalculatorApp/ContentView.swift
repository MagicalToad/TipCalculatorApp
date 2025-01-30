//
//  ContentView.swift
//  TipCalculatorApp
//
//  Created by Thoene, Zachary on 1/30/25.
//

import SwiftUI

struct ContentView: View {
    @State private var dollarammount: Double = 0.0
    @State private var tipPercentage: Double = 0.0
    @State private var numofPeople: Double = 0.0
    @State private var showResults: Bool = false
    
    var tipamount : Double{
        return dollarammount * (tipPercentage / 100)
    }
    var totalamount : Double{
        return dollarammount + tipamount
    }
    var amountPerPerson : Double{
        return totalamount / numofPeople
    }
    
    
    var body: some View {
        VStack {
            Text("Tip Calculator").font(.largeTitle).padding(.bottom, 100)
            
            VStack{
                Text("Bill Amount").font(.system(size: 20, weight: .semibold))
                Text("\(dollarammount, format: .currency(code: "USD"))").foregroundStyle(Color.red).font(.system(size: 24, weight: .bold))
                    
                Slider(value: $dollarammount, in: 0...500, step: 1)
                    .padding(10)
                    .accentColor(Color.red)
                

                    
            }
            VStack{
                Text("Tip Percentage").font(.system(size: 20, weight: .semibold))
                Text("\(tipPercentage, specifier: "%.0f")%").foregroundStyle(Color.blue).font(.system(size: 24, weight: .bold))
                Slider(value: $tipPercentage, in: 0...30, step: 1)
                    .padding(10)
                    .accentColor(Color.blue)

            }
            VStack{
                Text("Number of People").font(.system(size: 20, weight: .semibold))
                Text("\(numofPeople, specifier: "%0.f")").foregroundStyle(Color.green)
                    .font(.system(size: 24, weight: .bold))
                Slider(value: $numofPeople, in: 0...20, step: 1)
                    .padding(10)
                    .accentColor(Color.green)
                
            }
            
            Button(action: {showResults.toggle()}){
                Text(showResults ? "Hide Results" : "Show Results")
                    .font(.body)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(showResults ? Color.red : Color.blue)
                    .foregroundStyle(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 10)
                    .padding()
            }
            if showResults {
                VStack{
                    Text("Tip Amount \(tipamount, format: .currency(code: "USD"))")
                    Text("Total Amount \(totalamount, format: .currency(code: "USD"))")
                    Text("Amount Per Person \(amountPerPerson, format: .currency(code: "USD"))")
                }
            }
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
