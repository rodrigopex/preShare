/*
 * MyDisplayInfo.h
 *
 *  Created on: Aug 27, 2013
 *      Author: rodrigopex
 */

#ifndef MYDISPLAYINFO_H_
#define MYDISPLAYINFO_H_

#include <QObject>
#include <QVariantMap>
#include <bb/device/DisplayInfo>

class MyDisplayInfo: public QObject {
	Q_OBJECT
public:
	MyDisplayInfo(QObject * parent = 0);
	virtual ~MyDisplayInfo();
	Q_INVOKABLE QVariantMap getDisplayInfo();
};

#endif /* MYDISPLAYINFO_H_ */
