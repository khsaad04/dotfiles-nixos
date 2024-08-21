pragma Singleton

import Quickshell

Singleton {
<* for name, value in colors *>
    readonly property string {{name}}: "{{value.default.hex}}";
<* endfor *>
}
