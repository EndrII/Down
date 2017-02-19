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
import QtQuick.Window 2.2
import QtMultimedia 5.5
import Read 1.0
import Setting 1.0
Window {
    property bool activeM:true;
    onActiveChanged: {
        var i=activeM;
        var j=active;
            mpalyer.volume=activeM&&active;
    }
    visible: true
    height:400;
    width:800;
  /*  EButton{
        text: "Start"
        onActivated: {
        Qt.quit()}
        //Qt.quit()}
    }*/
    function start(){
       core.source="GamePlay.qml";
    }
    function help(){
        core.source="Help.qml";
    }
    property int  rec: 0;
    function stop(obj){
        core.source="pause.qml";
        read.setRecord(obj);
        core.item.record=(read.record);
    }
    function stop2(obj){
        read.setRecord(obj);
        //core.item.record=read.record;
    }
    function back(){
        core.source="pause.qml"
    }
    function about(){
        core.source="About.qml"
    }
    function setting(){
        core.source="Setings.qml"
    }
    Read{
        id:read;
        readRecord:true;
    }
    MediaPlayer{
        id:mpalyer;

       // bufferProgress:0.1;
        function setvalue(is){
           activeM=volume=is;
        }
        //hasAudio:true;
       /* onStopped: {
            source=source;
        }*/
        autoPlay: true;
        loops:2;

        source:"/sounds/sounds/MenuTrack.mp3";
        /*onSourceChanged: {
            play();
        }*/
    }
    Setting{
        id:settings;
    }
    Loader{
        id:core;
        source: "pause.qml";
        anchors.fill: parent;
        onLoaded: {
            if(item.type==="game"){
                item.maketa.connect(stop);
                item.restar.connect(stop2);
                item.start();
                //settings.setControl()
            }
            if(item.type==="pause"){
                item.start.connect(start);
                item.help.connect(help);
                item.record=read.record;
                item.click.connect(mpalyer.setvalue);
                item.about.connect(about);
                item.sett.connect(setting);

            }
            if(item.type==="about"||item.type==="help"||
                    item.type==="setings"){
                item.exit.connect(back);
            }
            if(item.type==="pause")
                mpalyer.source="/sounds/sounds/MenuTrack.mp3";
            else mpalyer.source="/sounds/sounds/DigitalFace.mp3";
            //if(item.type==="pause")item.setRecord(rec);
        }
    }

}

