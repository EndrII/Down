
#include "settings.h"

settings::settings(QObject *parent) : QObject(parent)
{
    if(read()!=VersionFile){
        default_();
        write();
    }
}
int settings::read(){
    QFile f(FILEST);
    int temp;
    if(f.open(QIODevice::ReadOnly)){
       QDataStream stream(&f);
       stream>>temp;
       stream>>control_;
       stream>>def_;
       stream>>boal_;
       f.close();
       emit controlChanged();
       return temp;
    }
    return 0;
}
void settings::write(){
    QFile f(FILEST);
    if(f.open(QIODevice::WriteOnly|QIODevice::Truncate)){
        QDataStream stream(&f);
        stream<<VersionFile;
        stream<<control_;
        stream<<def_;
        stream<<boal_;
        f.close();
    }
}
void settings::default_(){
    control_=true;
    boal_=1;
    def_=1;
    emit controlChanged();
    //write();
}
void settings::appe(){
    write();
}
bool settings::control()const{
    return control_;
}
void settings::setControl(bool b){
    control_=b;
    emit controlChanged();
   // write();
}
int settings::boal()const{
    return boal_;
}
void settings::setBoal(int b){
    boal_=b;
    emit boalChanged();
   // write();
}
int settings::def()const{
    return def_;
}
void settings::setDef(int b){
    def_=b;
    emit defChanged();
   // write();
}
settings::~settings(){
    write();
}
