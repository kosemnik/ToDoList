import QtQuick 2.0
import QtQuick.Controls 2.12

import ToDoModel 1.0

Rectangle {
    width: (parent.width - 20 * 6) / 7
    height: parent.height - 20 - 20
    anchors.top: parent.top
    anchors.topMargin: 20
    border.color: "green"

    border.width: 1
    radius: 20

    property string titleText
    property string textButton
    property ToDoModel toDoModel
    property color backgoundColor
    property int dayNumber

    color: backgoundColor

    Text {
        id: title
        text: titleText
        font.pixelSize: 20
        font.bold: true
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 10
    }

    ListView {
        model: toDoModel;
        spacing: 10
        orientation: Qt.Vertical
        width: parent.width - 2
        height: parent.height - 10 - title.height - 20 - 20 - 20 - buttonAdd.height
        anchors.top: title.bottom
        anchors.topMargin: 20
        anchors.left: parent.left
        anchors.leftMargin: 1

        delegate: Rectangle
        {
            width: parent.width
            height: 60
            color: "#F5F5F5"

            CheckBox {
                id: checkBox
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 5
                checked: isChecked
                onCheckedChanged:
                    toDoModel.setIsChecked(model.index)
            }

            Text {
                anchors.left: parent.left
                anchors.leftMargin: 5 + 5 + checkBox.width
                anchors.verticalCenter: parent.verticalCenter
                text: description
                font.pixelSize: 13
            }

            Rectangle {
                anchors.right: parent.right
                anchors.rightMargin: 5
                anchors.top: parent.top
                anchors.topMargin: 5
                width: 20
                height: 20
                color: "red"

                Text {
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    color: "white"
                    text: "x"
                    font.pixelSize: 14
                    font.bold: true
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: toDoModel.removeTask(model.index)
                }
            }
        }
    }

    Rectangle {
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20
        anchors.left: parent.left
        anchors.leftMargin: 15
        width: 40
        height: 40
        color: "red"

        Text {
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            color: "white"
            text: "x"
            font.pixelSize: 20
            font.bold: true
        }

        MouseArea {
            anchors.fill: parent
            onClicked: toDoModel.removeTasks()
        }
    }

    Button {
        id: buttonAdd
        text: textButton
        font.pixelSize: 15
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20
        anchors.right: parent.right
        anchors.rightMargin: 15
        onClicked:
        {
            currentDay = dayNumber
            addTask.open()
        }
    }
}
