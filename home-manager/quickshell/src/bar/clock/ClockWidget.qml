import Quickshell
import QtQuick
import "root:/bar"

Widget {
    property var locale: Qt.locale()
    property var date: new Date()
    property string time: date.toLocaleString(locale, "ddd, MMM dd, hh:mm A")

    text: "󰥔 " + time;

    Timer {
        interval: 1000;
        running: true;
        repeat: true;
        onTriggered: date = new Date();
    }
}
