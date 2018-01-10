/****************************************************************************
**
** Copyright (C) 2016 A.N.Yankovich.
** Contact: https://vk.com/digitalface
**
** $QT_BEGIN_LICENSE:LGPLv3$
** This file is distributed under the LGPLv3 license.
**
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick 2.5
import QtQuick.Controls 1.4

Item {

    id:ab;
    signal exit();
    property string type: "help";
    Rectangle{
        color:Qt.rgba(0.25,0.25,0.25,1);
        anchors.fill: parent;
    }
    Label{
        id:txt1;
        x:0;
        y:0;
        width: parent.width;
        height: parent.height*0.25;
        color:"white";
        font.pixelSize: ab.width/40;
        font.italic: true
        wrapMode: Text.Wrap;
        text:"Ваша цель состоит в том, чтобы падать вниз в недра планеты!
Если вы ноходетесь слишком высоко или слишком низко, то вы проиграете.
Со временем, будет появляться платформы с разными цветами, каждая платформа имеет определенный эффект: "
    }
    Image{
        x:0;
        y:parent.height*0.25;
        width: (parent.height<parent.width)?parent.height*0.1:parent.width*0.1;
        height: (parent.height<parent.width)?parent.height*0.1:parent.width*0.1;
        source:"/image/res/1.png";
    }
    Label{
        id:txt;
        x:(parent.height<parent.width)?parent.height*0.15:parent.width*0.15;
        y:parent.height*0.25;
        width: parent.width*0.8;
        height: (parent.height<parent.width)?parent.height*0.1:parent.width*0.1;
        color:"white";
        font.pixelSize: ab.width/35;
        font.italic: true
        wrapMode: Text.Wrap;
        text:" Нет эффекта. "
    }
    Image{
        x:0;
        y:parent.height*0.25+((parent.height<parent.width)?parent.height*0.13:parent.width*0.13);
        width: (parent.height<parent.width)?parent.height*0.1:parent.width*0.1;
        height: (parent.height<parent.width)?parent.height*0.1:parent.width*0.1;
        source:"/image/res/2.png";
    }
    Label{
        id:txt2;
        x:(parent.height<parent.width)?parent.height*0.15:parent.width*0.15;
        y:parent.height*0.25+((parent.height<parent.width)?parent.height*0.13:parent.width*0.13);
        width: parent.width*0.8;
        height: (parent.height<parent.width)?parent.height*0.1:parent.width*0.1;
        color:"white";
        font.pixelSize: ab.width/35;
        font.italic: true
        wrapMode: Text.Wrap;
        text:" При нахождении на платформе очки снижаются."
    }
    Image{
        x:0;
        y:parent.height*0.25+2*((parent.height<parent.width)?parent.height*0.13:parent.width*0.115);
        width: (parent.height<parent.width)?parent.height*0.1:parent.width*0.1;
        height: (parent.height<parent.width)?parent.height*0.1:parent.width*0.1;
        source:"/image/res/3.png";
    }
    Label{
        id:txt3;
        x:(parent.height<parent.width)?parent.height*0.15:parent.width*0.15;
        y:parent.height*0.25+2*((parent.height<parent.width)?parent.height*0.13:parent.width*0.115);
        width: parent.width*0.8;
        height: (parent.height<parent.width)?parent.height*0.1:parent.width*0.1;
        color:"white";
        font.pixelSize: ab.width/35;
        font.italic: true
        wrapMode: Text.Wrap;
        text:" Находясь на платформе вы набираете больше очков. "
    }
    Image{
        x:0;
        y:parent.height*0.25+3*((parent.height<parent.width)?parent.height*0.13:parent.width*0.115);
        width: (parent.height<parent.width)?parent.height*0.1:parent.width*0.1;
        height: (parent.height<parent.width)?parent.height*0.1:parent.width*0.1;
        source:"/image/res/4.png";
    }
    Label{
        id:txt4;
        x:(parent.height<parent.width)?parent.height*0.15:parent.width*0.15;
        y:parent.height*0.25+3*((parent.height<parent.width)?parent.height*0.13:parent.width*0.115);
        width: parent.width*0.8;
        height: (parent.height<parent.width)?parent.height*0.1:parent.width*0.1;
        color:"white";
        font.pixelSize: ab.width/35;
        font.italic: true
        wrapMode: Text.Wrap;
        text:" Телепортирует вас на другую платформу "
    }
    Image{
        x:0;
        y:parent.height*0.25+4*((parent.height<parent.width)?parent.height*0.13:parent.width*0.115);
        width: (parent.height<parent.width)?parent.height*0.1:parent.width*0.1;
        height: (parent.height<parent.width)?parent.height*0.1:parent.width*0.1;
        source:"/image/res/5.png";
    }
    Label{
        id:txt5;
        x:(parent.height<parent.width)?parent.height*0.15:parent.width*0.15;
        y:parent.height*0.25+4*((parent.height<parent.width)?parent.height*0.13:parent.width*0.115);
        width: parent.width*0.8;
        height: (parent.height<parent.width)?parent.height*0.1:parent.width*0.1;
        color:"white";
        font.pixelSize: ab.width/35;
        font.italic: true
        wrapMode: Text.Wrap;
        text:" Платформа замирает на месте в течение некоторого времени. "
    }
    Image{
        x:0;
        y:parent.height*0.25+5*((parent.height<parent.width)?parent.height*0.13:parent.width*0.115);
        width: (parent.height<parent.width)?parent.height*0.1:parent.width*0.1;
        height: (parent.height<parent.width)?parent.height*0.1:parent.width*0.1;
        source:"/image/res/6.png";
    }
    Label{
        id:txt6;
        x:(parent.height<parent.width)?parent.height*0.15:parent.width*0.15;
        y:parent.height*0.25+5*((parent.height<parent.width)?parent.height*0.13:parent.width*0.115);
        width: parent.width*0.8;
        height: (parent.height<parent.width)?parent.height*0.1:parent.width*0.1;
        color:"white";
        font.pixelSize: ab.width/35;
        font.italic: true
        wrapMode: Text.Wrap;
        text:" Замедленное перемещение ао платформе "
    }
    MouseArea{


        anchors.fill: parent;
            onClicked: {
                parent.exit();

            }
    }
}
