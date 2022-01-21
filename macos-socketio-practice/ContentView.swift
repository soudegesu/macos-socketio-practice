//
//  ContentView.swift
//  macos-socketio-practice
//
//  Created by soudegesu on 2022/01/21.
//

import SwiftUI

struct ContentView: View {
  
    var client = SocketClient()
  
    var body: some View {
      VStack(alignment: .center, spacing: 20) {
        Button("connect", action: {
          client.connect()
        })
        Button("disconnect", action: {
          client.disconnect()
        })
      }.frame(width: 480, height: 360, alignment: .center)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
