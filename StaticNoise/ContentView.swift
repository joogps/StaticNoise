//
//  ContentView.swift
//  StaticNoise
//
//  Created by João Gabriel Pozzobon dos Santos on 09/07/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            staticNoise
                .aspectRatio(1.0, contentMode: .fit)
                .cornerRadius(35)
                .padding()
        }
    }
    
    var staticNoise: some View {
        TimelineView(.animation(minimumInterval: 0.01, paused: false)) { timeline in
            let scale = 2.75
            
            Canvas { context, size in
                for i in 0...Int(size.width/scale) {
                    for j in 0...Int(size.height/scale) {
                        let frame = CGRect(x: Double(i)*scale, y: Double(j)*scale, width: scale, height: scale)
                        context.fill(Rectangle().path(in: frame), with: .color(.init(white: .random(in: 0.15...0.75))))
                    }
                }
                
                // TimelineView doesn't work without this line
                timeline.cadence
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
