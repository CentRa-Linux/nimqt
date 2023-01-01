const headerFile* = "QtGui/qtextdocument.h"

import nimqt/qtcore/qobject
# Disable 'Warning: type pragmas follow the type name; this form of writing pragmas is deprecated'
{.push warning[Deprecated]: off.}


type
    # Classes and enums found in the C++ code
    # Global
    QTextDocument_MetaInformation* {.header:headerFile,importcpp:"QTextDocument::MetaInformation".} = enum DocumentTitle = 0, DocumentUrl = 0x1, CssMedia = 0x2
    QTextDocument_MarkdownFeature* {.header:headerFile,importcpp:"QTextDocument::MarkdownFeature".} = enum MarkdownNoHTML = 0, MarkdownDialectCommonMark = 0x1, MarkdownDialectGitHub = 0x2
    QTextDocument_FindFlag* {.header:headerFile,importcpp:"QTextDocument::FindFlag".} = enum FindBackward = 0, FindCaseSensitively = 0x1, FindWholeWords = 0x2
    QTextDocument_ResourceType* {.header:headerFile,importcpp:"QTextDocument::ResourceType".} = enum UnknownResource = 0, HtmlResource = 0x1, ImageResource = 0x2, StyleSheetResource = 0x3, 
        MarkdownResource = 0x4, UserResource = 0x5
    QTextDocument_Stacks* {.header:headerFile,importcpp:"QTextDocument::Stacks".} = enum UndoStack = 0, RedoStack = 0x1, UndoAndRedoStacks = 0x2
    QAbstractUndoItem* {.header:headerFile,importcpp:"QAbstractUndoItem" ,pure.} = object {.inheritable.}
    QTextDocument* {.header:headerFile,importcpp:"QTextDocument" ,pure.} = object of QObject
{.push warning[Deprecated]: on.}
import nimqt/qtcore/qflags


type
    # typedefs found in the C++ code
    QTextDocument_MarkdownFeatures * = QFlags[QTextDocument_MarkdownFeature]
    QTextDocument_FindFlags * = QFlags[QTextDocument_FindFlag]

# Stuff for class QAbstractUndoItem

# Public methods for QAbstractUndoItem
proc undo*(this: QAbstractUndoItem) {.header:headerFile, importcpp:"#.undo(@)".} # Public
proc redo*(this: QAbstractUndoItem) {.header:headerFile, importcpp:"#.redo(@)".} # Public
# Stuff for class QTextDocument

# Public constructors for QTextDocument
# 1 default parameters!
proc newQTextDocument*(parent: ptr QObject): ptr QTextDocument {. header:headerFile, importcpp:"new QTextDocument(@)" .} #
proc newQTextDocument*(): ptr QTextDocument {. header:headerFile, importcpp:"new QTextDocument(@)" .} #
import nimqt/qtcore/qstring
# 1 default parameters!
proc newQTextDocument*(text: QString, parent: ptr QObject): ptr QTextDocument {. header:headerFile, importcpp:"new QTextDocument(@)" .} #
proc newQTextDocument*(text: QString): ptr QTextDocument {. header:headerFile, importcpp:"new QTextDocument(@)" .} #

