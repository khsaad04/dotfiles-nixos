import Quickshell
import QtQuick
import "root:/"

Rectangle {
    id: root;
    property string text;
    color: Colors.surface_container_highest;
    implicitWidth: text.implicitWidth;
    implicitHeight: text.implicitHeight;
    radius: Config.radius;
    Text {
        id: text;
        font {
            family: Config.font;
            pixelSize: Config.fontSize;
        }
        anchors.centerIn: parent;
        text: root.text;
        padding: Config.spacing;
        color: Colors.primary_fixed;
    }
}
