import Quickshell
import Quickshell.Io
import QtQuick
import Quickshell.Services.Pipewire 
import "root:/bar"

Widget {
    PwNodeLinkTracker {
        id: linkTracker;
        node: Pipewire.defaultAudioSink;
    }
    PwObjectTracker { objects: [ linkTracker.node ]; }
    text: " " + `${Math.floor(linkTracker.node.audio.volume * 100)}%`;
    MouseArea {
        anchors.fill: parent;

        acceptedButtons: Qt.NoButton;
        onWheel: event => {
            event.accepted = true;
            if (event.angleDelta.y > 0) {
                volup.running = true;
            } else {
                voldown.running = true;
            }
        }
    }
    Process {
        id: volup;
        running: false;
        command: ["changevolume", "up", "5"];
    }
    Process {
        id: voldown;
        running: false;
        command: ["changevolume", "down", "5"];
    }
}
