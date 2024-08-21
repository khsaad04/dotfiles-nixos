import Quickshell
import QtQuick
import "root:/bar"

Widget {
    property var date: new Date();
    property string time: date.toLocaleString(Qt.locale());

    text: time;

    Timer {
        interval: 1000;
        running: true;
        repeat: true;
        onTriggered: date = new Date();
    }
}
