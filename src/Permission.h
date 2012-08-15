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
#ifndef PERMISSION_H
#define PERMISSION_H

#include <QtCore/QObject>

#include "Octal.h"

/**
 * Represents a file system permission, that is, read, write and execute.
 */
class Permission : public QObject
{
    Q_OBJECT

    Q_PROPERTY(bool hasRead READ hasRead WRITE setRead NOTIFY readChanged)
    Q_PROPERTY(bool hasWrite READ hasWrite WRITE setWrite NOTIFY writeChanged)
    Q_PROPERTY(bool hasExecute READ hasExecute WRITE setExecute NOTIFY executeChanged)

    Q_PROPERTY(int octal READ octal WRITE setOctal NOTIFY octalChanged)

public:
    explicit Permission(QObject *parent = 0);

    bool hasRead() const;
    void setRead(bool value);

    bool hasWrite() const;
    void setWrite(bool value);

    bool hasExecute() const;
    void setExecute(bool value);

    int octal() const;
    void setOctal(int value);

signals:
    void readChanged(bool value);
    void writeChanged(bool value);
    void executeChanged(bool value);

    void octalChanged(int value);

private slots:
    void bitChanged(Octal::Bit bit, bool value);

private:
    Octal m_octal;
};

#endif // PERMISSION_H
