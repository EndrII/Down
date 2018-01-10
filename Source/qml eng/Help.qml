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
        text:"Your goal is to drop down to the bowels of the planet!
If you go up too high or falls too low then you lose.
Over time, the platform will appear with different colors, each platform has a certain effect: "
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
        text:" No effect. "
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
        text:" The sharp decrease in score."
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
        text:" The sharp increase in the score. "
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
        text:" Teleports you. "
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
        text:" Platform freezes in place for some time. "
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
        text:" Platform slows you down. "
    }
    MouseArea{


        anchors.fill: parent;
            onClicked: {
                parent.exit();

            }
    }
}
