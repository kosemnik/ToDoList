#include "todomodel.h"

ToDoModel::ToDoModel(QObject *parent)
    : QAbstractListModel(parent)
{
}

int ToDoModel::rowCount(const QModelIndex &parent) const
{
    return tasks.size();
}

QVariant ToDoModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid())
        return QVariant();

    // FIXME: Implement me!

    if (role == DescriptionRole)
        return tasks[index.row()].getDescription();
    else if (role == IsCheckedRole)
        return tasks[index.row()].getIsChecked();
    return QVariant();
}

bool ToDoModel::setData(const QModelIndex &index, const QVariant &value, int role)
{
    if (data(index, role) != value) {
        // FIXME: Implement me!
        emit dataChanged(index, index, QVector<int>() << role);
        return true;
    }
    return false;
}

Qt::ItemFlags ToDoModel::flags(const QModelIndex &index) const
{
    if (!index.isValid())
        return Qt::NoItemFlags;

    return Qt::ItemIsEditable; // FIXME: Implement me!
}

void ToDoModel::addTask(QString description, bool isChecked)
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
}

void ToDoModel::removeTasks()
{
    beginRemoveRows(QModelIndex(), 0, tasks.count());
    tasks.clear();
    endRemoveRows();
}

QHash<int, QByteArray> ToDoModel::roleNames() const
{
    QHash<int, QByteArray> roleNames;
    roleNames[DescriptionRole] = "description";
    roleNames[IsCheckedRole] = "isChecked";
    return roleNames;
}
