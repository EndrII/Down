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
Item {
    id:pause;
    signal start();
    signal exit();
    signal click(var is);
    signal about();
    signal sett();
    signal help();
    property int record:0;
    property string type: "pause";
    /*function setRecord(rec){
        read.setRecord(rec);
    }
    Read{
        id:read;
        onRecordChanged: {
            textl.text="you Record: "+read.record;
        }
    }*/
    onRecordChanged:{
        textl.text="Рекорд: "+record;
    }

    Rectangle{
        color:Qt.rgba(0.25,0.25,0.25,1);
        anchors.fill: parent;
    }
    Rectangle{
        color:Qt.rgba(0.25,0.25,0.25,1);
      //  x:0;
     //   y:0;
       // width: parent.width/2;
        height: help.height;
        Label{
            id:textl;
            font.pixelSize: pause.width/15;
            font.italic: true
            color:"white"
            wrapMode: Text.Wrap ;
            text: "Рекорд: "+record;
            anchors.centerIn : parent;
        }
        anchors.left: about.right;
        anchors.right: audio.left;
    }
    Image{
        id: audio;
        width: (parent.width>parent.height)?parent.height*0.2:parent.width*0.2;
        height: (parent.width>parent.height)?parent.height*0.2:parent.width*0.2;
        x:parent.width-width;
        y:0;
        property bool chec: true;
        source: (chec)?"/image/res/sound2.png":"/image/res/sound.png";
        MouseArea{
            onClicked: {
                parent.chec=!parent.chec;
                pause.click(parent.chec);
            }
            anchors.fill: parent;
        }
    }
    Image{
        id: help;
        width: (parent.width>parent.height)?parent.height*0.2:parent.width*0.2;
        height: (parent.width>parent.height)?parent.height*0.2:parent.width*0.2;
        x:0;
        y:0;
        source: "/image/res/help.png"
        MouseArea{
            onClicked: {
                pause.help();
            }
            anchors.fill: parent;
        }
    }
    Image{
        id: about;
        width: help.width;
        height: help.height;
        source: "/image/res/about_img.png"
        MouseArea{
            onClicked: {
                pause.about();
            }
            anchors.fill: parent;
        }
        anchors.left: help.right;
    }
    EButton{
        x:(parent.width>parent.height)?parent.width/3*2:0;
        y:parent.height*0.20;
        width: (parent.width>parent.height)?parent.width/3:parent.width;
        height: (parent.width>parent.height)?parent.height*0.80:parent.height*0.26;
        id: button_start;
        text:"Начать";
        onComplit: {
            start();
        }
    }

    EButton{
        x:(parent.width>parent.height)?parent.width/3:0;
        y:(parent.width>parent.height)?parent.height*0.20:parent.height*0.46;
        width: (parent.width>parent.height)?parent.width/3:parent.width;
        height: (parent.width>parent.height)?parent.height*0.80:parent.height*0.26;
        text:"Настройки";

        id:abo;
        onComplit:{
            sett();
        }
    }
    EButton{
        x:0;
        y:(parent.width>parent.height)?parent.height*0.20:parent.height*0.72;
        width: (parent.width>parent.height)?parent.width/3:parent.width;
        height: (parent.width>parent.height)?parent.height*0.80:parent.height*0.26;
        text:"Выход";

        id:exitB;
        onComplit:{
            Qt.quit();
        }
    }

}
