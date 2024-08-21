import Quickshell
import Quickshell.Io
import QtQuick
import "root:/bar"

Widget {
    id: root;

    property string cpuUsedPercentage;
    property var cpu_last: [0,0,0,0];
    property real cpu_last_sum: 0;

    Process {
        id: cpu;
        running: true;
        command: ["sh","-c","head -n1 /proc/stat"];

        stdout: SplitParser {
            splitMarker: "\n";
            onRead: data => {
                var cpu_now = data.split(' ').splice(2);
                var cpu_sum = 0;
                for (let i = 0; i < cpu_now.length; i++) {
                    cpu_sum += parseInt(cpu_now[i]);
                }
                var cpu_delta = cpu_sum - root.cpu_last_sum;
                var cpu_idle = parseInt(cpu_now[3]) - parseInt(cpu_last[3]);
                var cpu_used = cpu_delta - cpu_idle;
                var cpu_usage = cpu_used / cpu_delta * 100;

                cpu_last = cpu_now;
                cpu_last_sum = cpu_sum;

                cpuUsedPercentage = cpu_usage.toFixed(0).toString() + "%";
            }
        }
    }

    Timer {
        interval: 1000;
        running: true;
        repeat: true;
        onTriggered: {
            cpu.running = true;
        }
    }
    text: " " + cpuUsedPercentage;
}
