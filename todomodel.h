#ifndef TODOMODEL_H
#define TODOMODEL_H

#include <QAbstractListModel>
#include "task.h"
#include <QJsonObject>
#include <QString>

class ToDoModel : public QAbstractListModel
{
    Q_OBJECT

public:
    explicit ToDoModel(QObject *parent = nullptr);

    enum taskRole {
        DescriptionRole = Qt::DisplayRole,
        IsCheckedRole
    };

    Q_PROPERTY(QString jSonFileName READ jSonFileName WRITE setJSonFileName)
    QString jSonFileName() const;
    void setJSonFileName(QString jSonFileName);

    // Basic functionality:
    int rowCount(const QModelIndex &parent = QModelIndex()) const override;

    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;

    // Editable:
    bool setData(const QModelIndex &index, const QVariant &value,
                 int role = Qt::EditRole) override;

    Qt::ItemFlags flags(const QModelIndex& index) const override;

    Q_INVOKABLE void addTask(QString description, bool isChecked);
    void addTaskToModel(QString description, bool isChecked);
    Q_INVOKABLE void removeTask(int index);
    Q_INVOKABLE void removeTasks();
    Q_INVOKABLE void updateFile();
    void fillModel();

    Q_INVOKABLE void setIsChecked(int index);

    virtual QHash<int, QByteArray> roleNames() const override;

private:
    QList<Task> tasks;
    QString _jSonFileName;
    QJsonObject _currentJsonObject;
};

#endif // TODOMODEL_H
