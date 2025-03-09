//
//  ContentView.swift
//  fruits
//
//  Created by Renan Toniolo Rocha on 25/02/25.
//

import SwiftUI

struct ContentView: View {
    @State private var text = String()
    @State  var list: [Fruit] = []
        
    var body: some View {
        VStack(spacing: 10) {
            Text(FruitStrings.title_str)
                .font(.title)
                .bold()
            Image("img_fruits")
                .resizable()
                .frame(width: 150, height: 150, alignment: .top)
                .aspectRatio(contentMode: .fit)
               
            TextField(FruitStrings.title_preload_str,
                      text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .cornerRadius(15)
                .shadow(color: .gray, radius: 5)
                .padding(15)
            HStack {
                Button(action: {
                    addItem()
                }) {
                    Text(FruitStrings.add_str)
                        .padding()
                        .foregroundColor(.white)
                        .background(.blue)
                        .cornerRadius(10)
                }
                Button(action: {
                    self.removeItem()
                }) {
                    Text(FruitStrings.remove_str)
                        .padding()
                        .foregroundColor(.blue)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                            .stroke(.blue, lineWidth: 1))
                }
            }
            Text("\(FruitStrings.sub_title_str) (\(list.count)):")
                .font(.title2)
                .bold()
                .padding(15)
            if !list.isEmpty {
                List(list) { item in
                    Text(item.name)
                        .font(.headline)
                        .foregroundColor(.primary)
                }
                .background(Color.gray.opacity(0.1))
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
        .padding()
        .background(Color.gray.opacity(0.1))
    }
}

extension ContentView {
    private func removeItem() {
        var index1: Int?
        for (index, fruit) in list.enumerated() {
            if fruit.name == text {
                index1 = index
                break
            }
        }
        if let index1 = index1 {
            list.remove(at: index1)
            self.text = String()
        }
    }
    
    private func addItem() {
        if self.text.isEmpty {
            return
        }
        self.list.append(Fruit(name: self.text))
        self.text = String()
    }
}

#Preview {
    ContentView()
}
