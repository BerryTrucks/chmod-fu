/*
 * Copyright (c) 2012 Mario Boikov.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#ifndef APPMENU_H_
#define APPMENU_H_

#include <QtCore/QObject>

class AppMenu: public QObject
{
	Q_OBJECT

	Q_PROPERTY(bool infoEnabled READ infoEnabled WRITE setInfoEnabled NOTIFY infoEnabledChanged);
	Q_PROPERTY(bool manPageEnabled READ manPageEnabled WRITE setManPageEnabled NOTIFY manPageEnabledChanged);

public:
	AppMenu();
	virtual ~AppMenu();

	bool infoEnabled() const;
	void setInfoEnabled(bool enabled);

	bool manPageEnabled() const;
	void setManPageEnabled(bool enabled);

signals:
	void infoRequested();
	void manPageRequested();

	void infoEnabledChanged();
	void manPageEnabledChanged();
};

#endif /* APPMENU_H_ */
