import QtQuick 2.0
MouseArea{
    
    id:selectionMouseArea
    anchors.fill: parent
    property Rectangle selectionRectangle
    property int initialXPos
    property int initialYPos
    property bool justStarted
    
    enabled: false
    function adjustRectangle(s,f){
        
        selectionRectangle.width    = Math.abs(f.x - s.x)
        selectionRectangle.height   = Math.abs(f.y - s.y)
        
        if (s.x < f.x && s.y < f.y) {
            //case 1: tl,br
            selectionRectangle.x = s.x
            selectionRectangle.y = s.y                
        } else if (s.x < f.x && s.y>f.y){
            //case 2: bl, tr
            selectionRectangle.x = s.x
            selectionRectangle.y = f.y
        } else if (s.x > f.x && s.y < f.y) {
            //case 3: tr, bl
            selectionRectangle.x = f.x
            selectionRectangle.y = s.y
        } else {
            //case 4: br, tl
            selectionRectangle.x = f.x
            selectionRectangle.y = f.y
        }
    }
    
    onPressed: {
        
        if (mouse.button == Qt.LeftButton /*&& mouse.modifiers & Qt.ShiftModifier*/)
        {
            //console.log("Mouse area shift-clicked !")
            // initialize local variables to determine the selection orientation
            initialXPos = mouse.x
            initialYPos = mouse.y
            justStarted = true
            
            //flickableView.interactive = false // in case the event started over a Flickable element
            adjustRectangle(Qt.point(initialXPos,initialYPos),Qt.point(mouse.x,mouse.y))
            
        }
    }
    onPositionChanged: {
        if (selectionRectangle.visible == true)
        {
            if (/*justStarted == true && */(mouse.x != initialXPos || mouse.y != initialYPos))
            {
                adjustRectangle(Qt.point(initialXPos,initialYPos),Qt.point(mouse.x,mouse.y))
                console.log(Qt.point(initialXPos,initialYPos),Qt.point(Math.floor(mouse.x),Math.floor(mouse.y)))
                justStarted = false
            }
            
        }
    }
    onReleased: {
        //selectionRectangle.visible = false
        // restore the Flickable duties
        //flickableView.interactive = true
        selectionRectangle.visible = false
        blit.retrieveImage(editionImage,initialXPos,initialYPos,Math.floor(mouse.x),Math.floor(mouse.y))
        selectionRectangle.visible = true
    }
}    
