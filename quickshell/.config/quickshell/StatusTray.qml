import QtQuick
import QtQuick.Layouts
import Quickshell

Scope {
  Panel {
    anchorBottom: true
    anchorLeft: true

    Item {
      implicitHeight: items.height
      implicitWidth: items.width

      ColumnLayout {
        id: items
        // NetworkStatus {}
        BatteryStatus {}
      }
    }
  }
}
