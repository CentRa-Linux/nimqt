import math

import nimqt
import nimqt/[qplaintextedit,qwidget,qlineedit]
import nimqt/qtgui/qtextformat
import nimqt/qsyntaxhighlighter
import nimqt/qregularexpression

export qplaintextedit

nimqt.init

# Code adapted from https://doc.qt.io/qt-5/qtwidgets-widgets-codeeditor-example.html

QTextBlock.registerArgType
QRect.registerArgType

inheritQObject(CodeViewer, QPlainTextEdit):
    var lineNumberArea: ptr QWidget # define it as a widget, to avoid recursive dependency
    
    var disableLineNumbers: bool
    var disableCurLineIndicator: bool
    var highlighter: ptr QSyntaxHighlighter
    
    override_defer resizeEvent(e:ptr QResizeEvent):
        this.parent_resizeEvent(e)
        let cr=this.contentsRect()
        this.lineNumberArea.setGeometry(newQRect(cr.left, cr.top, this.lineNumberAreaWidth.cint, cr.height))
    
    slot_defer highlightCurrentLine():
        var extraSelections=newQList[qtextedit.QTextEdit_ExtraSelection]()
        if this.disableCurLineIndicator==false:
            if not this.isReadOnly():
                var selection:qtextedit.QTextEdit_ExtraSelection
                let lineColor=newQColor(Qt_GlobalColor.yellow).lighter(160)
                selection.format.addr.setBackground(newQBrush(lineColor, SolidPattern))
                selection.format.addr.setProperty(FullWidthSelection.cint, newQVariant(true))
                selection.cursor=this.textCursor()
                selection.cursor.clearSelection()
                extraSelections.append selection
        this.setExtraSelections(extraSelections)
    
    slot_defer updateLineNumberAreaWidth(newBlockCount:int) :
        this.doSetViewportMargins(this.lineNumberAreaWidth.cint, 0.cint, 0.cint, 0.cint)
    
    slot_defer updateLineNumberArea(rect:const_var QRect, dy:int):
        if dy!=0: this.lineNumberArea.scroll(0.cint, dy.cint)
        else: this.lineNumberArea.update(0.cint, rect.y, this.lineNumberArea.width, rect.height)
        
        if rect.contains(this.viewport.rect): this.updateLineNumberAreaWidth(0)
    
    # We declare these as "members". They will receive a "friend" status, so within this "member" function
    # we can call protected functions for this class.
    # NOTE: QWidget's get_sender could also be implemented like this, but for convenience, we added it to the
    # core of nimqt.
    member getFirstVisisbleBlock(): QTextBlock: this.firstVisibleBlock
    member getContentOffset(): QPointF: this.contentOffset
    member getBlockBoundingGeometry(tblock:ptr QTextBlock): QRectF: this.blockBoundingGeometry(tblock[])
    member getBlockBoundingRect(tblock:ptr QTextBlock): QRectF: this.blockBoundingRect(tblock[])
    member doSetViewportMargins(left:int,top:int,right:int,bot:int): this.setViewportMargins(left,top,right,bot)

proc lineNumberAreaWidth(this:ptr CodeViewer, charWidth=20):int =
    if this.disableLineNumbers: 0
    else: (log(max(1,this.blockCount.int).float,charWidth.float)*charWidth.float).int

proc lineNumberAreaPaintEvent(this:ptr CodeViewer, e: ptr QPaintEvent) =
    const
        HEIGHT=12
        LINE_OFFSET=0
    let
        painter=newQPainter(cast[ptr QPaintDevice](this.lineNumberArea))
        currentLine=this.textCursor.blockNumber
    painter.fillRect(e.rect, lightGray)
    
    var
        tblock=this.getFirstVisisbleBlock
        blockNumber=tblock.blockNumber
        top=this.getBlockBoundingGeometry(tblock.addr).translated(this.getContentOffset).top
        bottom=top+this.getBlockBoundingRect(tblock.addr).height
    
    while tblock.isValid and top<e.rect.bottom.cfloat:
        if tblock.blockNumber==currentLine and this.disableCurLineIndicator==false:
            painter.setPen(newQColor(Qt_GlobalColor.red))
        else:
            painter.setPen(newQColor(Qt_GlobalColor.black))
            
        if tblock.isVisible and bottom >= e.rect.top.cfloat:
            painter.drawText(0.cint, top.cint, this.lineNumberArea.width.cint, HEIGHT.cint, AlignRight.cint, Q($(blockNumber+LINE_OFFSET)))
        
        tblock=tblock.next
        top=bottom
        bottom=top+this.getBlockBoundingRect(tblock.addr).height
        blockNumber.inc
    discard painter.end()
    



inheritQObject(LineNumberArea, QWidget):
    var viewer:pointer # It is less hassle to just declare it as a pointer, and cast it to a CodeViewer when needed.
    
    const_override_defer sizeHint(): QSize:
        newQSize(cast[ptr CodeViewer](this.viewer).lineNumberAreaWidth().cint, 0.cint)
        
    override_defer paintEvent(e: ptr QPaintEvent):
        cast[ptr CodeViewer](this.viewer).lineNumberAreaPaintEvent(e)


