import Quickshell
import Quickshell.Wayland
import QtQuick
import QtQuick.Layouts

Scope {
  readonly property string date: Qt.formatDateTime(clock.date, "dddd d MMMM")
  readonly property string timeAmpm: Qt.formatDateTime(clock.date, "h:mm a")
  readonly property string time: timeAmpm.substring(0, timeAmpm.length - 3)
  readonly property string ampm: Qt.formatDateTime(clock.date, "a")

  SystemClock {
    id: clock
    precision: SystemClock.Minutes
  }

  Variants {
    model: Quickshell.screens

    PanelWindow {
      required property var modelData
      screen: modelData

      anchors {
        bottom: true
        right: true
      }

      margins {
        bottom: 50
        right: 50
      }

      implicitWidth: content.width
      implicitHeight: content.height

      color: "transparent"

      // Give the window an empty click mask so all clicks pass through it.
      mask: Region {}

      WlrLayershell.layer: WlrLayer.Background

      Item {
        id: content
        anchors.fill: parent

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
}
