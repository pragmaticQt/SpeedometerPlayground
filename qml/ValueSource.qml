/****************************************************************************
**
** Copyright (C) 2016 The Qt Company Ltd.
** Contact: https://www.qt.io/licensing/
**
** This file is part of the examples of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:BSD$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see https://www.qt.io/terms-conditions. For further
** information use the contact form at https://www.qt.io/contact-us.
**
** BSD License Usage
** Alternatively, you may use this file under the terms of the BSD license
** as follows:
**
** "Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are
** met:
**   * Redistributions of source code must retain the above copyright
**     notice, this list of conditions and the following disclaimer.
**   * Redistributions in binary form must reproduce the above copyright
**     notice, this list of conditions and the following disclaimer in
**     the documentation and/or other materials provided with the
**     distribution.
**   * Neither the name of The Qt Company Ltd nor the names of its
**     contributors may be used to endorse or promote products derived
**     from this software without specific prior written permission.
**
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
**
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick 2.2
//! [0]
Item {
    id: valueSource
    property real kph: 0
    property bool start: true

    SequentialAnimation {
        running: true
        loops: 1

        // We want a small pause at the beginning, but we only want it to happen once.
        PauseAnimation {
            duration: 1000
        }

        PropertyAction {
            target: valueSource
            property: "start"
            value: false
        }

        SequentialAnimation {
            loops: Animation.Infinite

            // Start upshifting.
            NumberAnimation {
                target: valueSource
                property: "kph"
                easing.type: Easing.InOutSine
                from: 0
                to: 30
                duration: 3000
            }

            // We changed gears so we lost a bit of acceleration.
            NumberAnimation {
                target: valueSource
                property: "kph"
                easing.type: Easing.InOutSine
                from: 30
                to: 31
                duration: 200
            }

            NumberAnimation {
                target: valueSource
                property: "kph"
                easing.type: Easing.InOutSine
                to: 60
                duration: 3000
            }

            // We changed gears so we lost a bit of speed.
            NumberAnimation {
                target: valueSource
                property: "kph"
                easing.type: Easing.InOutSine
                to: 61
                duration: 200
            }

            NumberAnimation {
                target: valueSource
                property: "kph"
                easing.type: Easing.InOutSine
                to: 100
                duration: 4000
            }

            // We changed gears so we lost a bit of speed.
            NumberAnimation {
                target: valueSource
                property: "kph"
                easing.type: Easing.InOutSine
                to: 101
                duration: 200
            }

            NumberAnimation {
                target: valueSource
                property: "kph"
                easing.type: Easing.InOutSine
                to: 140
                duration: 4000
            }


            // Start downshifting.

            // Fifth to fourth gear.
            NumberAnimation {
                target: valueSource
                property: "kph"
                easing.type: Easing.Linear
                to: 100
                duration: 5000
            }

            // Fourth to third gear.
            NumberAnimation {
                target: valueSource
                property: "kph"
                easing.type: Easing.InOutSine
                to: 60
                duration: 5000
            }

            // Third to second gear.
            NumberAnimation {
                target: valueSource
                property: "kph"
                easing.type: Easing.InOutSine
                to: 30
                duration: 5000
            }

            NumberAnimation {
                target: valueSource
                property: "kph"
                easing.type: Easing.InOutSine
                to: 0
                duration: 5000
            }

            PauseAnimation {
                duration: 5000
            }
        }
    }
}
