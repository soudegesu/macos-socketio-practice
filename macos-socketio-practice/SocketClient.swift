//
//  SocketClient.swift
//  macos-socketio-practice
//
//  Created by soudegesu on 2022/01/21.
//

import Foundation
import SocketIO

let manager = SocketManager(socketURL: URL(string: "ws://localhost:3000")!, config: [.log(true), .compress, .reconnects(true), .reconnectWait(10), .reconnectAttempts(-1)])

class SocketClient {
  
  let socket = manager.socket(forNamespace: "/chat")
  let auth = [
    "connectionId": UUID().uuidString,
    "roomId": "roomA"
  ]
  
  var onMessageHandler: NormalCallback? 
  
  func connect() {
    debugPrint(#function)
    socket.on(clientEvent: .connect) {[weak self] data, ack in
      debugPrint("Connected: \(self?.socket.sid ?? "")")
    }
    if let onMessageHandler = onMessageHandler {
      socket.on("message", callback: onMessageHandler)
    }
    socket.connect(withPayload: auth)
  }
  
  func disconnect() {
    debugPrint(#function)
    socket.disconnect()
  }
  
  func send(_ message: String) {
    debugPrint(#function)
    let data = ["content": message, "from": "clientA"]
    socket.emit("message", data)
  }
}
