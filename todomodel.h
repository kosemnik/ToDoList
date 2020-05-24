#ifndef TODOMODEL_H
#define TODOMODEL_H

#include <QAbstractListModel>
#include "task.h"

class ToDoModel : public QAbstractListModel
{
    Q_OBJECT

public:
    explicit ToDoModel(QObject *parent = nullptr);

    enum taskRole {
        DescriptionRole = Qt::DisplayRole,
        IsCheckedRole
    };


    // Basic functionality:
    int rowCount(const QModelIndex &parent = QModelIndex()) const override;

    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;

    // Editable:
    bool setData(const QModelIndex &index, const QVariant &value,
                 int role = Qt::EditRole) override;

    Qt::ItemFlags flags(const QModelIndex& index) const override;

    Q_INVOKABLE void addTask(QString description, bool isChecked);
    Q_INVOKABLE void removeTask(int index);
    Q_INVOKABLE void removeTasks();

    virtual QHash<int, QByteArray> roleNames() const override;

private:
    QList<Task> tasks;
};

#endif // TODOMODEL_H
