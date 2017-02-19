#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlComponent>
#include "read.h"
#include "settings.h"
int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;
    qmlRegisterType<READ>("Read",1,0,"Read");
    qmlRegisterType<settings>("Setting",1,0,"Setting");
    engine.load(QUrl(QStringLiteral("qrc:/eng/qml eng/main.qml")));
    return app.exec();
}
