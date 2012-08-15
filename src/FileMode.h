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
#ifndef FILEMODE_H
#define FILEMODE_H

#include <QtCore/QObject>

#include "SpecialModes.h"
#include "Permission.h"

/**
 * Represents the file system modes of files and directories.
 */
class FileMode : public QObject
{
    Q_OBJECT

    Q_PROPERTY(SpecialModes *specialModes READ specialModes CONSTANT)
    Q_PROPERTY(Permission *userMode READ userMode CONSTANT)
    Q_PROPERTY(Permission *groupMode READ groupMode CONSTANT)
    Q_PROPERTY(Permission *otherMode READ otherMode CONSTANT)

public:
    explicit FileMode(QObject *parent = 0);

    /**
     * Return the special modes such as setuid, setgid and sticky.
     */
    SpecialModes *specialModes();

    /**
     * Return the user's permission.
     */
    Permission *userMode();

    /**
     * Return the group's permission.
     */
    Permission *groupMode();

    /**
     * Return the other's permission.
     */
    Permission *otherMode();

private:
    SpecialModes m_specialModes;
    Permission m_userMode;
    Permission m_groupMode;
    Permission m_otherMode;
};

#endif // FILEMODE_H
