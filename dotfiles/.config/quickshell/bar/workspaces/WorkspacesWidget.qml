import Quickshell
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts
import "root:/bar"
import "root:/"

Widget {
    id: root;
    property int baseIndex: 1;
    property int currentIndex: Hyprland.focusedMonitor.activeWorkspace.id;
    property int wsCount: 10;
    signal workspaceAdded(workspace: HyprlandWorkspace);
    implicitWidth: row.implicitWidth + Config.spacing;
    MouseArea {
        anchors.fill: parent;

        acceptedButtons: Qt.NoButton;
        onWheel: event => {
            event.accepted = true;
            const step = -Math.sign(event.angleDelta.y);
            const targetWs = currentIndex + step;

            if (targetWs >= baseIndex && targetWs < baseIndex + wsCount) {
                Hyprland.dispatch(`workspace ${targetWs}`);
            }
        }
        RowLayout {
            id: row;
            spacing: Config.spacing;
            anchors {
                fill: parent;
                leftMargin: parseInt(Config.spacing/2);
                rightMargin: parseInt(Config.spacing/2);
            }
            Repeater {
                id: repeater;
                model: 10;
                MouseArea {
                    id: wsItem;
                    property real index: modelData + 1;
                    property bool active: index == currentIndex;
                    property HyprlandWorkspace workspace: null;
                    property bool exists: workspace != null;
                    onPressed: {
                        Hyprland.dispatch(`workspace ${index}`);
                    }
                    Connections {
                        target: root;

                        function onWorkspaceAdded(workspace: HyprlandWorkspace) {
                            if (workspace.id == wsItem.index) {
                                wsItem.workspace = workspace;
                            }
                        }
                    }

                    Layout.fillHeight: true;
                    implicitWidth: rect.implicitWidth;
                    Rectangle {
                        id: rect;
                        anchors.centerIn: parent;
                        height: parent.height - Config.spacing;
                        implicitWidth: 16;
                        color: active ? Colors.primary_fixed:Colors.surface_container_highest;
                        radius: Config.radius;
                        Text {
                            id: text;
                            text: index;
                            anchors.centerIn: parent;
                            font {
                                family: Config.font;
                                pixelSize: Config.fontSize;
                            }
                            color: active ? Colors.surface_container_highest : Colors.primary_fixed;
                        }
                        Rectangle {
                            anchors.horizontalCenter: parent.horizontalCenter;
                            anchors.bottom: parent.bottom;
                            height: 2;
                            width: 2;
                            color: exists ? Colors.primary_fixed:Colors.surface_container_highest;
                        }
                    }
                }
            }
        }
    }

    Connections {
        target: Hyprland.workspaces;

        function onObjectInsertedPost(workspace) {
            root.workspaceAdded(workspace);
        }
    }

    Component.onCompleted: {
        Hyprland.workspaces.values.forEach(workspace => {
            root.workspaceAdded(workspace);
        })
    }
}