# Public methods for QTextDocument
# 1 default parameters!
proc static_QTextDocument_tr*(s: ptr char, c: ptr char, n: cint): QString {.header:headerFile, importcpp:"QTextDocument::tr(@)".} # Public static
proc static_QTextDocument_tr*(s: ptr char, c: ptr char): QString {.header:headerFile, importcpp:"QTextDocument::tr(@)".} # Public static
# 1 default parameters!
proc clone*(this: ptr QTextDocument, parent: ptr QObject): ptr QTextDocument {.header:headerFile, importcpp:"#.clone(@)".} # Public
proc clone*(this: ptr QTextDocument): ptr QTextDocument {.header:headerFile, importcpp:"#.clone(@)".} # Public
proc isEmpty*(this: ptr QTextDocument): bool {.header:headerFile, importcpp:"#.isEmpty(@)".} # Public
proc clear*(this: ptr QTextDocument) {.header:headerFile, importcpp:"#.clear(@)".} # Public
proc setUndoRedoEnabled*(this: ptr QTextDocument, enable: bool) {.header:headerFile, importcpp:"#.setUndoRedoEnabled(@)".} # Public
proc isUndoRedoEnabled*(this: ptr QTextDocument): bool {.header:headerFile, importcpp:"#.isUndoRedoEnabled(@)".} # Public
proc isUndoAvailable*(this: ptr QTextDocument): bool {.header:headerFile, importcpp:"#.isUndoAvailable(@)".} # Public
proc isRedoAvailable*(this: ptr QTextDocument): bool {.header:headerFile, importcpp:"#.isRedoAvailable(@)".} # Public
proc availableUndoSteps*(this: ptr QTextDocument): cint {.header:headerFile, importcpp:"#.availableUndoSteps(@)".} # Public
proc availableRedoSteps*(this: ptr QTextDocument): cint {.header:headerFile, importcpp:"#.availableRedoSteps(@)".} # Public
proc revision*(this: ptr QTextDocument): cint {.header:headerFile, importcpp:"#.revision(@)".} # Public
proc setMetaInformation*(this: ptr QTextDocument, info: QTextDocument_MetaInformation, arg_1: QString) {.header:headerFile, importcpp:"#.setMetaInformation(@)".} # Public
proc metaInformation*(this: ptr QTextDocument, info: QTextDocument_MetaInformation): QString {.header:headerFile, importcpp:"#.metaInformation(@)".} # Public
proc toHtml*(this: ptr QTextDocument): QString {.header:headerFile, importcpp:"#.toHtml(@)".} # Public
proc setHtml*(this: ptr QTextDocument, html: QString) {.header:headerFile, importcpp:"#.setHtml(@)".} # Public
# 1 default parameters!
proc toMarkdown*(this: ptr QTextDocument, features: QFlags[QTextDocument_MarkdownFeature]): QString {.header:headerFile, importcpp:"#.toMarkdown(@)".} # Public
proc toMarkdown*(this: ptr QTextDocument): QString {.header:headerFile, importcpp:"#.toMarkdown(@)".} # Public
# 1 default parameters!
proc setMarkdown*(this: ptr QTextDocument, markdown: QString, features: QFlags[QTextDocument_MarkdownFeature]) {.header:headerFile, importcpp:"#.setMarkdown(@)".} # Public
proc setMarkdown*(this: ptr QTextDocument, markdown: QString) {.header:headerFile, importcpp:"#.setMarkdown(@)".} # Public
proc toRawText*(this: ptr QTextDocument): QString {.header:headerFile, importcpp:"#.toRawText(@)".} # Public
proc toPlainText*(this: ptr QTextDocument): QString {.header:headerFile, importcpp:"#.toPlainText(@)".} # Public
proc setPlainText*(this: ptr QTextDocument, text: QString) {.header:headerFile, importcpp:"#.setPlainText(@)".} # Public
import nimqt/qtgui/qtextcursor
# 2 default parameters!
proc find*(this: ptr QTextDocument, subString: QString, `from`: cint, options: QFlags[QTextDocument_FindFlag]): QTextCursor {.header:headerFile, importcpp:"#.find(@)".} # Public
proc find*(this: ptr QTextDocument, subString: QString, `from`: cint): QTextCursor {.header:headerFile, importcpp:"#.find(@)".} # Public
proc find*(this: ptr QTextDocument, subString: QString): QTextCursor {.header:headerFile, importcpp:"#.find(@)".} # Public
# 1 default parameters!
proc find*(this: ptr QTextDocument, subString: QString, cursor: QTextCursor, options: QFlags[QTextDocument_FindFlag]): QTextCursor {.header:headerFile, importcpp:"#.find(@)".} # Public
proc find*(this: ptr QTextDocument, subString: QString, cursor: QTextCursor): QTextCursor {.header:headerFile, importcpp:"#.find(@)".} # Public
import nimqt/qtcore/qsize
proc setPageSize*(this: ptr QTextDocument, size: QSizeF) {.header:headerFile, importcpp:"#.setPageSize(@)".} # Public
proc pageSize*(this: ptr QTextDocument): QSizeF {.header:headerFile, importcpp:"#.pageSize(@)".} # Public
import nimqt/qtgui/qfont
proc setDefaultFont*(this: ptr QTextDocument, font: QFont) {.header:headerFile, importcpp:"#.setDefaultFont(@)".} # Public
proc defaultFont*(this: ptr QTextDocument): QFont {.header:headerFile, importcpp:"#.defaultFont(@)".} # Public
proc setSuperScriptBaseline*(this: ptr QTextDocument, baseline: cfloat) {.header:headerFile, importcpp:"#.setSuperScriptBaseline(@)".} # Public
proc superScriptBaseline*(this: ptr QTextDocument): cfloat {.header:headerFile, importcpp:"#.superScriptBaseline(@)".} # Public
proc setSubScriptBaseline*(this: ptr QTextDocument, baseline: cfloat) {.header:headerFile, importcpp:"#.setSubScriptBaseline(@)".} # Public
proc subScriptBaseline*(this: ptr QTextDocument): cfloat {.header:headerFile, importcpp:"#.subScriptBaseline(@)".} # Public
proc setBaselineOffset*(this: ptr QTextDocument, baseline: cfloat) {.header:headerFile, importcpp:"#.setBaselineOffset(@)".} # Public
proc baselineOffset*(this: ptr QTextDocument): cfloat {.header:headerFile, importcpp:"#.baselineOffset(@)".} # Public
proc pageCount*(this: ptr QTextDocument): cint {.header:headerFile, importcpp:"#.pageCount(@)".} # Public
proc isModified*(this: ptr QTextDocument): bool {.header:headerFile, importcpp:"#.isModified(@)".} # Public
import nimqt/qtcore/qurl
import nimqt/qtcore/qvariant
proc resource*(this: ptr QTextDocument, `type`: cint, name: QUrl): QVariant {.header:headerFile, importcpp:"#.resource(@)".} # Public
proc addResource*(this: ptr QTextDocument, `type`: cint, name: QUrl, resource: QVariant) {.header:headerFile, importcpp:"#.addResource(@)".} # Public
import nimqt/qtgui/qtextformat
import nimqt/qtcore/qlist
proc allFormats*(this: ptr QTextDocument): QList[QTextFormat] {.header:headerFile, importcpp:"#.allFormats(@)".} # Public
proc markContentsDirty*(this: ptr QTextDocument, `from`: cint, length: cint) {.header:headerFile, importcpp:"#.markContentsDirty(@)".} # Public
proc setUseDesignMetrics*(this: ptr QTextDocument, b: bool) {.header:headerFile, importcpp:"#.setUseDesignMetrics(@)".} # Public
proc useDesignMetrics*(this: ptr QTextDocument): bool {.header:headerFile, importcpp:"#.useDesignMetrics(@)".} # Public
proc setLayoutEnabled*(this: ptr QTextDocument, b: bool) {.header:headerFile, importcpp:"#.setLayoutEnabled(@)".} # Public
proc isLayoutEnabled*(this: ptr QTextDocument): bool {.header:headerFile, importcpp:"#.isLayoutEnabled(@)".} # Public
import nimqt/qtgui/qpainter
import nimqt/qtcore/qrect
# 1 default parameters!
proc drawContents*(this: ptr QTextDocument, painter: ptr QPainter, rect: QRectF) {.header:headerFile, importcpp:"#.drawContents(@)".} # Public
proc drawContents*(this: ptr QTextDocument, painter: ptr QPainter) {.header:headerFile, importcpp:"#.drawContents(@)".} # Public
proc setTextWidth*(this: ptr QTextDocument, width: cfloat) {.header:headerFile, importcpp:"#.setTextWidth(@)".} # Public
proc textWidth*(this: ptr QTextDocument): cfloat {.header:headerFile, importcpp:"#.textWidth(@)".} # Public
proc idealWidth*(this: ptr QTextDocument): cfloat {.header:headerFile, importcpp:"#.idealWidth(@)".} # Public
proc indentWidth*(this: ptr QTextDocument): cfloat {.header:headerFile, importcpp:"#.indentWidth(@)".} # Public
proc setIndentWidth*(this: ptr QTextDocument, width: cfloat) {.header:headerFile, importcpp:"#.setIndentWidth(@)".} # Public
proc documentMargin*(this: ptr QTextDocument): cfloat {.header:headerFile, importcpp:"#.documentMargin(@)".} # Public
proc setDocumentMargin*(this: ptr QTextDocument, margin: cfloat) {.header:headerFile, importcpp:"#.setDocumentMargin(@)".} # Public
proc adjustSize*(this: ptr QTextDocument) {.header:headerFile, importcpp:"#.adjustSize(@)".} # Public
proc size*(this: ptr QTextDocument): QSizeF {.header:headerFile, importcpp:"#.size(@)".} # Public
proc blockCount*(this: ptr QTextDocument): cint {.header:headerFile, importcpp:"#.blockCount(@)".} # Public
proc lineCount*(this: ptr QTextDocument): cint {.header:headerFile, importcpp:"#.lineCount(@)".} # Public
proc characterCount*(this: ptr QTextDocument): cint {.header:headerFile, importcpp:"#.characterCount(@)".} # Public
proc setDefaultStyleSheet*(this: ptr QTextDocument, sheet: QString) {.header:headerFile, importcpp:"#.setDefaultStyleSheet(@)".} # Public
proc defaultStyleSheet*(this: ptr QTextDocument): QString {.header:headerFile, importcpp:"#.defaultStyleSheet(@)".} # Public
proc undo*(this: ptr QTextDocument, cursor: ptr QTextCursor) {.header:headerFile, importcpp:"#.undo(@)".} # Public
proc redo*(this: ptr QTextDocument, cursor: ptr QTextCursor) {.header:headerFile, importcpp:"#.redo(@)".} # Public
proc clearUndoRedoStacks*(this: ptr QTextDocument, historyToClear: QTextDocument_Stacks) {.header:headerFile, importcpp:"#.clearUndoRedoStacks(@)".} # Public
proc maximumBlockCount*(this: ptr QTextDocument): cint {.header:headerFile, importcpp:"#.maximumBlockCount(@)".} # Public
proc setMaximumBlockCount*(this: ptr QTextDocument, maximum: cint) {.header:headerFile, importcpp:"#.setMaximumBlockCount(@)".} # Public
proc baseUrl*(this: ptr QTextDocument): QUrl {.header:headerFile, importcpp:"#.baseUrl(@)".} # Public
proc setBaseUrl*(this: ptr QTextDocument, url: QUrl) {.header:headerFile, importcpp:"#.setBaseUrl(@)".} # Public
import nimqt/qtcore/qnamespace
proc defaultCursorMoveStyle*(this: ptr QTextDocument): Qt_CursorMoveStyle {.header:headerFile, importcpp:"#.defaultCursorMoveStyle(@)".} # Public
proc setDefaultCursorMoveStyle*(this: ptr QTextDocument, style: Qt_CursorMoveStyle) {.header:headerFile, importcpp:"#.setDefaultCursorMoveStyle(@)".} # Public
proc contentsChange*(this: ptr QTextDocument, `from`: cint, charsRemoved: cint, charsAdded: cint) {.header:headerFile, importcpp:"#.contentsChange(@)".} # Public
proc contentsChanged*(this: ptr QTextDocument) {.header:headerFile, importcpp:"#.contentsChanged(@)".} # Public
proc undoAvailable*(this: ptr QTextDocument, arg_0: bool) {.header:headerFile, importcpp:"#.undoAvailable(@)".} # Public
proc redoAvailable*(this: ptr QTextDocument, arg_0: bool) {.header:headerFile, importcpp:"#.redoAvailable(@)".} # Public
proc undoCommandAdded*(this: ptr QTextDocument) {.header:headerFile, importcpp:"#.undoCommandAdded(@)".} # Public
proc modificationChanged*(this: ptr QTextDocument, m: bool) {.header:headerFile, importcpp:"#.modificationChanged(@)".} # Public
proc cursorPositionChanged*(this: ptr QTextDocument, cursor: QTextCursor) {.header:headerFile, importcpp:"#.cursorPositionChanged(@)".} # Public
proc blockCountChanged*(this: ptr QTextDocument, newBlockCount: cint) {.header:headerFile, importcpp:"#.blockCountChanged(@)".} # Public
proc baseUrlChanged*(this: ptr QTextDocument, url: QUrl) {.header:headerFile, importcpp:"#.baseUrlChanged(@)".} # Public
proc documentLayoutChanged*(this: ptr QTextDocument) {.header:headerFile, importcpp:"#.documentLayoutChanged(@)".} # Public
proc undo*(this: ptr QTextDocument) {.header:headerFile, importcpp:"#.undo(@)".} # Public
proc redo*(this: ptr QTextDocument) {.header:headerFile, importcpp:"#.redo(@)".} # Public
proc appendUndoItem*(this: ptr QTextDocument, arg_0: ptr QAbstractUndoItem) {.header:headerFile, importcpp:"#.appendUndoItem(@)".} # Public
# 1 default parameters!
proc setModified*(this: ptr QTextDocument, m: bool) {.header:headerFile, importcpp:"#.setModified(@)".} # Public
proc setModified*(this: ptr QTextDocument) {.header:headerFile, importcpp:"#.setModified(@)".} # Public

# Protected methods methods for QTextDocument
proc loadResource*(this: ptr QTextDocument, `type`: cint, name: QUrl): QVariant {.header:headerFile, importcpp:"#.loadResource(@)".} # Protected

export qfont
export qurl
export qtextformat
export qstring
export qsize
export qtextcursor
export qnamespace
export qlist
export qpainter
export qvariant
export qrect
export qflags
export qobject