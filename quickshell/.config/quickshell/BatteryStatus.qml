import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Io

Item {
  id: root
  property int percentage: 0
  property bool charging: false

  Timer {
    id: batteryUpdateTimer
    interval: 1000 // Update every second
    running: true
    repeat: true
    onTriggered: batteryProcess.running = true
  }

  Process {
    id: batteryProcess
    command: ["nu", "~/.config/quickshell/battery.nu"]
    running: true

    stdout: StdioCollector {
      onStreamFinished: {
        const tokens = this.text.split(" ")
        root.percentage = parseInt(tokens[0])
        root.charging = tokens[1] == "charging"
      }
    }
  }

  readonly property string chargeColor: charging ? "lightgreen" : (percentage < 15) ? "tomato" : "white"
  readonly property string chargeSymbol: {
      if (charging) {
        return ""
      } else if (percentage < 10) {
        return ""
      } else if (percentage < 35) {
        return ""
      } else if (percentage < 65) {
        return ""
      } else if (percentage < 90) {
        return ""
      } else {
        return ""
      }
    }

  RowLayout {
    Text {
      text: chargeSymbol
      color: chargeColor
      font.pointSize: 80
    }
    Text {
      id: percentageDisplay
      text: percentage
      color: chargeColor
      font.pointSize: 30
      font.bold: true
    }
    Text {
      text: "%"
      color: chargeColor
      font.pointSize: 20
      anchors.baseline: percentageDisplay.baseline
    }
  }
}
