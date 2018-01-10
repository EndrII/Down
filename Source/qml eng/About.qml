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
    property string type: "about";
    Rectangle{
        color:Qt.rgba(0.25,0.25,0.25,1);
        anchors.fill: parent;
    }
    Image{
        x:0;
        y:0;
        width: parent.width;
        height: parent.height*0.2;
        fillMode: Image.PreserveAspectFit
        source:"/image/res/LOGO.png";
    }
    Label{
        id:txt;
        x:0;
        y:parent.height*0.2;
        width: parent.width;
        height: parent.height*0.7;
        color:"white";
        font.pixelSize: (ab.width<ab.height)?ab.width/15:ab.height/15;
        font.italic: true
        wrapMode: Text.Wrap;
        text:"Product DigitalFace
* Developers:
* Programmer: Yankovich N. Andrei.
* Graphics: Oleg I. Chernenkov.
* Sound: Roman N. Yankovich.
* This game is distributed under the LGPLv3 license.
* Contact: https://vk.com/digitalface
* Copyright (C) 2016 Yankovich N. Andrei."
    }
    MouseArea{
        anchors.fill: parent;
        onClicked:  {
            parent.exit();
        }
    }
}
