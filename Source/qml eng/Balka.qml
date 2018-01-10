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

import QtQuick 2.0
Image{
        id: body;
        fillMode: Image.Tile
        source: "/image/res/1.png";
        height: 1;
        width: 1;
        property double minimumSize: 0.2
        property int spead: 60
        property int type: 0;
        function norma(value){
            if(value<parent.height*minimumSize)
                return parent.height*minimumSize;
            else
                return value;
        }
        function create(value,lvl)
        {
            type=0;
            if(Math.random()*100>=75){
                type= Math.random()*100%((lvl)/3);
            }
            height=0.05*parent.height;
            width=norma(parent.width*0.95*Math.random()/value);
            x=(parent.width*Math.random()-width/2);
            y=parent.height*1.1;
            var i=spead;
            ani.to=-(parent.height*0.2);
            ani.start();
        }
        function stop(){
            ani.stop();
        }
        onTypeChanged: {
            switch(type){
            case 0:source="/image/res/1.png";break;//none
            case 1:source="/image/res/2.png";break;// -poits
            case 2:source="/image/res/3.png";break; //gold
            case 3:source="/image/res/4.png";break; //teleport
            case 4:source="/image/res/5.png";break;//stop platform
            case 5:source="/image/res/6.png";break;//slow
            default:source="/image/res/1.png"; break;
            }
        }
        NumberAnimation{
            id:ani;
            targets: body;
            property:"y";
            easing.type: Easing.Linear
            duration: spead;
        }
    }
