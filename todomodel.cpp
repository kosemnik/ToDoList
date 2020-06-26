#include "todomodel.h"
#include <QString>
#include <QJsonArray>
#include <QFile>
#include <QJsonDocument>

ToDoModel::ToDoModel(QObject *parent)
    : QAbstractListModel(parent)
{
}

QString ToDoModel::jSonFileName() const
{
    return _jSonFileName;
}

void ToDoModel::setJSonFileName(QString jSonFileName)
{
    _jSonFileName = jSonFileName;
    fillModel();
}

int ToDoModel::rowCount(const QModelIndex &parent) const
{
    return tasks.size();
}

QVariant ToDoModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid())
        return QVariant();
    if (role == DescriptionRole)
        return tasks[index.row()].getDescription();
    else if (role == IsCheckedRole)
        return tasks[index.row()].getIsChecked();
    return QVariant();
}

bool ToDoModel::setData(const QModelIndex &index, const QVariant &value, int role)
{
    if (data(index, role) != value) {
        emit dataChanged(index, index, QVector<int>() << role);
        return true;
    }
    return false;
}

Qt::ItemFlags ToDoModel::flags(const QModelIndex &index) const
{
    if (!index.isValid())
        return Qt::NoItemFlags;

    return Qt::ItemIsEditable;
}

void ToDoModel::addTask(QString description, bool isChecked)
{
    QJsonObject textObject;
    textObject["description"] = QString(description);
    textObject["isChecked"] = isChecked;

    QJsonArray tasksArray = _currentJsonObject["tasks"].toArray();
    tasksArray.append(textObject);

    _currentJsonObject["tasks"] = tasksArray;

    updateFile();
    addTaskToModel(description, isChecked);
}

void ToDoModel::addTaskToModel(QString description, bool isChecked)
{
    beginInsertRows(QModelIndex(), tasks.count(), tasks.count());
    tasks << Task(description, isChecked);
    endInsertRows();
}

void ToDoModel::removeTask(int index)
{
    beginRemoveRows(QModelIndex(), index, index);
    tasks.removeAt(index);
    endRemoveRows();

    QJsonArray tasksArray = _currentJsonObject["tasks"].toArray();
    tasksArray.removeAt(index);
    _currentJsonObject["tasks"] = tasksArray;
    updateFile();
}

void ToDoModel::removeTasks()
{
    beginRemoveRows(QModelIndex(), 0, tasks.count());
    tasks.clear();
    endRemoveRows();
    _currentJsonObject = QJsonObject();
    updateFile();
}

void ToDoModel::updateFile()
{
    QFile jsonFile(_jSonFileName);
    jsonFile.open(QIODevice::WriteOnly);
    jsonFile.write(QJsonDocument(_currentJsonObject).toJson(QJsonDocument::Indented));
    jsonFile.close();
}

void ToDoModel::fillModel()
{
    QFile jsonFile(_jSonFileName);
    if (!jsonFile.exists() || !jsonFile.open(QIODevice::ReadOnly))
        return;

    QByteArray saveData = jsonFile.readAll();
    QJsonDocument jsonDocument(QJsonDocument::fromJson(saveData));
    _currentJsonObject = jsonDocument.object();

    Q_FOREACH(auto task, _currentJsonObject["tasks"].toArray())
    {
        QJsonObject obj = task.toObject();
        QString description = task.toObject()["description"].toString();
        bool isChecked = task.toObject()["isChecked"].toBool();
        addTaskToModel(description, isChecked);
    }
}

void ToDoModel::setIsChecked(int index)
{
    tasks[index].setIsChecked(!tasks[index].getIsChecked());

    QJsonArray tasksArray = _currentJsonObject["tasks"].toArray();
    QJsonObject textObject;
    textObject["description"] = tasksArray[index].toObject()["description"];
    textObject["isChecked"] = tasks[index].getIsChecked();
    tasksArray[index] = textObject;
    _currentJsonObject["tasks"] = tasksArray;

    updateFile();
}

QHash<int, QByteArray> ToDoModel::roleNames() const
{
    QHash<int, QByteArray> roleNames;
    roleNames[DescriptionRole] = "description";
    roleNames[IsCheckedRole] = "isChecked";
    return roleNames;
}
