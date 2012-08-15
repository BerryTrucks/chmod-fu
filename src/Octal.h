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
#ifndef OCTAL_H
#define OCTAL_H

#include <QtCore/QObject>

/**
 * Represents an octal value which uses the digits 0 to 7.
 */
class Octal : public QObject
{
    Q_OBJECT

    Q_PROPERTY(int value READ value WRITE setValue NOTIFY valueChanged)

public:
    enum Bit {
        BIT_0 = 1,
        BIT_1 = 2,
        BIT_2 = 4
    };

    explicit Octal(QObject *parent = 0);

    /**
     * Return if the given 'bit' is set
     */
    bool isSet(Bit bit) const;

    /**
     * Set the 'bit' to 'value'
     */
    void setBit(Bit bit, bool value);

    /**
     * Return the octal value
     */
    int value() const;

    /**
     * Set the octal value. Valid values are 0 to 7
     */
    void setValue(int value);

signals:
    /**
     * Signal emitted when the value changes
     */
    void valueChanged(int value);

    /**
     * Signal emitted when a bit changes, either by setting
     * an individual bit or by setting the value.
     */
    void bitChanged(Octal::Bit bit, bool value);

public slots:

private:
    bool modifyBit(Bit bit, bool value);

    int m_value;
};

#endif // OCTAL_H
