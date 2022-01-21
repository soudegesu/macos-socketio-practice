//
//  ContentView.swift
//  macos-socketio-practice
//
//  Created by soudegesu on 2022/01/21.
//

import SwiftUI

struct ContentView: View {
  
    var client = SocketClient()
    @State var message = ""
    @State var receiveMessages: [RecieveMessage] = []
  
    var body: some View {
      VStack(alignment: .center, spacing: 20) {
        HStack(spacing: 20) {
          Button("connect", action: {
            client.onMessageHandler = { data, ack in
              guard let d = data[0] as? NSDictionary else { return }
              let msg = RecieveMessage(content: d["content"] as! String,
                                       from: d["from"] as! String,
                                       time: d["time"] as! Int64,
                                       id: d["id"] as! String)
              receiveMessages.append(msg)
            }
            client.connect()
          })
          Button("disconnect", action: {
            client.disconnect()
          })
        }
        HStack {
          TextField("message", text: $message)
          Button("send", action: {
            client.send(message)
            message = ""
          })
        }.padding(.horizontal, 10)
        VStack {
          Text("Recieve Messages")
          ForEach(receiveMessages) {msg in
            Text("\(msg.content) from \(msg.from)")
          }
        }
      }.frame(width: 480, height: 360, alignment: .center)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
