import QtQuick
import QtQuick.Layouts

RowLayout {
  readonly property string status: "connected"
  readonly property string statusSymbol: {
      if (status == "connected") {
        return ""
      } else if (status == "ethernet") {
        return ""
      } else {
        return "⚠"
      }
    }

  Text {
    text: statusSymbol
    color: "white"
    font.pointSize: 80
  }
}
