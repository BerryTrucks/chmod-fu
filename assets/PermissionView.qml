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
import bb.cascades 1.0
import org.beblue.chmodfu 1.0

HeaderContainer {
    id: root

    property Permission permission

    Container {

        layout: StackLayout {
            layoutDirection: LayoutDirection.LeftToRight
        }

        ModeBit {
            layoutProperties: StackLayoutProperties {
                spaceQuota: 1
            }

            titleText: qsTr("Read")
            
            checked: permission.hasRead
            onCheckedChanged: permission.hasRead = checked
        }

        ModeBit {
            layoutProperties: StackLayoutProperties {
                spaceQuota: 1
            }

            titleText: qsTr("Write")

            checked: permission.hasWrite
            onCheckedChanged: permission.hasWrite = checked
        }

        ModeBit {
            layoutProperties: StackLayoutProperties {
                spaceQuota: 1
            }

            titleText: qsTr("Execute")

            checked: permission.hasExecute
            onCheckedChanged: permission.hasExecute = checked
        }
    }
}
