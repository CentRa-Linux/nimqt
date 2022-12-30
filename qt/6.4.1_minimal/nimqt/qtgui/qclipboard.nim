const headerFile* = "QtGui/qclipboard.h"

import nimqt/qtcore/qobject
# Disable 'Warning: type pragmas follow the type name; this form of writing pragmas is deprecated'
{.push warning[Deprecated]: off.}


type
    # Classes and enums found in the C++ code
    # Global
    QClipboard_Mode* {.header:headerFile,importcpp:"QClipboard::Mode".} = enum Clipboard = 0, Selection = 0x1, FindBuffer = 0x2, LastMode = 0x3
    QClipboard* {.header:headerFile,importcpp:"QClipboard" ,pure.} = object of QObject
{.push warning[Deprecated]: on.}

# Stuff for class QClipboard

# Public methods for QClipboard
import nimqt/qtcore/qstring
# 1 default parameters!
proc static_QClipboard_tr*(s: ptr char, c: ptr char, n: cint): QString {.header:headerFile, importcpp:"QClipboard::tr(@)".} # Public static
proc static_QClipboard_tr*(s: ptr char, c: ptr char): QString {.header:headerFile, importcpp:"QClipboard::tr(@)".} # Public static
proc clear*(this:ptr QClipboard, mode: QClipboard_Mode) {.header:headerFile, importcpp:"#.clear(@)".} # Public 
proc supportsSelection*(this:ptr QClipboard): bool {.header:headerFile, importcpp:"#.supportsSelection(@)".} # Public 
proc supportsFindBuffer*(this:ptr QClipboard): bool {.header:headerFile, importcpp:"#.supportsFindBuffer(@)".} # Public 
proc ownsSelection*(this:ptr QClipboard): bool {.header:headerFile, importcpp:"#.ownsSelection(@)".} # Public 
proc ownsClipboard*(this:ptr QClipboard): bool {.header:headerFile, importcpp:"#.ownsClipboard(@)".} # Public 
proc ownsFindBuffer*(this:ptr QClipboard): bool {.header:headerFile, importcpp:"#.ownsFindBuffer(@)".} # Public 
proc text*(this:ptr QClipboard, mode: QClipboard_Mode): QString {.header:headerFile, importcpp:"#.text(@)".} # Public 
proc text*(this:ptr QClipboard, subtype: QString, mode: QClipboard_Mode): QString {.header:headerFile, importcpp:"#.text(@)".} # Public 
proc setText*(this:ptr QClipboard, arg_0: QString, mode: QClipboard_Mode) {.header:headerFile, importcpp:"#.setText(@)".} # Public 
import nimqt/qtgui/qimage
proc image*(this:ptr QClipboard, mode: QClipboard_Mode): QImage {.header:headerFile, importcpp:"#.image(@)".} # Public 
import nimqt/qtgui/qpixmap
proc pixmap*(this:ptr QClipboard, mode: QClipboard_Mode): QPixmap {.header:headerFile, importcpp:"#.pixmap(@)".} # Public 
proc setImage*(this:ptr QClipboard, arg_0: QImage, mode: QClipboard_Mode) {.header:headerFile, importcpp:"#.setImage(@)".} # Public 
proc setPixmap*(this:ptr QClipboard, arg_0: QPixmap, mode: QClipboard_Mode) {.header:headerFile, importcpp:"#.setPixmap(@)".} # Public 
proc changed*(this:ptr QClipboard, mode: QClipboard_Mode) {.header:headerFile, importcpp:"#.changed(@)".} # Public 
proc selectionChanged*(this:ptr QClipboard) {.header:headerFile, importcpp:"#.selectionChanged(@)".} # Public 
proc findBufferChanged*(this:ptr QClipboard) {.header:headerFile, importcpp:"#.findBufferChanged(@)".} # Public 
proc dataChanged*(this:ptr QClipboard) {.header:headerFile, importcpp:"#.dataChanged(@)".} # Public 

export qpixmap
export qstring
export qimage
export qobject