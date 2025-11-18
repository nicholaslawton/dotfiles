import QtQuick
import QtQuick.Layouts
import Quickshell

Scope {
  Panel {
    anchorBottom: true
    anchorLeft: true

    Item {
      implicitHeight: 150
      implicitWidth: 400

      ColumnLayout {
        BatteryStatus {}
      }
    }
  }
}
