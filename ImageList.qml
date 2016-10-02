import QtQuick 2.0
import Qt.labs.folderlistmodel 2.1
Item {
    id:root
    
    anchors.fill: parent
    property int rad:5
    property int maxlines: 8
    property int fontPixelSize: 12
    property bool welcomeMessageEnabled: true
    property string welcomeMessage: "Hello this is ax demonstration of your debugger..... enjoy!"
    
    signal imageSourceClicked(var source)
    
    
    FolderListModel {
        id:thumbModel
        nameFilters: ["*.png"]
        showHidden: false
    }
    
    Component {
        id:thumbnailDelegate
        Item{
            height: root.height / root.maxlines
            width: root.width
            y:root.height - height
            Rectangle {
                height: parent.height * .80
                width: parent.width * .65
                id:pictureThumbNail
                anchors.left: pictureName.right
                anchors.margins: parent.width*.01
                clip:true
                
                color:"#00000000"
                border.color: "lightgreen"
                radius:root.rad
                
                Image{
                    id:itemImage
                    anchors.margins: parent.height*.025
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    source: thumbModel.folder+"/"+fileName
                    sourceSize.height: parent.height*.95
                }
            }
            Rectangle {
                id:pictureName
                height: parent.height * .80
                width: parent.width * .30
                color:"black"
                border.color:"lightgreen"
                radius: root.rad
                clip:true
                Text {
                    anchors.fill: parent
                    text:fileName
                    color:"green"
                    font.pixelSize: root.fontPixelSize
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        imageSourceClicked(itemImage.source)
                        thumbnailView.visible = false
                        
                    }
                }
            }
        }
    }
    ListView {
        id: thumbnailView
        anchors.fill: parent
        model:thumbModel
        delegate: thumbnailDelegate
        
    }
    
    function debugViewAdd(aPathToImage){
        thumbModel.folder = aPathToImage.toString()
    }
    
    
}
