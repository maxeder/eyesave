//
//  ContentView.swift
//
//  EyeSave
//
//  Created by Max Eder on 04.11.2020
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
        Text("EyeSave")
            .font(.largeTitle)
            .padding()
        Text("Max Eder")
        Text("2020")
        }.frame(width: 300, height: 200)
    }

}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
