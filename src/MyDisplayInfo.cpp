/*
 * MyDisplayInfo.cpp
 *
 *  Created on: Aug 27, 2013
 *      Author: rodrigopex
 */

#include "MyDisplayInfo.h"

MyDisplayInfo::MyDisplayInfo(QObject * parent): QObject(parent) {

}
MyDisplayInfo::~MyDisplayInfo() {
}

Q_INVOKABLE QVariantMap MyDisplayInfo::getDisplayInfo(){
	//{"width": 500, "height": 400}
	bb::device::DisplayInfo display;
	QVariantMap displayInfo;
	displayInfo["width"] = QVariant(display.pixelSize().width());
	displayInfo["height"] = QVariant(display.pixelSize().height());
	return displayInfo;
}
