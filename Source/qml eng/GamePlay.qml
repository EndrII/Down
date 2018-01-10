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
import QtQuick.Controls 1.4;
import Setting 1.0;
Item {
    id: gamePlay;
    property string type: "game";
    signal maketa(var record);
    signal restar(var record);
    function start(){
        play.start();
        bg.mov();
    }
    function restart(){

       winMenu.visible=upMenu.visible=false;
       // upMenu.deleteLater();

        play.y=0;
        play.x=parent.width/2;
        play.stop();
        play.downm=0;
        play.start();
        bg.stop();
        bg.mov();
    }

    BackGround{
        id:bg;
        source:"/image/res/fone.png";
        on_Final: {
            winMenu.win(play.record);
        }
    }
    Player{
        id:play;
       // mode:1;
        x:parent.width/2;
        y:0;
        onDead: {
            upMenu.up(obj,lvl);
            //maketa(obj);
            bg.stop();
        }
        onLvlUp:{
            lv.start(lvl);
        }
    }
    LvLUp{
        id:lv;
        x:-10000;
    }
    focus:true
    /*Keys.Pressed: {
        if(event.key===Qt.Key_Left){
            play.movL=true;
        }
        if(event.key===Qt.Key_Right){
            play.movR=true;
        }
    }
    Keys.onReleased: {
        if(event.key===Qt.Key_Left){
            play.movL=false;
        }
        if(event.key===Qt.Key_Right){
            play.movR=false;
        }
    }*/
        MouseArea{
            id:left;
            height: parent.height;
            width: parent.width/2;
            x:0;
            y:0;

            onReleased: {
                play.movL=false;
            }
            onPressed: {
                play.movL=true;
            }
        }
    MouseArea{
        id:right;
        height: parent.height;
        width: parent.width/2;
        x:parent.width/2;
        y:0;
        onReleased: {
            play.movR=false;
        }
        onPressed: {
            play.movR=true;
        }
    }

    Rectangle{
        x:0;y:0;
        opacity: 0.75;
        radius:10;
        width:parent.width*0.25;
        height:parent.height*0.09;
        color:Qt.rgba(0.25,0.25,0.25,1);
        Label{
            id:record;
          //  x:0;y:0;
          //  width:parent.width;
          //  height:parent.height*0.15;
            color:Qt.rgba(1,1,1,1);
            font.italic: true;
            font.pixelSize: gamePlay.width/25;
            wrapMode: Text.Wrap;
            text:"Points "+play.record;
            anchors.centerIn: parent;
        }
    }
    Rectangle{
        id: leftlvl;
        opacity: 0.75;
        x:parent.width-leftlvl.width;y:0;
        radius:10;
        width:parent.width*0.20;
        height:parent.height*0.09;
        color:Qt.rgba(0.25,0.25,0.25,1);
        Label{
            id:lvll;
          //  x:0;y:0;
          //  width:parent.width;
          //  height:parent.height*0.15;
            color:Qt.rgba(1,1,1,1);
            font.italic: true;
            font.pixelSize: gamePlay.width/25;
            wrapMode: Text.Wrap;
            text:"LVL -"+play.lvl;
            anchors.centerIn: parent;
        }
    }

    UpMenu{
        id:upMenu;
        onExit: {
            maketa(record);
        }
        onRestart:{
           // maketa(record);
            restar(record);
            parent.restart();
        }

    }
    Wictory{
        id:winMenu;
        onExit: {
            maketa(record);
        }
    }
    }
