//
//  SwiftUIView.swift
//  ImageDetection_SwiftUI
//
//  Created by Sanket Bhamare on 16/10/21.
//

import SwiftUI

struct SwiftUIView: View {
    
    let imgArr = ["heart","send","bottle","zebra","jaguar","instagram","facebook","monkey","panda","redFox","user","comment","tiger","elephant","banana","nature"]
    
    @State var currentIndex : Int = 0
    @State var textLabelStr : String = ""
    
    var machineModel = MobileNetV2()
    
    var body: some View {
        VStack {
            Image(imgArr[currentIndex])
                .resizable()
                .frame(width: 200, height: 200)
            HStack {
                
                //Change Image button
                Button(action: {
                    let randomNo = Int.random(in: 0...imgArr.count - 1)
                    self.currentIndex = randomNo
                    
                }, label: {
                    Image("toggle")
                        .resizable()
                        .frame(width: 80, height:80)
                })
                .padding()
                .frame(width:100)
                .cornerRadius(40)
                .border(Color.gray, width: 2)
                
            }
            
            Button(action: {
                
                // Detect image
                textLabelStr = ""
                ImageDetection()
                
            }, label: {
                Text("Detect Image")
            })
            .padding()
            .cornerRadius(10)
            .background(Color.init(.blue))
            .foregroundColor(.white)
            
            Text(textLabelStr)
        }
    }
    
    private func ImageDetection() {
        
        let currentImgName = imgArr[currentIndex]
        
        // Image Resize
        guard let img = UIImage(named: currentImgName),
              let resizedImg = img.resizeTo(size: CGSize(width: 224, height: 224)),
              let buffer = resizedImg.toBuffer() else {
            return
        }
        
        let output = try? machineModel.prediction(image: buffer)
        
        if let output = output {
            textLabelStr = output.classLabel
        }
    }
    
    
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
