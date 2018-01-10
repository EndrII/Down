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

#ifndef settings_H
#define settings_H

#include <QObject>
#define FILEST "Settings"
#include <QFile>
#include <QDataStream>
#define VersionFile 2
class settings : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool control READ control WRITE setControl NOTIFY controlChanged)
    Q_PROPERTY(int boal READ boal WRITE setBoal NOTIFY boalChanged)
    Q_PROPERTY(int def READ def WRITE setDef NOTIFY defChanged)

private:
    bool    control_;
    int     boal_;
    int     def_;
    //int ver;
    int     read();
    void    write();
public:
    explicit settings(QObject *parent = 0);
    ~settings();
public slots:
    bool    control()const;
    void    setControl(bool);
    int     boal()const;
    void    setBoal(int);
    int     def()const;
    void    setDef(int);
    void    default_();
    void    appe();
signals:
    void    boalChanged();
    void    defChanged();
    void    controlChanged();
public slots:
};

#endif // settings_H
