import Felgo 3.0
import QtQuick 2.0
import QtQuick.Extras 1.4

App {
    Page {
        id: root
        visible: true
        width: 1024
        height: 600

        title: "Qt CircularGauge Demo"

        Item {
            id: container
            anchors.centerIn: parent
            width: root.width
            height: Math.min(root.width, root.height)

            ValueSource {
                id: valueSource
            }

            CircularGauge {
                id: speedometer
                anchors.centerIn: parent
                value: valueSource.kph
                anchors.verticalCenter: parent.verticalCenter
                maximumValue: 280
                // We set the width to the height, because the height will always be
                // the more limited factor. Also, all circular controls letterbox
                // their contents to ensure that they remain circular. However, we
                // don't want to extra space on the left and right of our gauges,
                // because they're laid out horizontally, and that would create
                // large horizontal gaps between gauges on wide screens.
                width: height
                height: container.height * 0.5

                style: DashboardGaugeStyle {}
            }
        }

    }
}
