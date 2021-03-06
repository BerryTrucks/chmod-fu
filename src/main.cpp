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

#include <QtCore/QLocale>
#include <QtCore/QTranslator>

#include "app.h"

using namespace bb::cascades;

int main(int argc, char **argv)
{
    Application app(argc, argv);

    QTranslator translator;
    QString locale_string = QLocale().name();
    QString filename = QString("chmod-fu_%1").arg(locale_string);
    if (translator.load(filename, "app/native/qm")) {
        app.installTranslator( &translator );
    }

    App mainApp;

    return Application::exec();
}