type
    HLRule* = tuple[pattern:QRegularExpression, format:ptr QTextCharFormat]

func setForegroundColorFormat*[T](c:T): ptr QTextCharFormat =
    result=newQTextCharFormat()
    result.setForeground(newQBrush(newQColor(c), SolidPattern))

proc addHLRule*(rules:var seq[HLRule], rgx:string, clr:Qt_GlobalColor) =
    rules.add( (
            pattern:newQRegularExpression(Q rgx),
            format: setForegroundColorFormat(clr)
        ))

proc simpleCppRules*():seq[HLRule] =
    result.addHLRule("#(define|ifdef|ifndef|elif|else|include) [^\n]+", Qt_GlobalColor.darkgreen)
    result.addHLRule("(^|[^a-zA-Z])(bool|void|int|long|double|float|uint|char|string|vector)[^a-zA-Z]", Qt_GlobalColor.darkblue)
    result.addHLRule("(^|[^a-zA-Z])(auto|break|case|catch|class|const|consteval|constexpr|const_cast|continue|default|delete|do|if|else|enum|for|friend|inline|mutable|namespace|new|private|protected|public|return|sizeof|static|struct|switch|template|throw|typename|union|using|virtual|volatile|while)[^a-zA-Z]", Qt_GlobalColor.darkblue)
    result.addHLRule("(^|[^a-zA-Z])(std::)?(cout|cin|endl)[^a-zA-Z]", Qt_GlobalColor.blue)
    result.addHLRule("//[^\n]*", Qt_GlobalColor.gray)
    
var rules=simpleCppRules()

inheritQObject(Highlighter, QSyntaxHighlighter):
    # We define here a custom constructor that accepts the parent document.
    # This code will generate a new method newHighlighter(parent:QTextDocument) which will
    # resolve to something like
    # `Highlighter(QTextDocument *parent): QSyntaxHighlighter(parent) { }`
    # This is necessary in this case, because the QSyntaxHighlighter requires a parent document.
    # (The default constructor does not accept any arguments)
    # Note that we can not add a body to a constructor, it will just call its parent's constructor
    # initializer.
    constructor(parent:ptr QTextDocument)
    
    var disableHighlighting:bool
    
    # setFormat is protected. By defining mem_setFormat, and calling setFormat from within the member function,
    # we circumvent this protected visibility.
    member mem_setFormat(start:int, count:int, format:var QTextCharFormat): this.setFormat(start, count, format)
    
    override_defer highlightBlock(text:const_var QString):
        if this.disableHighlighting: return
        for rule in rules:
            #echo rule
            let matchIterator=rule.pattern.globalMatch(text)
            #echo "  ",matchIterator.hasNext
            while matchIterator.hasNext:
                let match=matchIterator.next
                #echo "  ",match.capturedStart," ",match.capturedLength
                this.mem_setFormat(match.capturedStart, match.capturedLength, rule.format[])

proc enableHighlighting*(cv: ptr CodeViewer, enable:bool) =
    cast[ptr Highlighter](cv.highlighter).disableHighlighting=not enable
    cv.highlighter.rehighlight
proc enableLineNumbers*(cv: ptr CodeViewer, enable:bool) = 
    cv.disableLineNumbers=not enable
    cv.updateLineNumberAreaWidth(0)
proc enableCurLineIndicator*(cv: ptr CodeViewer, enable:bool) =
    cv.disableCurLineIndicator=not enable
    cv.highlightCurrentLine
    
#[
To use CodeViewer in your own code, you have to do the following:

```
import code_viewer
code_viewer.import_CodeViewer()

...

let txtSourceViewer = newCodeViewer2()
# Do stuff with txtSourceViewer
```

NOTE: to get the full code viewer, call `newCodeViewer2`, not `newCodeViewer`.
]#
proc newCodeViewer2*(): ptr CodeViewer =
    result=newCodeViewer()
    
    # Attach a highlighter to the editor
    result.highlighter=newHighlighter(result.document)
    
    # Create and set the line number area
    result.lineNumberArea=newLineNumberArea()
    cast[ptr LineNumberArea](result.lineNumberArea).viewer=cast[pointer](result)
    result.lineNumberArea.setParent(result)
    
    result.connect(SIGNAL "blockCountChanged(int)", result, SLOT "updateLineNumberAreaWidth(int)")
    # NOTE: updateLineNumberArea must use a "const_var QRect", as we have a "QRect &" here
    result.connect(SIGNAL "updateRequest(const QRect&, int)", result, SLOT "updateLineNumberArea(const QRect&,int)")
    result.connect(SIGNAL "cursorPositionChanged()", result, SLOT "highlightCurrentLine()")
    
    result.updateLineNumberAreaWidth(0)
    result.highlightCurrentLine()

nimqt.insertAllSlotImplementations
