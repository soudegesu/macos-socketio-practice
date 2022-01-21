//
//  Message.swift
//  macos-socketio-practice
//
//  Created by soudegesu on 2022/01/21.
//

import Foundation

struct RecieveMessage: Identifiable {
  var content: String
  var from: String
  var time: Int64
  var id: String
}

