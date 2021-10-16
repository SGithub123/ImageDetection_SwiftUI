//
//  SwiftUIView.swift
//  ImageDetection_SwiftUI
//
//  Created by Sanket Bhamare on 16/10/21.
//

import SwiftUI

struct SwiftUIView: View {
    
    let imgArr = ["heart","send","bottle","instagram","facebook","user","comment","tiger","banana"]
    
    @State var currentIndex : Int = 0
    
    
    
    var body: some View {
        VStack {
            Image(imgArr[currentIndex])
                .resizable()
                .frame(width: 200, height: 200)
            HStack {
                
                //Change Image button
                Button(action: {
                    
//                    if self.currentIndex < self.imgArr.count - 1 {
//                        self.currentIndex = self.currentIndex  + 1
//                    } else {
//                        self.currentIndex = 0
//                    }
                    
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
            
            Button(action: {}, label: {
                Text("Detect Image")
            })
            .padding()
            .cornerRadius(10)
            .background(Color.init(.blue))
            .foregroundColor(.white)
            
            
            Text("Image Name")
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
