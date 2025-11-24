import QtQuick
import QtQuick.Layouts

RowLayout {
  readonly property int updates: 12
  visible: updates > 0
  
  Text {
    text: "*"
    color: "white"
    font.pointSize: 80
  }
  Text {
    text: updates
    color: "white"
    font.pointSize: 40
    font.bold: true
  }
}
