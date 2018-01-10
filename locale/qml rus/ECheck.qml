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
StatusIndicator{
    property bool checed:false ;
    id: upr;
    active: checed;
    color: Qt.rgba(0.2,1,0.2,1);
    MouseArea{
        onClicked: {
            checed=!checed;
        }
        anchors.fill:parent;
    }
   // anchors.top:defaul.bottom;
}
