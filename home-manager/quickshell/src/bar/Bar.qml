import Quickshell
import QtQuick.Layouts
import QtQuick 
import "audio"
import "clock"
import "sysinfo"
import "workspaces"
import "root:/"

PanelWindow {
    anchors {
        left: true;
        right: true;
        top: true;
    }

    color: Colors.surface;
    height: layout.implicitHeight + Config.spacing;

    RowLayout {
        id: layout;
        anchors.fill: parent;
        RowLayout {
            id: right;
            spacing: Config.spacing;
            Layout.fillHeight: true;
            Layout.leftMargin: parseInt(Config.spacing/2);
            WorkspacesWidget {}
            HSpace {}
        }
        RowLayout {
            id: center;
            spacing: Config.spacing;
            Layout.fillHeight: true;
            Layout.fillWidth: true;
        }
        RowLayout {
            id: left;
            spacing: Config.spacing;
            Layout.fillHeight: true;
            Layout.rightMargin: parseInt(Config.spacing/2);
            HSpace {}
            AudioWidget {}
            CpuWidget {}
            MemWidget {}
            ClockWidget {}
        }
    }
}
