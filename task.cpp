#include "task.h"

Task::Task(QString _description, bool _isChecked)
{
    description = _description;
    isChecked = _isChecked;
}

void Task::setDescription(QString _description)
{
    description = _description;
}

void Task::setIsChecked(bool _isChecked)
{
    isChecked = _isChecked;
}

QString Task::getDescription() const
{
    return description;
}

bool Task::getIsChecked() const
{
    return isChecked;
}
