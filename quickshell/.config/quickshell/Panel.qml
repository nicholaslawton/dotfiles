import Quickshell
import Quickshell.Wayland
import Quickshell.Widgets
import QtQuick

Scope {
  id: root
  required property bool anchorTop
  required property bool anchorBottom
  required property bool anchorLeft
  required property bool anchorRight
  
  required default property Item content

  Variants {
    model: Quickshell.screens

    PanelWindow {
      id: container

      required property var modelData
      screen: modelData

      anchors {
        top: root.anchorTop
        bottom: root.anchorBottom
        left: root.anchorLeft
        right: root.anchorRight
      }

      margins {
        top: 50
        bottom: 50
        left: 50
        right: 50
      }

      color: "transparent"

      // Give the window an empty click mask so all clicks pass through it.
      mask: Region {}

      WlrLayershell.layer: WlrLayer.Background

      implicitWidth: background.implicitWidth
      implicitHeight: background.implicitHeight

      WrapperRectangle {
        id: background
        color: "#00000000"
        opacity: 0.7
        margin: 20

        child: content
      }
    }
  }
}
