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
#include "Octal.h"

Octal::Octal(QObject *parent) :
    QObject(parent), m_value(0)
{
}

bool Octal::isSet(Bit bit) const
{
    return m_value & bit;
}

void Octal::setBit(Bit bit, bool value)
{
    if (modifyBit(bit, value)) {
        emit valueChanged(m_value);
    }
}

int Octal::value() const
{
    return m_value;
}

void Octal::setValue(int value)
{
    if (m_value != value) {
        modifyBit(BIT_0, value & BIT_0);
        modifyBit(BIT_1, value & BIT_1);
        modifyBit(BIT_2, value & BIT_2);
        emit valueChanged(value);
    }
}

bool Octal::modifyBit(Octal::Bit bit, bool value)
{
    bool modify = isSet(bit) != value;

    if (modify) {
        m_value = value ? (m_value | bit) : (m_value & ~bit);
        emit bitChanged(bit, value);
    }

    return modify;
}
