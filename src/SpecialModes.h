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
#ifndef SPECIALMODES_H
#define SPECIALMODES_H

#include <QtCore/QObject>

#include "Octal.h"

/**
 * Represents the special modes, that is, setuid, setgid and sticky.
 */
class SpecialModes : public QObject
{
    Q_OBJECT

    Q_PROPERTY(bool hasSetuid READ hasSetuid WRITE setSetuid NOTIFY setuidChanged)
    Q_PROPERTY(bool hasSetgid READ hasSetgid WRITE setSetgid NOTIFY setgidChanged)
    Q_PROPERTY(bool hasSticky READ hasSticky WRITE setSticky NOTIFY stickyChanged)

    Q_PROPERTY(int octal READ octal WRITE setOctal NOTIFY octalChanged)

public:
    explicit SpecialModes(QObject *parent = 0);

    bool hasSetuid() const;
    void setSetuid(bool value);

    bool hasSetgid() const;
    void setSetgid(bool value);

    bool hasSticky() const;
    void setSticky(bool value);

    int octal() const;
    void setOctal(int value);

signals:
    void setuidChanged(bool value);
    void setgidChanged(bool value);
    void stickyChanged(bool value);

    void octalChanged(int value);

private slots:
    void bitChanged(Octal::Bit bit, bool value);

private:
    Octal m_octal;
};

#endif // SPECIALMODES_H
