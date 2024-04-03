//
//  ContentView.swift
//  SwiftUICustomProgressBar
//
//  Created by Mohit Kumar Singh on 03/04/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var containerWidth: CGFloat = 0
    @State var progressTitle: String = ""
    
    var maxWidth: Double {
        return min((containerWidth/CGFloat(goal)*CGFloat(step)), containerWidth)
    }
    
    private let goal = 3
    @State private var step = 0
    
    var body: some View {
        VStack {
            ZStack(alignment: .leading) {
                GeometryReader(content: { geometry in
                    RoundedRectangle(cornerRadius: 60)
                        .foregroundStyle(Color.clear)
                        .onAppear {
                            containerWidth = geometry.size.width
                        }
                })
                RoundedRectangle(cornerRadius: 60)
                    .stroke(Color.red, lineWidth: 1)
                
                ZStack(alignment: .trailing) {
                    RoundedRectangle(cornerRadius: 60)
                        .fill(Color.yellow)
                    
                    Text(progressTitle)
                        .foregroundStyle(Color.white)
                        .padding(EdgeInsets(top: 6, leading: 12, bottom: 6, trailing: 12))
                        .background(
                            RoundedRectangle(cornerRadius: 60)
                                .fill(Color.orange))
                    
                }
                .padding(2)
                .frame(minWidth: maxWidth)
                .fixedSize()
            }
            .fixedSize(horizontal: false, vertical: true)
            .padding(20)
            
        }
        .onAppear {
            progressTitle = "\(step)/\(goal)"
        }
        
        Button {
            guard step < goal else { return }
            withAnimation {
                step += 1
            }
            progressTitle = "\(step)/\(goal)"
            
        } label: {
            Text("Start")
        }

    }
}

#Preview {
    ContentView()
}
