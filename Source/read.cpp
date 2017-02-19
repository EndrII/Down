#include "read.h"
READ::READ():
    QObject(){
    _record= read();
    RC=false;
}
int READ::read(){
    QFile f(FILE);
    if(f.open(QIODevice::ReadOnly)){
       QDataStream stream(&f);
       stream>>_record;
       f.close();
       return _record;
    }
    return 0;
}
void READ::write(){
    QFile f(FILE);
    if(f.open(QIODevice::WriteOnly|QIODevice::Truncate)){
        QDataStream stream(&f);
        stream<<_record;
        f.close();
    }
}
int READ::record()const{
    return _record;
}
/*QString READ::getRecord()const{
    return QString::number(_record);
}*/
void READ::setReadRecord(const bool &r){
    RC=r;
}
bool READ::readRecord()const{
    return RC;
}
void READ::setRecord(const int &record_){
    if(RC)
        _record=(record_>_record)?record_:_record;
    else
        _record=record_;
    write();
    emit recordChanged();
}
READ::~READ(){
    write();
}
