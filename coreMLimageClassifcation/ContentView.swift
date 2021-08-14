//
//  ContentView.swift
//  coreMLimageClassifcation
//
//  Created by Daval Cato on 8/13/21.
//

import SwiftUI

struct ContentView: View {
    
    let photos = ["banana", "tiger","bottle"]
    @State private var currentIndex: Int = 0
    
    let model = MobileNetV2()
    
    private func performImageClassification() {
        
    }
    
    var body: some View {
        VStack {
            Image(photos[currentIndex])
                .resizable()
                .frame(width: 200, height: 200)
            HStack {
                Button("Previous") {
                    
                    if self.currentIndex >= self.photos.count {
                        self.currentIndex = self.currentIndex - 1
                        
                    } else {
                        self.currentIndex = 0
                    }
                    
                }.padding()
                    .foregroundColor(Color.white)
                    .background(Color.gray)
                    .cornerRadius(10)
                    .frame(width: 100)
                
                Button("Next") {
                    if self.currentIndex < self.photos.count - 1 {
                        self.currentIndex = self.currentIndex + 1
                    } else {
                        self.currentIndex = 0
                    }
                        
                }.padding()
                    .foregroundColor(Color.white)
                    .frame(width: 100)
                    .background(Color.gray)
                    .cornerRadius(10)
                    
                }.padding()
            
            
            Button("Classify") {
                // Classify the image here
                self.performImageClassification()
                
            }.padding()
                .foregroundColor(Color.white)
                .background(Color.green)
                .cornerRadius(8)
            
            Text("")
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
