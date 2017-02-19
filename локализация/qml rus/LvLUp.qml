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
Rectangle {
    opacity: 0.75;
    id:lvlup;
    height: parent.height*0.15;
    width:  parent.width*0.4;
    //source: "/image/LVLDown.gif";
   // opacity: 0.2;
    radius: 10;
    color:Qt.rgba(0.25,0.25,0.25,1);
//    playing: true;
    function start(lvl){
        txt.text="LEVEL DOWN -"+lvl;
        x=-parent.width;
        y=parent.height/2-height/2;
        ani.to=parent.width*2;
        ani.start();
    }
    Label{
        id:txt;
        font.italic: true;
        font.pixelSize: parent.width/8;
        color: Qt.rgba(1,1,1,1);
        anchors.centerIn: parent;
    }
    NumberAnimation {
        id:ani;
        target: lvlup
        property: "x"
        duration: 3000
        //easing.type: Easing.InOutQuad
    }

}
