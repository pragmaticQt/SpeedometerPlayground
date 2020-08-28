import Felgo 3.0
import QtQuick 2.12
import QtQuick.Extras 1.4
import QtMultimedia 5.12

GameWindow {
    Page {
        id: root
        visible: true
        width: 1024
        height: 600
        backgroundColor: "#6c8f89"

        title: "Qt CircularGauge Demo"

        Item {
            id: container
            anchors.centerIn: parent
            width: root.width
            height: Math.min(root.width, root.height)

            // Start upshifting.
            NumberAnimation {
                id: animation
                target: speedometer
                property: "value"
                easing.type: Easing.bezierCurve
                from: 0
                to: 280
                duration: 5000
                running: touchArea.pressed
                loops: Animation.Infinite
            }

            BackgroundMusic {
              id: engineSnd
              source: "../assets/acceleration.mp3"
              autoLoad: true
              autoPlay: false
              loops: Audio.Infinite
            }

            MouseArea {
                id: touchArea
                anchors.fill: parent

                onPressed: engineSnd.play()
                onReleased: engineSnd.stop()
            }


            CircularGauge {
                id: speedometer
                anchors.centerIn: parent
                anchors.verticalCenter: parent.verticalCenter
                maximumValue: 280
                // We set the width to the height, because the height will always be
                // the more limited factor. Also, all circular controls letterbox
                // their contents to ensure that they remain circular. However, we
                // don't want to extra space on the left and right of our gauges,
                // because they're laid out horizontally, and that would create
                // large horizontal gaps between gauges on wide screens.
                width: height
                height: container.height

                style: DashboardGaugeStyle {}
            }
        }

    }
}
