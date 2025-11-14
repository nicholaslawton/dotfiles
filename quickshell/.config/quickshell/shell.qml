import Quickshell

Scope {
  Variants {
    model: Quickshell.screens

    Clock {
      required property var modelData
      screen: modelData
    }
  }
}
