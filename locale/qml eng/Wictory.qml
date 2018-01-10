/****************************************************************************
**
** Copyright (C) 2016 A.N.Yankovich.
** Contact: https://vk.com/digitalface
**
** $QT_BEGIN_LICENSE:LGPL21$
** This file is distributed under the LGPL21 license.
**
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick 2.0
import QtQuick.Controls 1.4

Item {
    id:win;
    width: (parent.width>parent.height)?parent.height/2:parent.width/2;
    height: (parent.width>parent.height)?parent.height/2:parent.width/2;
    anchors.centerIn: parent;
    visible:false;
    property int rc: 0;
function win (pt){
    visible=true;
    rc=pt;
}
signal exit(var record);
Rectangle{
    color: "#ffffff"
    radius: 10;
    border.color: "#0a7bfb"
    Label{
        id:textl;
        font.pixelSize: 22
        font.italic: true
        color: "steelblue"
        wrapMode: Text.Wrap ;
        text: "you WIN!!  Record="+rc;
        anchors.fill: parent;
    }
    EButton{
        id: exit;
        text:"Exit";
        colorButton: Qt.rgba(1,0.3,0,1);
        height: parent.height/2;
        width: parent.width/2;
        x:0;
        y:parent.height-height;
        onComplit:{
            win.exit(rc);
        }
    }
    anchors.fill: parent;

}
}
