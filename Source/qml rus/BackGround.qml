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
// size img 200x 2000
Image{
    id:bg;
    z:-0.0002
    width:parent.width;
    height: width*5.15;
    signal _final();
    property bool stops: true;
    function mov(){
        x=y=0;
        stops= true;
        ani.to=-bg.height+gamePlay.height;
        ani.start();
    }
    function stop(){
        stops=false;
        ani.stop();
    }
    NumberAnimation{
        id: ani;
        property: "y";
        targets:bg;
        duration:300000;
        onStopped: {
            if(stops)_final();
        }
    }
}
