/****************************************************************************
**
** Copyright (C) 2016 A.N.Yankovich.
** Contact: https://vk.com/digitalface
**
** $QT_BEGIN_LICENSE:LGPLv3$
** This file is distributed under the LGPLv3 license.
**
** $QT_END_LICENSE$
**
****************************************************************************/

#ifndef READ_H
#define READ_H
#include <QObject>
#include <QDataStream>
#include <QFile>
#define FILE "Records"
/**
 * @brief The READ class
 */
class READ:public QObject
{
  Q_OBJECT
    Q_PROPERTY(int record READ record WRITE setRecord NOTIFY recordChanged)
    Q_PROPERTY(bool readRecord READ readRecord WRITE setReadRecord)
    //Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged)
private:
    /**
     * @brief _record
     */
    int read();
    void write();
    bool RC;
    int _record;
public:
    explicit READ();
    ~READ();
public slots:
    int record() const;
    bool readRecord()const;
    void setReadRecord(const bool &r);
    void setRecord(const int &record_);
signals:
    void recordChanged();
};
#endif
