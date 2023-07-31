const headerFile* = "QtCore/qbasictimer.h"

# Disable 'Warning: type pragmas follow the type name; this form of writing pragmas is deprecated'
{.push warning[Deprecated]: off.}
when (NimMajor, NimMinor, NimPatch) < (1, 9, 0):
    type
        # Classes found in the C++ code
        QBasicTimer* {.header:headerFile,importcpp:"QBasicTimer" ,pure.} = object {.inheritable.}
elif (NimMajor, NimMinor, NimPatch) >= (1, 9, 0):
    type
        # Classes found in the C++ code
        QBasicTimer* {.header:headerFile,importcpp:"QBasicTimer" ,pure,inheritable.} = object
{.push warning[Deprecated]: on.}

# Stuff for class QBasicTimer

# Public constructors for QBasicTimer
proc newQBasicTimer*(): QBasicTimer {. header:headerFile, importcpp:"QBasicTimer(@)", constructor .} #
proc newQBasicTimer*(other: QBasicTimer): QBasicTimer {. header:headerFile, importcpp:"QBasicTimer(@)", constructor .} #

# Public methods for QBasicTimer
proc swap*(this: QBasicTimer, other: QBasicTimer) {.header:headerFile, importcpp:"#.swap(@)".} # Public
proc isActive*(this: QBasicTimer): bool {.header:headerFile, importcpp:"#.isActive(@)".} # Public
proc timerId*(this: QBasicTimer): cint {.header:headerFile, importcpp:"#.timerId(@)".} # Public
import nimqt/qtcore/qobject
proc start*(this: QBasicTimer, msec: cint, obj: ptr QObject) {.header:headerFile, importcpp:"#.start(@)".} # Public
import nimqt/qtcore/qnamespace
proc start*(this: QBasicTimer, msec: cint, timerType: Qt_TimerType, obj: ptr QObject) {.header:headerFile, importcpp:"#.start(@)".} # Public
proc stop*(this: QBasicTimer) {.header:headerFile, importcpp:"#.stop(@)".} # Public

export qnamespace
export qobject
