import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.Pipewire
import Quickshell.Widgets

Scope {
  id: root

  // Bind the pipewire node so its volume will be tracked
  PwObjectTracker {
    objects: [ Pipewire.defaultAudioSink ]
  }

  Connections {
    target: Pipewire.defaultAudioSink?.audio

    function showOverlay() {
      root.showOverlay = true
      hideTimer.restart()
    }

    function onVolumeChanged() {
      showOverlay()
    }

    function onMutedChanged() {
      showOverlay()
    }
  }

  readonly property real volume: Pipewire.defaultAudioSink?.audio.volume ?? 0
  readonly property bool muted: Pipewire.defaultAudioSink?.audio.muted
  property bool showOverlay: false

  Timer {
    id: hideTimer
    interval: 1000
    onTriggered: root.showOverlay = false
  }

  // The overlay window will be created and destroyed based on showOverlay.
  // PanelWindow.visible could be set instead of using a loader, but using
  // a loader will reduce the memory overhead when the window isn't open.
  LazyLoader {
    active: root.showOverlay

    PanelWindow {
      // Since the panel's screen is unset, it will be picked by the compositor
      // when the window is created. Most compositors pick the current active monitor.

      anchors.bottom: true
      margins.bottom: screen.height / 5
      exclusiveZone: 0

      implicitWidth: 400
      implicitHeight: 50
      color: "transparent"

      // An empty click mask prevents the window from blocking mouse events.
      mask: Region {}

      Rectangle {
        anchors.fill: parent
        radius: height / 2
        color: "#80000000"

        RowLayout {
          anchors {
            fill: parent
            leftMargin: 10
            rightMargin: 15
          }

          // IconImage {
          //   implicitSize: 30
          //   source: Quickshell.iconPath("audio-volume-high-symbolic")
          // }

          Text {
            text: {
              if (muted) {
                return ""
              } else if (volume > 0.7) {
                return ""
              } else if (volume > 0.3) {
                return ""
              } else {
                return ""
              }
            }
            color: muted ? "tomato" : "white"
            font.pointSize: 16
          }

          Rectangle {
            // Stretches to fill all left-over space
            Layout.fillWidth: true

            implicitHeight: 10
            radius: 20
            color: "#50ffffff"

            Rectangle {
              anchors {
                left: parent.left
                top: parent.top
                bottom: parent.bottom
              }

              implicitWidth: parent.width * volume
              radius: parent.radius
              color: muted ? "#80ffffff" : "white"
            }
          }
        }
      }
    }
  }
}
