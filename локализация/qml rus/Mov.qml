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

Item {
   id:base

   property double lvl:0.05
   property bool up:false;
   property bool down:false;
   property double vectorX:0;
   property double vectorY:0;
   function toX(_X){
       bX.enabled=false;
       x=_X;
       bX.enabled=true;
   }
   function toY(_Y){
       bY.enabled=false;
       y=_Y;
       bY.enabled=true;
   }
   function toXY(_x,_y){
       toX(_x);toY(_y);
   }
   signal noDrawX();
   signal noDrawY();
   signal stoped();
   Behavior on x{
       id:bX;
       SmoothedAnimation{
           velocity: 200.0;
       }
   }
   Behavior on y{
       id:bY;
       SmoothedAnimation{

           velocity: 200.0;
       }
   }
   function update(){
       x+=vectorX*parent.width; vectorX=0;

       if(down)
           vectorY+=0.1;
       else
           vectorY=0;
       if(up)
           vectorY=-lvl;
       y+=vectorY*parent.height;
       if(x<-(parent.width*0.2)||x>parent.width*1.2)
           noDrawX();
       if(y<-(parent.height*0.2)||y>parent.height*1.2)
           noDrawY();
   }

}
