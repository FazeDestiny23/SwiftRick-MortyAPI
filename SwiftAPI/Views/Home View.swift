//
//  Home View.swift
//  SwiftAPI
//
//  Created by FRANCISCO AQUINO on 06/03/24.
//

import SwiftUI

struct Home: View {
    @State private var isContentActive = false
    
    var image: Image
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                    .overlay {
                        Circle().stroke(Color.green, lineWidth: 4)
                    }
                    .shadow(radius: 7)
                    .padding()
                
                Text("R i c k & M o r t y")
                    .foregroundColor(.green)
                    .font(.custom("ZenDots-Regular", size: 30))
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding()
                
                Button(action: {
                    isContentActive.toggle()
                }) {
                    Text("Start Learning")
                        .foregroundColor(.green)
                        .font(.headline)
                        .padding()
                        .background(Color.green.opacity(0.2))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                .padding()
                .fullScreenCover(isPresented: $isContentActive) {
                    ContentView()
                }
                
                Spacer()
            }
            .navigationTitle("")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home(image: Image("logo"))
            .previewDevice("iPad Pro (12.9-inch) (5th generation)")
    }
}
