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
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.4

DelayButton {
    id: buttons;
    style: DelayButtonStyle{
       // progressBarDropShadowColor:colorButton;
        progressBarGradient:Gradient{
            GradientStop{color:colorButton}
        }
    }
    property color colorButton: Qt.rgba(1,1.0,0.2,1);
    signal complit();
    Timer{
        id: t;
        interval: 1000;
        repeat: false;
        onTriggered: {
            t.stop();
            complit();
            //delay=2;
            //delay=1;
            //parent.progress=0;
            //activated();


        }
    }

    delay: 1;
    //progress: 0.5;
    //onClicked:
    onActivated: {
        t.start();
    }
}
