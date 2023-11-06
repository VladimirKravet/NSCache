//
//  ContentView.swift
//  NSCache
//
//  Created by Vladimir Kravets on 01.11.2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = CacheViewModel()
    
    var body: some View {
        NavigationView{
            VStack {
                if let image = viewModel.startingImage {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 200)
                        .clipped()
                        .cornerRadius(20)
                }
                
                HStack{
                    Button {
                        viewModel.saveToCache()
                    } label: {
                        Text("Save to Cache")
                            .foregroundColor(.white)
                            .font(.headline)
                            .padding()
                            .padding(.horizontal,8)
                            .background(.blue)
                            .cornerRadius(10)
                    }
                    Button {
                        viewModel.removeFromCache()
                    } label: {
                        Text("Delet from Cache")
                            .foregroundColor(.white)
                            .font(.headline)
                            .padding()
                            .padding(.horizontal,8)
                            .background(.red)
                            .cornerRadius(10)
                    }
                }
                Button {
                    viewModel.getFromCache()
                } label: {
                    Text("Get from Cache")
                        .foregroundColor(.white)
                        .font(.headline)
                        .padding()
                        .padding(.horizontal,8)
                        .background(.green)
                        .cornerRadius(10)
                }
                if let image = viewModel.cacheImage {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 200)
                        .clipped()
                        .cornerRadius(20)
                }
                Text(viewModel.infoMessage)
                    
                Spacer()
            }
            .navigationTitle("NSCache")
        }
    }
}

