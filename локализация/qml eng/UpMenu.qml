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

import QtQuick 2.5
import QtQuick.Controls 1.4

Rectangle{
    border.color: "white";
    color:Qt.rgba(0.25,0.25,0.25,1);
    opacity: 0.75;
    radius: 10;
    visible:false;
    signal exit(var record);
    signal restart(var record);
    property int record_: 0;
    function up(record,lvl){
        visible=true;
        //focus=true;
        record_=record;
        txt.text="You defeat in -"+lvl+" lvl.\nPoints "+record;
    }

    Label{
        id:txt;
        font.pixelSize: parent.width/9;
        font.italic: true
        color: "white"
        wrapMode: Text.Wrap ;
       // text: "you Record: "+record;
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
            parent.exit(record_);
        }

    }
    EButton{
        id:restart;
        text:"Restart";
        colorButton: Qt.rgba(0,1,0.5,1);
        height: parent.height/2;
        width: parent.width/2;
        x:parent.width-width;
        y:parent.height-height;
        onComplit:{
            parent.restart(record_);
        }
    }
    width: (parent.width>parent.height)?parent.height/2:parent.width/2;
    height: (parent.width>parent.height)?parent.height/2:parent.width/2;
    anchors.centerIn: parent;

}
