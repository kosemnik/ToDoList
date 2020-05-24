import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.12
import QtQuick.Dialogs 1.2

import ToDoModel 1.0

Window {

    visible: true
    width: 1700
    height: 900
    maximumHeight: height
    maximumWidth: width
    minimumHeight: height
    minimumWidth: width
    id: mainWindow
    color: "green"

    property int language: 0 // 0 - рус, 1 - англ
    property int currentDay: -1

    title: (language === 0) ? ("Список дел на неделю") : ("Weekly to-do list")

    ToDoModel
    {
        id: toDoModelMonday
    }

    ToDoModel
    {
        id: toDoModelTuesday
    }

    ToDoModel
    {
        id: toDoModelWednesday
    }

    ToDoModel
    {
        id: toDoModelThursday
    }

    ToDoModel
    {
        id: toDoModelFriday
    }

    ToDoModel
    {
        id: toDoModelSaturday
    }

    ToDoModel
    {
        id: toDoModelSunday
    }

    Rectangle {
        id: window
        width: parent.width - 40
        height: parent.height - 40
        anchors.top: parent.top
        anchors.topMargin: 20
        anchors.left: parent.left
        anchors.leftMargin: 20
        color: "white"
        radius: 20

        Button {
            id: chooseButton
            text: (language === 0) ? ("Выбрать язык") : ("Choose language")
            font.pixelSize: 15
            anchors.left: window.left
            anchors.leftMargin: 20
            anchors.top: window.top
            anchors.topMargin: 20
            onClicked: chooseLanguage.open()
        }

        Row {
            width: window.width - 20
            height: window.height - (chooseButton.height + 20)
            anchors.top: chooseButton.bottom
            anchors.left: window.left
            anchors.leftMargin: 20
            anchors.horizontalCenter: window.horizontalCenter
            spacing: 20

            Rectangle {
                id: monday
                width: (parent.width - 20 * 6) / 7
                height: parent.height - 20 - 20
                anchors.top: parent.top
                anchors.topMargin: 20
                border.color: "green"

                border.width: 1
                radius: 20

                Text {
                    id: titleMonday
                    text: (language === 0) ? "Понедельник" : "Monday"
                    font.pixelSize: 20
                    font.bold: true
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    anchors.topMargin: 10
                }

                ListView {
                    model: toDoModelMonday;
                    spacing: 10
                    orientation: Qt.Vertical
                    width: parent.width - 2
                    height: parent.height - 10 - titleMonday.height - 20 - 20 - 20 - buttonAddMonday.height
                    anchors.top: titleMonday.bottom
                    anchors.topMargin: 20
                    anchors.left: parent.left
                    anchors.leftMargin: 1

                    delegate: Rectangle
                    {
                        width: parent.width
                        height: 60
                        color: "#F5F5F5"

                        CheckBox {
                            id: checkBoxMonday
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: parent.left
                            anchors.leftMargin: 5
                            checked: isChecked
                        }

                        Text {
                            anchors.left: parent.left
                            anchors.leftMargin: 5 + 5 + checkBoxMonday.width
                            anchors.verticalCenter: parent.verticalCenter
                            text: description
                            font.pixelSize: 15
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
                                onClicked: toDoModelMonday.removeTask(model.index)
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
                        onClicked: toDoModelMonday.removeTasks()
                    }
                }

                Button {
                    id: buttonAddMonday
                    text: (language === 0) ? ("Добавить задачу") : ("Add Task")
                    font.pixelSize: 15
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 20
                    anchors.right: parent.right
                    anchors.rightMargin: 15
                    onClicked: {
                        currentDay = 0
                        addTask.open()
                    }
                }
            }

            Rectangle {
                id: tuesday
                width: (parent.width - 20 * 6) / 7
                height: parent.height - 20 - 20
                anchors.top: parent.top
                anchors.topMargin: 20
                border.color: "green"
                border.width: 1
                radius: 20

                Text {
                    id: titleTuesday
                    text: (language === 0) ? "Вторник" : "Tuesday"
                    font.pixelSize: 20
                    font.bold: true
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    anchors.topMargin: 10
                }

                ListView {
                    model: toDoModelTuesday;
                    spacing: 10
                    orientation: Qt.Vertical
                    width: parent.width - 4
                    height: parent.height - 10 - titleTuesday.height - 20 - 20 - 20 - buttonAddTuesday.height
                    anchors.top: titleTuesday.bottom
                    anchors.topMargin: 20
                    anchors.left: parent.left
                    anchors.leftMargin: 2

                    delegate: Rectangle
                    {
                        width: parent.width
                        height: 60
                        color: "#F5F5F5"

                        CheckBox {
                            id: checkBoxTuesday
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: parent.left
                            anchors.leftMargin: 5
                            checked: isChecked
                        }

                        Text {
                            anchors.left: parent.left
                            anchors.leftMargin: 5 + 5 + checkBoxTuesday.width
                            anchors.verticalCenter: parent.verticalCenter
                            text: description
                            font.pixelSize: 15
                        }

                        Rectangle {
                            id: borderTuesday
                            anchors.right: parent.right
                            anchors.rightMargin: 5
                            anchors.top: parent.top
                            anchors.topMargin: 5
                            width: 20
                            height: 20
                            color: "red"

                            Text {
                                anchors.verticalCenter: borderTuesday.verticalCenter
                                anchors.horizontalCenter: borderTuesday.horizontalCenter
                                color: "white"
                                text: "x"
                                font.pixelSize: 14
                                font.bold: true
                            }

                            MouseArea {
                                anchors.fill: parent
                                onClicked: toDoModelTuesday.removeTask(model.index)
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
                        onClicked: toDoModelTuesday.removeTasks()
                    }
                }

                Button {
                    id: buttonAddTuesday
                    text: (language === 0) ? ("Добавить задачу") : ("Add Task")
                    font.pixelSize: 15
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 20
                    anchors.right: parent.right
                    anchors.rightMargin: 15
                    onClicked: {
                        currentDay = 1
                        addTask.open()
                    }
                }
            }

            Rectangle {
                id: wednesday
                width: (parent.width - 20 * 6) / 7
                height: parent.height - 20 - 20
                anchors.top: parent.top
                anchors.topMargin: 20
                border.color: "green"
                border.width: 1
                radius: 20

                Text {
                    id: titleWednesday
                    text: (language === 0) ? "Среда" : "Wednesday"
                    font.pixelSize: 20
                    font.bold: true
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    anchors.topMargin: 10
                }

                ListView {
                    model: toDoModelWednesday;
                    spacing: 10
                    orientation: Qt.Vertical
                    width: parent.width - 3
                    height: parent.height - 10 - titleWednesday.height - 20 - 20 - 20 - buttonAddWednesday.height
                    anchors.top: titleWednesday.bottom
                    anchors.topMargin: 20
                    anchors.left: parent.left
                    anchors.leftMargin: 1

                    delegate: Rectangle
                    {
                        width: parent.width
                        height: 60
                        color: "#F5F5F5"

                        CheckBox {
                            id: checkBoxWednesday
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: parent.left
                            anchors.leftMargin: 5
                            checked: isChecked
                        }

                        Text {
                            anchors.left: parent.left
                            anchors.leftMargin: 5 + 5 + checkBoxWednesday.width
                            anchors.verticalCenter: parent.verticalCenter
                            text: description
                            font.pixelSize: 15
                        }

                        Rectangle {
                            id: borderWednesday
                            anchors.right: parent.right
                            anchors.rightMargin: 5
                            anchors.top: parent.top
                            anchors.topMargin: 5
                            width: 20
                            height: 20
                            color: "red"

                            Text {
                                anchors.verticalCenter: borderWednesday.verticalCenter
                                anchors.horizontalCenter: borderWednesday.horizontalCenter
                                color: "white"
                                text: "x"
                                font.pixelSize: 14
                                font.bold: true
                            }

                            MouseArea {
                                anchors.fill: parent
                                onClicked: toDoModelWednesday.removeTask(model.index)
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
                        onClicked: toDoModelWednesday.removeTasks()
                    }
                }

                Button {
                    id: buttonAddWednesday
                    text: (language === 0) ? ("Добавить задачу") : ("Add Task")
                    font.pixelSize: 15
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 20
                    anchors.right: parent.right
                    anchors.rightMargin: 15
                    onClicked: {
                        currentDay = 2
                        addTask.open()
                    }
                }
            }

            Rectangle {
                id: thursday
                width: (parent.width - 20 * 6) / 7
                height: parent.height - 20 - 20
                anchors.top: parent.top
                anchors.topMargin: 20
                border.color: "green"
                border.width: 1
                radius: 20

                Text {
                    id: titleThursday
                    text: (language === 0) ? "Четверг" : "Thursday"
                    font.pixelSize: 20
                    font.bold: true
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    anchors.topMargin: 10
                }

                ListView {
                    model: toDoModelThursday;
                    spacing: 10
                    orientation: Qt.Vertical
                    width: parent.width - 2
                    height: parent.height - 10 - titleThursday.height - 20 - 20 - 20 - buttonAddThursday.height
                    anchors.top: titleThursday.bottom
                    anchors.topMargin: 20
                    anchors.left: parent.left
                    anchors.leftMargin: 1

                    delegate: Rectangle
                    {
                        width: parent.width
                        height: 60
                        color: "#F5F5F5"

                        CheckBox {
                            id: checkBoxThursday
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: parent.left
                            anchors.leftMargin: 5
                            checked: isChecked
                        }

                        Text {
                            anchors.left: parent.left
                            anchors.leftMargin: 5 + 5 + checkBoxThursday.width
                            anchors.verticalCenter: parent.verticalCenter
                            text: description
                            font.pixelSize: 15
                        }

                        Rectangle {
                            id: borderThursday
                            anchors.right: parent.right
                            anchors.rightMargin: 5
                            anchors.top: parent.top
                            anchors.topMargin: 5
                            width: 20
                            height: 20
                            color: "red"

                            Text {
                                anchors.verticalCenter: borderThursday.verticalCenter
                                anchors.horizontalCenter: borderThursday.horizontalCenter
                                color: "white"
                                text: "x"
                                font.pixelSize: 14
                                font.bold: true
                            }

                            MouseArea {
                                anchors.fill: parent
                                onClicked: toDoModelThursday.removeTask(model.index)
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
                        onClicked: toDoModelThursday.removeTasks()
                    }
                }

                Button {
                    id: buttonAddThursday
                    text: (language === 0) ? ("Добавить задачу") : ("Add Task")
                    font.pixelSize: 15
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 20
                    anchors.right: parent.right
                    anchors.rightMargin: 15
                    onClicked: {
                        currentDay = 3
                        addTask.open()
                    }
                }
            }

            Rectangle {
                id: friday
                width: (parent.width - 20 * 6) / 7
                height: parent.height - 20 - 20
                anchors.top: parent.top
                anchors.topMargin: 20
                border.color: "green"
                border.width: 1
                radius: 20

                Text {
                    id: titleFriday
                    text: (language === 0) ? "Пятница" : "Friday"
                    font.pixelSize: 20
                    font.bold: true
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    anchors.topMargin: 10
                }

                ListView {
                    model: toDoModelFriday;
                    spacing: 10
                    orientation: Qt.Vertical
                    width: parent.width - 3
                    height: parent.height - 10 - titleFriday.height - 20 - 20 - 20 - buttonAddFriday.height
                    anchors.top: titleFriday.bottom
                    anchors.topMargin: 20
                    anchors.left: parent.left
                    anchors.leftMargin: 2

                    delegate: Rectangle
                    {
                        width: parent.width
                        height: 60
                        color: "#F5F5F5"

                        CheckBox {
                            id: checkBoxFriday
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: parent.left
                            anchors.leftMargin: 5
                            checked: isChecked
                        }

                        Text {
                            anchors.left: parent.left
                            anchors.leftMargin: 5 + 5 + checkBoxFriday.width
                            anchors.verticalCenter: parent.verticalCenter
                            text: description
                            font.pixelSize: 15
                        }

                        Rectangle {
                            id: borderFriday
                            anchors.right: parent.right
                            anchors.rightMargin: 5
                            anchors.top: parent.top
                            anchors.topMargin: 5
                            width: 20
                            height: 20
                            color: "red"

                            Text {
                                anchors.verticalCenter: borderFriday.verticalCenter
                                anchors.horizontalCenter: borderFriday.horizontalCenter
                                color: "white"
                                text: "x"
                                font.pixelSize: 14
                                font.bold: true
                            }

                            MouseArea {
                                anchors.fill: parent
                                onClicked: toDoModelFriday.removeTask(model.index)
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
                        onClicked: toDoModelFriday.removeTasks()
                    }
                }

                Button {
                    id: buttonAddFriday
                    text: (language === 0) ? ("Добавить задачу") : ("Add Task")
                    font.pixelSize: 15
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 20
                    anchors.right: parent.right
                    anchors.rightMargin: 15
                    onClicked: {
                        currentDay = 4
                        addTask.open()
                    }
                }
            }

            Rectangle {
                id: saturday
                width: (parent.width - 20 * 6) / 7
                height: parent.height - 20 - 20
                anchors.top: parent.top
                anchors.topMargin: 20
                border.color: "green"
                border.width: 1
                radius: 20

                Text {
                    id: titleSaturday
                    text: (language === 0) ? "Суббота" : "Saturday"
                    font.pixelSize: 20
                    font.bold: true
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    anchors.topMargin: 10
                }

                ListView {
                    model: toDoModelSaturday;
                    spacing: 10
                    orientation: Qt.Vertical
                    width: parent.width - 4
                    height: parent.height - 10 - titleSaturday.height - 20 - 20 - 20 - buttonAddSaturday.height
                    anchors.top: titleSaturday.bottom
                    anchors.topMargin: 20
                    anchors.left: parent.left
                    anchors.leftMargin: 2

                    delegate: Rectangle
                    {
                        width: parent.width
                        height: 60
                        color: "#F5F5F5"

                        CheckBox {
                            id: checkBoxSaturday
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: parent.left
                            anchors.leftMargin: 5
                            checked: isChecked
                        }

                        Text {
                            anchors.left: parent.left
                            anchors.leftMargin: 5 + 5 + checkBoxSaturday.width
                            anchors.verticalCenter: parent.verticalCenter
                            text: description
                            font.pixelSize: 15
                        }

                        Rectangle {
                            id: borderSaturday
                            anchors.right: parent.right
                            anchors.rightMargin: 5
                            anchors.top: parent.top
                            anchors.topMargin: 5
                            width: 20
                            height: 20
                            color: "red"

                            Text {
                                anchors.verticalCenter: borderSaturday.verticalCenter
                                anchors.horizontalCenter: borderSaturday.horizontalCenter
                                color: "white"
                                text: "x"
                                font.pixelSize: 14
                                font.bold: true
                            }

                            MouseArea {
                                anchors.fill: parent
                                onClicked: toDoModelSaturday.removeTask(model.index)
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
                        onClicked: toDoModelSaturday.removeTasks()
                    }
                }

                Button {
                    id: buttonAddSaturday
                    text: (language === 0) ? ("Добавить задачу") : ("Add Task")
                    font.pixelSize: 15
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 20
                    anchors.right: parent.right
                    anchors.rightMargin: 15
                    onClicked: {
                        currentDay = 5
                        addTask.open()
                    }
                }
            }

            Rectangle {
                id: sunday
                width: (parent.width - 20 * 6) / 7
                height: parent.height - 20 - 20
                anchors.top: parent.top
                anchors.topMargin: 20
                border.color: "green"
                border.width: 1
                radius: 20

                Text {
                    id: titleSunday
                    text: (language === 0) ? "Воскресенье" : "Sunday"
                    font.pixelSize: 20
                    font.bold: true
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    anchors.topMargin: 10
                }

                ListView {
                    model: toDoModelSunday;
                    spacing: 10
                    orientation: Qt.Vertical
                    width: parent.width - 2
                    height: parent.height - 10 - titleSunday.height - 20 - 20 - 20 - buttonAddSunday.height
                    anchors.top: titleSunday.bottom
                    anchors.topMargin: 20
                    anchors.left: parent.left
                    anchors.leftMargin: 1

                    delegate: Rectangle
                    {
                        width: parent.width
                        height: 60
                        color: "#F5F5F5"

                        CheckBox {
                            id: checkBoxSunday
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: parent.left
                            anchors.leftMargin: 5
                            checked: isChecked
                        }

                        Text {
                            anchors.left: parent.left
                            anchors.leftMargin: 5 + 5 + checkBoxSunday.width
                            anchors.verticalCenter: parent.verticalCenter
                            text: description
                            font.pixelSize: 15
                        }

                        Rectangle {
                            id: borderSunday
                            anchors.right: parent.right
                            anchors.rightMargin: 5
                            anchors.top: parent.top
                            anchors.topMargin: 5
                            width: 20
                            height: 20
                            color: "red"

                            Text {
                                anchors.verticalCenter: borderSunday.verticalCenter
                                anchors.horizontalCenter: borderSunday.horizontalCenter
                                color: "white"
                                text: "x"
                                font.pixelSize: 14
                                font.bold: true
                            }

                            MouseArea {
                                anchors.fill: parent
                                onClicked: toDoModelSunday.removeTask(model.index)
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
                        onClicked: toDoModelSunday.removeTasks()
                    }
                }

                Button {
                    id: buttonAddSunday
                    text: (language === 0) ? ("Добавить задачу") : ("Add Task")
                    font.pixelSize: 15
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 20
                    anchors.right: parent.right
                    anchors.rightMargin: 15
                    onClicked: {
                        currentDay = 6
                        addTask.open()
                    }
                }
            }

        }
    }

    Dialog {
        id: chooseLanguage
        title: (language === 0) ? ("Выбрать язык") : ("Choose language")
        width: russian.width + english.width + 20 + 20 + 20

        contentItem: Rectangle {
            height: chooseLanguage.height
            width: chooseLanguage.width

            Button {
                id: russian
                text: "Русский"
                font.pixelSize: 15
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 20
                onClicked: {
                    language = 0
                    chooseLanguage.close()
                }
            }

            Button {
                id: english
                text: "English"
                font.pixelSize: 15
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 20
                onClicked: {
                    language = 1
                    chooseLanguage.close()
                }
            }
        }
    }

    Dialog {
        id: addTask
        title: (language === 0) ? ("Добавить задачу") : ("Add Task")
        width: 400

        contentItem: Rectangle {
            height: addTask.height
            width: addTask.width

            TextField {
                id: textField
                height: parent.height - 20 - add.height - 20 - 20
                width: parent.width - 40
                anchors.top: parent.top
                anchors.topMargin: 20
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 15
            }

            Button {
                id: add
                text: (language === 0) ? ("Добавить") : ("Add")
                font.pixelSize: 15
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 20
                onClicked: {
                    if (currentDay === 0)
                        toDoModelMonday.addTask(textField.text, false)
                    else if (currentDay === 1)
                        toDoModelTuesday.addTask(textField.text, false)
                    else if (currentDay === 2)
                        toDoModelWednesday.addTask(textField.text, false)
                    else if (currentDay === 3)
                        toDoModelThursday.addTask(textField.text, false)
                    else if (currentDay === 4)
                        toDoModelFriday.addTask(textField.text, false)
                    else if (currentDay === 5)
                        toDoModelSaturday.addTask(textField.text, false)
                    else
                        toDoModelSunday.addTask(textField.text, false)
                    textField.text = ""
                    addTask.close()
                }
            }
        }
    }
}
