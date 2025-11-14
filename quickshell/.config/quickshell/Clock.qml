import Quickshell
import Quickshell.Wayland
import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts

Scope {
  readonly property string date: Qt.formatDateTime(clock.date, "dddd d MMMM")
  readonly property string time: {
    var timeAmpm = Qt.formatDateTime(clock.date, "h:mma")
    timeAmpm.substring(0, timeAmpm.length - 2)
  }
  readonly property string ampm: Qt.formatDateTime(clock.date, "a")

  SystemClock {
    id: clock
    precision: SystemClock.Minutes
  }

  Panel {
    anchorBottom: true
    anchorRight: true

    Item {
      implicitHeight: 250
      implicitWidth: Math.max(timeDisplay.implicitWidth + ampmDisplay.implicitWidth, dateDisplay.implicitWidth)

      Text {
        id: timeDisplay
        text: time
        color: "white"
        font.pointSize: 160
        anchors.baseline: ampmDisplay.baseline
        anchors.right: ampmDisplay.left
      }
      Text {
        id: ampmDisplay
        text: ampm
        color: "white"
        font.pointSize: 40
        anchors.bottom: dateDisplay.top
        anchors.right: dateDisplay.right
      }
      Text {
        id: dateDisplay
        text: date
        color: "white"
        font.pointSize: 40
        anchors.bottom: parent.bottom
        anchors.right: parent.right
      }
    }
  }
}
