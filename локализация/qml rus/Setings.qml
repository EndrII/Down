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
import Qt.labs.controls 1.0
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.4
Item {
    id:ab;
    signal exit();
    property string type: "Настройки";
    Rectangle{
        color:Qt.rgba(0.25,0.25,0.25,1);
        anchors.fill: parent;
    }
    Label{
        id:defL;
        width: parent.width/2;
        height: defaul.height;
        color:"white";
        background: Rectangle{
            color: Qt.rgba(0.20,0.20,0.20,1);
            anchors.fill: parent;
        }
        font.pixelSize: ab.width/25;
        verticalAlignment: Text.AlignVCenter;
        wrapMode: Text.Wrap;
        text:"Сложность :"
        anchors.top: parent.top;
        anchors.left: parent.left;
    }
    ComboBox{
        id:cmbo;
       // width: parent.width-defaul.width;
        height: defaul.height;
        currentIndex:settings.def;
        onCurrentIndexChanged: {
            switch(currentIndex){
            case 0: defaul.source="/image/res/izi.png"; break;
            case 1: defaul.source="/image/res/normal.png"; break;
            case 2: defaul.source="/image/res/hard.png"; break;
            default:break;
            }
        }
        model:["Легко","Нормально","Сложно"];
        anchors.left: defL.right;
        anchors.right: defaul.left;
    }
    Image{
        id:defaul;
        width: (parent.width<parent.height)?parent.width/4.5:parent.height/4.5;
        height: width;
        source: "/image/res/izi.png";
        anchors.top: parent.top;
        anchors.right: parent.right;
    }
    Label{
        id:rouL;
        width: defL.width;
        height: defL.height;
        color:"white";
        background: Rectangle{
            color: Qt.rgba(0.20,0.20,0.20,1);
            anchors.fill: parent;
        }
        font.pixelSize: ab.width/25;
        verticalAlignment: Text.AlignVCenter;
        wrapMode: Text.Wrap;
        text:"Управляемый обьект :"
        anchors.top:check.bottom;
        anchors.left: parent.left;
    }
    Image{
        id:round;
        width: defaul.width;
        height: width;
        source: "/image/res/izi.png";
        anchors.top: upr.bottom;
        anchors.right: parent.right;
    }
    ComboBox{
        id:cmboRound;
       // width: parent.width-defaul.width;
        height: round.height;
        currentIndex:settings.boal;
        model:["Легкий","Нормальный","Тяжелый"];
        onCurrentIndexChanged: {
            switch(currentIndex){
            case 0: round.source="/image/res/LightFakingBal1.png"; break;
            case 1: round.source="/image/res/Player.png"; break;
            case 2: round.source="/image/res/HeavyObjekt1.png"; break;
            default:break;
            }
        }
        anchors.right: round.left;
        anchors.top: check.bottom;
        anchors.left: rouL.right;
    }
    Label{
        id:check;
        //width: cmbo.width;
        height: cmbo.height;
        color:"white";
        background: Rectangle{
            color: Qt.rgba(0.20,0.20,0.20,1);
            anchors.fill: parent;
        }
        font.pixelSize: ab.width/19;
        verticalAlignment: Text.AlignVCenter;
        wrapMode: Text.Wrap;
        text:"Управление акселерометром :"
        anchors.right: upr.left;
        anchors.verticalCenter: upr.verticalCenter
        anchors.left:parent.left;
    }
    ECheck{
        id: upr;
        height: defaul.height;
        width: defaul.width;
        checed:settings.control;
        anchors.top:defaul.bottom;
        anchors.right: parent.right;
    }
    EButton{
        id: brek;
        width: (parent.width>parent.height)?parent.height*0.30:parent.width*0.30
        height: (parent.width>parent.height)?parent.height*0.30:parent.width*0.30
        text: "Назад"
        onComplit: {
            exit();
        }
        anchors.bottom: parent.bottom;
    }
    EButton{
        id: ok;
        width: brek.width;
        height:brek.height;
        text: "Приминить"
        onComplit: {
            settings.setDef(cmbo.currentIndex);
            settings.setBoal(cmboRound.currentIndex);
            settings.setControl(upr.checed);
            settings.appe();
            exit();
        }
        anchors.bottom: parent.bottom;
        anchors.right: parent.right;
    }
    EButton{
        id: def;
        width: brek.width;
        height:brek.height;
        text: "По умолчанию"
        onComplit: {
            settings.default_();
            upr.checed=settings.control;
            cmbo.currentIndex=settings.def;
            cmboRound.currentIndex=settings.boal;
        }
        anchors.bottom: parent.bottom;
        anchors.horizontalCenter:parent.horizontalCenter;
    }
}
