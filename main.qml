import QtQuick 2.7
import QtQuick.Window 2.0
import QtQuick.Dialogs 1.2
import QtQuick.Controls 1.5
import QtGraphicalEffects 1.0
import Qt.labs.folderlistmodel 2.1
import com.autoformax.blit 1.0


ApplicationWindow {
    visible: true
    modality: Qt.WindowModal
    flags: Qt.Window | Qt.WindowTitleHint | Qt.CustomizeWindowHint
    x:0
    y:0
    width: Screen.width
    height: Screen.height
    title: qsTr("Visor de Plantillas")
    color:"black"
    
    ImageList{
        id:root
        onImageSourceClicked: {
            editionImage.source = source
            console.log(source.toString())
            editionRectangle.visible = true
            selectionMouseArea.enabled = true
        }
    }

    FileDialog{
        id:chooseDirectory
        selectFolder: true
        title:"Select File Server"
        onAccepted: {
            //console.log(chooseDirectory.folder)
            root.debugViewAdd(chooseDirectory.folder)
            visible = false
            mouseAreaGeneral.enabled = false
        }
        onRejected: {
            visible = false
        }
    }
    MouseArea{
        id:mouseAreaGeneral
        enabled: true
        anchors.fill: parent
        onClicked: {
            chooseDirectory.visible = true
        }
    }
    
    Rectangle{
        id:editionRectangle
        visible:false
        width:parent.width*.45
        height:parent.height*.45
        anchors.margins: parent.width*.0025
        anchors.centerIn: parent
        Image{
            anchors.fill: parent
            fillMode: Image.PreserveAspectFit
            id:editionImage
            onSourceChanged: {
                /*width:sourceSize.width
                height:sourceSize.height*/
                sourceSize=undefined
                console.log(width,height)
                console.log(sourceSize)
            }            
        }
        Rectangle{
            id:selectionRectangle
            width:0
            height:0
            color:"#304444ff"
            border.width: 1
            border.color: "red"
        }
        
    }
    
    MouseSelector{
        anchors.fill:editionRectangle
        selectionRectangle: selectionRectangle
    }
    
    Blit{
        id:blit
    }
    
    
    
}


