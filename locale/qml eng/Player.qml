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
import QtSensors 5.0
import Setting 1.0;
Image{
        id:player;
        height: 0.1*((gamePlay.height>gamePlay.width)?gamePlay.width:gamePlay.height);
        width: 0.1*((gamePlay.height>gamePlay.width)?gamePlay.width:gamePlay.height);
        z:0.00001;
        //playing: false;
        source: settings.boalSet();
        property double speed: 0.1;
        property int lvl: 1;
        property int record:0;
        property int mode:acsi.active;//0 - button mode, 1- accelerometr mode
        property bool movR: false;
        property bool movL: false;
        property bool movD: true;
        property bool effects_slou:false;
        property bool effects_gold:false;
        property bool effects_time_lov: false;
        property double downm :0;
        property var elements: [];
        signal lvlUp(var lvl);
        signal dead(var obj,var lvl);
        function createObject(){
            var temp =Qt.createComponent("Balka.qml");
            if(temp.status === Component.Ready){
                var obj=temp.createObject(parent);
                obj.spead=(10000-lvl*200)/3.5; //obj.spead=(10000-lvl*100)/3.5;
                elements.push(obj);
                obj.z=-0.0001;
            }
        }
        Accelerometer{
            id: acsi;
            Component.onCompleted: start();
        }
        Setting{
            id:settings;
            function boalSet(){
                switch(boal){
                case 0: return "/image/res/LightFakingBal1.png";
                case 1: return "/image/res/Player.png";
                case 2: return "/image/res/HeavyObjekt1.png";
                default:
                }
            }
        }
    /*Timer{
        id:fromeffect;
        repeat:false;
        interval:5000;
        onTriggered: {
            speadChang();
        }
    }*/
    Timer{
        id:gameBalkaTimer;
        property int index: 0
        interval: (10000-lvl*200)/20;
        repeat:true;
        onTriggered: {
            var temp=(Math.random()*1000)%6;
            for(var i=0;i<temp;i++){
                elements[(index++)%elements.length].create(temp+1,lvl);
            }
        }
    }
    Timer{
        id:renderTimer;
        property int timer: 0
        property int index: 0
        property double mov: 0;
        interval: 16;
        repeat: true;
        onTriggered: {
            record+=lvl+lvl*effects_gold;
             if(movD)
                 downm+=0.07;
             else
                 downm=0;
             mov=0;
             if(movR&&mode==0){
                 mov+=0.5-(effects_slou*0.4);
                 player.rotation+=10-(effects_slou*8);
             }
             if(movL&&mode==0){
                 mov-=0.5-(effects_slou*0.4);
                 player.rotation-=10-(effects_slou*8);
             }
             if(mode==1){
                 mov=(acsi.reading.x>acsi.reading.y)?acsi.reading.y*2/(5+(effects_slou*10)):acsi.reading.x*2/(-5-(effects_slou*10));
                 var test=(acsi.reading.x>acsi.reading.y)?acsi.reading.y*4/(1+effects_slou*3):acsi.reading.x*-4/(1+effects_slou*3);   //=10-(effects_slou*8);
                 player.rotation+=test;
             }
            player.y+=(downm*gamePlay.height*interval/1000);
            player.x+=(mov*gamePlay.width*interval/1000);
             movD=true;
             effects_gold=false;
             effects_time_lov=false;
             effects_slou=false;
             if(player.y>=gamePlay.height*1.2){
                 //player.y=gamePlay.height-player.height
                 //movD=false;
                 dead(record,lvl);
                 player.stop();
             }

             for(var i=0;i<elements.length;i++){
                 if(player.x+player.width/2>elements[i].x&&player.x<(elements[i].x+elements[i].width-player.width/2)&&
                    (player.y+player.height)>elements[i].y&&(player.y+player.height)<(elements[i].y+elements[i].height)){
                     player.y=elements[i].y-player.height;
                     movD=false;
                     switch(elements[i].type){
                     case 1:
                         record-=lvl*2;
                         break;
                     case 2:
                         effects_gold=true;
                         break;
                     case 3:
                        /* effects_time_lov=true;
                         speadChang();
                         effects_time_lov=false;
                         fromeffect.start();*/
                        /* var index=0;
                         while(elements[index].type!==3&&elements[index].y>=elements[i].y&&index<elements.length){
                             index++;
                         }*/
                             elements[i].type=0;
                             var x=player.x=elements[(gameBalkaTimer.index-1)%elements.length].x+elements[(gameBalkaTimer.index-1)%elements.length].width/2;
                             var y=player.y=elements[(gameBalkaTimer.index-1)%elements.length].y-player.height;
                             elements[(gameBalkaTimer.index-1)%elements.length].type=0;

                         break;
                     case 4:
                         elements[i].stop();
                         break;
                     case 5:
                         effects_slou=true;
                         break;
                     }

                 }
             }
             if(player.x>gamePlay.width){
                 player.x=0-player.width/2;
               //  player.y-=player.height*2;
                // dead(record);
                // player.stop();
             }
             if(player.x<0-player.width){
                 player.x=gamePlay.width-player.width/2;
                // player.y-=player.height*2;
                // dead(record);
                // player.stop();
             }
             if((++timer)%1000==0)
             {
                 lvl++;
                 lvlUp(lvl);
             }

             if(player.y<=-gamePlay.height*0.2){
                 dead(record,lvl);
                 player.stop();
             }
        }
    }
    onLvlChanged: {
            speadChang();
    }
    function speadChang(){//isparavit effect zel`nogo
        for(var i=0;i<elements.length;i++){
            //elements[i].spead=(10000-lvl*100)/3.5*(effects_time_lov)?4:1;
            elements[i].spead=(10000-lvl*200)/3.5;
        }
    }
    function start(){

        while(elements.length<40)
            createObject();
        elements[(gameBalkaTimer.index)%elements.length].create(1,lvl);
        elements[(gameBalkaTimer.index)%elements.length].x=player.x-elements[0].width/2;
        gameBalkaTimer.index++;
        renderTimer.start();
        gameBalkaTimer.start();
    }
    function pause(){
        renderTimer.stop();
        gameBalkaTimer.stop();
    }
    function stop(){
        record=0;
        lvl=1;
        renderTimer.stop();
        gameBalkaTimer.stop();
    }
}
