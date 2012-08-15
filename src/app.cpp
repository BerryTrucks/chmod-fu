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
#include <bb/cascades/Application>
#include <bb/cascades/QmlDocument>
#include <bb/cascades/AbstractPane>
#include <bb/cascades/TitleBar>

#include "AppMenu.h"
#include "AppSettings.h"
#include "FileMode.h"

#include "app.h"

using namespace bb::cascades;

App::App()
{
	QCoreApplication::setOrganizationName(QLatin1String("BeBlue.org"));
	QCoreApplication::setOrganizationDomain(QLatin1String("org.beblue.chmodfu"));
	QCoreApplication::setApplicationName(QLatin1String("chmod-fu"));
	QCoreApplication::setApplicationVersion(QLatin1String("1.0.0"));

	qmlRegisterType<AppMenu>("org.beblue.chmodfu", 1, 0, "AppMenu");
	qmlRegisterType<AppSettings>("org.beblue.chmodfu", 1, 0, "AppSettings");

	qmlRegisterType<FileMode>("org.beblue.chmodfu", 1, 0, "FileMode");
    qmlRegisterType<SpecialModes>("org.beblue.chmodfu", 1, 0, "SpecialModes");
    qmlRegisterType<Permission>("org.beblue.chmodfu", 1, 0, "Permission");

	QmlDocument *qml = QmlDocument::create("main.qml");

    AbstractPane *root = qml->createRootNode<AbstractPane>();
    Application::setScene(root);
}
