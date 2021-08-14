//
//  ContentView.swift
//  coreMLimageClassifcation
//
//  Created by Daval Cato on 8/13/21.
//

import SwiftUI

struct ContentView: View {
    
    let photos = ["Banana", "tiger","bottle"]
    
    // Current index is a state property
    @State private var currentIndex: Int = 0
    @State private var classificationLabel: String = ""
    
    let model = MobileNetV2()
    
    private func performImageClassification() {
        
        // Array of Images
        let currentImageName = photos[currentIndex]
        
        guard let img = UIImage(named: currentImageName),
              let resizedImage = img.resizeTo(size: CGSize(
                width: 224,
                height: 224)),
              let buffer = resizedImage.toBuffer() else {
                  // If failed
                  return
        }
        // Get the output by passing the buffer
        let output = try? model.prediction(image: buffer)
        
        // Unwrap it
        if let output = output {
            
            // Displays final output image
//            self.classificationLabel = output.classLabel
            let results = output.classLabelProbs.sorted { $0.1 > $1.1 }
            // Array of dictionary
            let result = results.map { (key, value) in
                // return name of key
                return "\(key) = \(value * 100)%"
                
            }.joined(separator: "\n")
            
            classificationLabel = result
            
            
        }
        
    }
    
    var body: some View {
        VStack {
            Image(photos[currentIndex])
                .resizable()
                .frame(width: 200, height: 200)
            HStack {
                Button("Previous") {
                    
                    // assigning the current property
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
            // Display the text
            Text(classificationLabel)
                .font(.largeTitle)
                .padding()
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
