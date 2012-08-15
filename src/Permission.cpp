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
#include "Permission.h"

Permission::Permission(QObject *parent) :
    QObject(parent)
{
    connect(&m_octal, SIGNAL(bitChanged(Octal::Bit,bool)), SLOT(bitChanged(Octal::Bit,bool)));
    connect(&m_octal, SIGNAL(valueChanged(int)), SIGNAL(octalChanged(int)));
}

bool Permission::hasRead() const
{
    return m_octal.isSet(Octal::BIT_2);
}

void Permission::setRead(bool value)
{
    m_octal.setBit(Octal::BIT_2, value);
}

bool Permission::hasWrite() const
{
    return m_octal.isSet(Octal::BIT_1);
}

void Permission::setWrite(bool value)
{
    m_octal.setBit(Octal::BIT_1, value);
}

bool Permission::hasExecute() const
{
    return m_octal.isSet(Octal::BIT_0);
}

void Permission::setExecute(bool value)
{
    m_octal.setBit(Octal::BIT_0, value);
}

int Permission::octal() const
{
    return m_octal.value();
}

void Permission::setOctal(int value)
{
    m_octal.setValue(value);
}

void Permission::bitChanged(Octal::Bit bit, bool value)
{
    switch (bit) {
        case Octal::BIT_2:
            emit readChanged(value);
            break;
        case Octal::BIT_1:
            emit writeChanged(value);
            break;
        case Octal::BIT_0:
            emit executeChanged(value);
            break;
    }
}
