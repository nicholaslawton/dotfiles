import QtQuick
import QtQuick.Layouts
import Quickshell.Services.UPower

RowLayout {
  id: root
  property UPowerDevice battery: {
      for (var i = 0; i < UPower.devices.values.length; i++) {
        if (UPower.devices.values[i].type == UPowerDeviceType.Battery) {
          return UPower.devices.values[i]
        }
      }
    }
  property real percentage: battery.percentage
  property bool charging: battery.state == UPowerDeviceState.Charging

  readonly property string chargeColor: charging ? "lightgreen" : (percentage < 0.15) ? "tomato" : "white"
  readonly property string chargeSymbol: {
      if (charging) {
        return ""
      } else if (percentage < 0.10) {
        return ""
      } else if (percentage < 0.35) {
        return ""
      } else if (percentage < 0.65) {
        return ""
      } else if (percentage < 0.90) {
        return ""
      } else {
        return ""
      }
    }

  Text {
    text: chargeSymbol
    color: chargeColor
    font.pointSize: 80
  }
  Text {
    id: percentageDisplay
    text: percentage * 100
    color: chargeColor
    font.pointSize: 40
    font.bold: true
    Layout.alignment: Qt.AlignBaseline
  }
  Text {
    text: "%"
    color: chargeColor
    font.pointSize: 20
    Layout.alignment: Qt.AlignBaseline
  }
}
