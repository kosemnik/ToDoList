import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.12
import QtQuick.Dialogs 1.2

import ToDoModel 1.0

Window {
    visible: true
    width: 1695
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
        jSonFileName: "./jsonFileMonday"
    }

    ToDoModel
    {
        id: toDoModelTuesday
        jSonFileName: "./jsonFileTuesday"
    }

    ToDoModel
    {
        id: toDoModelWednesday
        jSonFileName: "./jsonFileWednesday"
    }

    ToDoModel
    {
        id: toDoModelThursday
        jSonFileName: "./jsonFileThursday"
    }

    ToDoModel
    {
        id: toDoModelFriday
        jSonFileName: "./jsonFileFriday"
    }

    ToDoModel
    {
        id: toDoModelSaturday
        jSonFileName: "./jsonFileSaturday"
    }

    ToDoModel
    {
        id: toDoModelSunday
        jSonFileName: "./jsonFileSunday"
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

            DayOfWeek {
                id: monday
                titleText: (language === 0) ? "Понедельник" : "Monday"
                textButton: (language === 0) ? ("Добавить задачу") : ("Add Task")
                toDoModel: toDoModelMonday
                dayNumber: 0
                backgoundColor: "#FFFFFF"
            }

            DayOfWeek {
                id: tuesday
                titleText: (language === 0) ? "Вторник" : "Tuesday"
                textButton: (language === 0) ? ("Добавить задачу") : ("Add Task")
                toDoModel: toDoModelTuesday
                dayNumber: 1
                backgoundColor: "#FFFFFF"
            }

            DayOfWeek {
                id: wednesday
                titleText: (language === 0) ? "Среда" : "Wednesday"
                textButton: (language === 0) ? ("Добавить задачу") : ("Add Task")
                toDoModel: toDoModelWednesday
                dayNumber: 2
                backgoundColor: "#FFFFFF"
            }

            DayOfWeek {
                id: thursday
                titleText: (language === 0) ? "Четверг" : "Thursday"
                textButton: (language === 0) ? ("Добавить задачу") : ("Add Task")
                toDoModel: toDoModelThursday
                dayNumber: 3
                backgoundColor: "#FFFFFF"
            }

            DayOfWeek {
                id: friday
                titleText: (language === 0) ? "Пятница" : "Friday"
                textButton: (language === 0) ? ("Добавить задачу") : ("Add Task")
                toDoModel: toDoModelFriday
                dayNumber: 4
                backgoundColor: "#FFFFFF"
            }

            DayOfWeek {
                id: saturday
                titleText: (language === 0) ? "Суббота" : "Saturday"
                textButton: (language === 0) ? ("Добавить задачу") : ("Add Task")
                toDoModel: toDoModelSaturday
                dayNumber: 5
                backgoundColor: "#EEFFEE"
            }

            DayOfWeek {
                id: sunday
                titleText: (language === 0) ? "Воскресенье" : "Sunday"
                textButton: (language === 0) ? ("Добавить задачу") : ("Add Task")
                toDoModel: toDoModelSunday
                dayNumber: 6
                backgoundColor: "#EEFFEE"
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
                maximumLength: 18
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
