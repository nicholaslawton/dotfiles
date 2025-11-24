import QtQuick
import QtQuick.Layouts
import Quickshell.Io

RowLayout {
  id: root
  property int updates: 0
  visible: updates > 0

  Timer {
    interval: 3600000  // 1 hour
    running: true
    repeat: true
    onTriggered: process.running = true
  }

  Process {
    id: process
    command: ["paru", "--query", "--upgrades"]
    running: true

    stdout: StdioCollector {
      onStreamFinished: {
        root.updates = text.split('\n').filter(line => line.trim().length > 0).length
      }
    }
  }

  spacing: 20

  Text {
    text: "󰏗"
    color: "white"
    font.pointSize: 80
  }
  Text {
    text: root.updates
    color: "white"
    font.pointSize: 40
    font.bold: true
  }
}
