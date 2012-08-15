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
#ifndef APPSETTINGS_H_
#define APPSETTINGS_H_

#include <QtCore/QObject>

class AppSettings: public QObject
{
	Q_OBJECT

	Q_PROPERTY(bool showAdvancedMode READ showAdvancedMode WRITE setShowAdvancedMode NOTIFY showAdvancedModeChanged)

	static const QString SHOW_ADVANCED_MODE_KEY;

public:
	AppSettings();
	virtual ~AppSettings();

	bool showAdvancedMode() const;

	void setShowAdvancedMode(bool advancedMode);

signals:
	void showAdvancedModeChanged();

};

#endif /* APPSETTINGS_H_ */
