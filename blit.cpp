#include "blit.h"
#include <QDebug>
#include <QQuickItem>
Blit::Blit(QObject *parent) : QObject(parent)
{
    qDebug()<<"Blit";
}
void Blit::imageRetrieved(){
    
    auto grabResult = qobject_cast<QQuickItemGrabResult*>(sender());
    if (grabResult){
        
        qDebug()<<"Grabbed";
        QImage img =  grabResult -> image();
        QImage subimg = img.copy(m_rSelection);
        QString subimgname = QString(".tmp/temp%1%2%3%4.png").arg(m_rSelection.x()).arg(m_rSelection.y()).arg(m_rSelection.width()).arg(m_rSelection.height());
        subimg.save(subimgname,"PNG",0);
    } else {
        qDebug()<<"Not Grabbed!";
    }
    
}
bool Blit::retrieveSubImage(QObject * qItem, int initial_x, int initial_y, int final_x, int final_y){
    
    qDebug()<<"RetrieveImage:"<<qItem;
    auto itm = qobject_cast<QQuickItem*>(qItem);
    m_pGrab = itm  -> grabToImage();
    if (m_pGrab == NULL) return false;
    m_rSelection = QRect(QPoint(initial_x,initial_y),QPoint(final_x,final_y));
    connect(
                m_pGrab.data(),
                &QQuickItemGrabResult::ready,
                this,
                &Blit::imageRetrieved
                );
    return true;    

}

bool Blit::retrieveImage(QObject * qItem){
    
    qDebug()<<"RetrieveImage:"<<qItem;
    auto itm = qobject_cast<QQuickItem*>(qItem);
    m_pGrab = itm  -> grabToImage();
    if (m_pGrab == NULL) return false;
    connect(
                m_pGrab.data(),
                &QQuickItemGrabResult::ready,
                this,
                &Blit::imageRetrieved
                );
    return true;    

}
