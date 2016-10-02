#ifndef BLIT_H
#define BLIT_H

#include <QObject>
#include <QSharedPointer>
#include <QQuickItemGrabResult>
#include <QPoint>
class Blit : public QObject
{
    Q_OBJECT
    QSharedPointer<QQuickItemGrabResult>m_pGrab;
    QRect m_rSelection;
    
public:
    explicit Blit(QObject *parent = 0);
    //Retrieve Image 
    Q_INVOKABLE bool retrieveImage(QObject * qItem, int initial_x, int initial_y, int final_x, int final_y);
signals:
    
private slots:
    void imageRetrieved(void);
};

#endif // BLIT_H
