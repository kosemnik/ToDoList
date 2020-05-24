#ifndef TASK_H
#define TASK_H
#include <QString>


class Task
{
public:
    Task(QString _description, bool _isChecked);

    void setDescription(QString _description);
    void setIsChecked(bool _isChecked);
    QString getDescription() const;
    bool getIsChecked() const;

private:
    QString description;
    bool isChecked;
};

#endif // TASK_H
