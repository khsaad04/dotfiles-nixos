import Quickshell
import Quickshell.Io
import QtQuick
import "root:/bar"

Widget {
    id: root;

    property string memUsedPercentage;
    property real memTotal;
    property real memFree;
    property real memUsed;

    Process {
        id: mem;
        running: true;
        command: ["cat", "/proc/meminfo"];

        stdout: SplitParser {
            splitMarker: "";
            onRead: data => {
                var lines = data.split("\n");
                memTotal = parseInt(lines[0].match(/\d+/g));
                memFree = parseInt(lines[2].match(/\d+/g));
                memUsed = parseFloat(memTotal - memFree);
                memUsedPercentage = ((memUsed/memTotal*100)).toFixed(0).toString() + "%";
            }
        }
    }

    Timer {
        interval: 1000;
        running: true;
        repeat: true;
        onTriggered: {
            mem.running = true;
        }
    }

    text: " " + memUsedPercentage;
}
