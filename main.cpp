#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "blit.h"
void registerExternalType(){
    qmlRegisterType<Blit>("com.autoformax.blit",1,0,"Blit");    
}
int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    
    QQmlApplicationEngine engine;
    registerExternalType();
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    
    return app.exec();
}
