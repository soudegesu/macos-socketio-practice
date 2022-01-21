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
  
  let socket = manager.defaultSocket
  let auth = ["connectionId": UUID().uuidString]
  
  func connect() {
    debugPrint(#function)
    socket.connect(withPayload: auth)
  }
  
  func disconnect() {
    debugPrint(#function)
    socket.disconnect()
  }
}
