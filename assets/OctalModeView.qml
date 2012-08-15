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

    property FileMode fileMode

    property alias showSpecialModes: specialModesOctal.visible

    title: qsTr("Octal")
    
    Container {
        layout: StackLayout {
            layoutDirection: LayoutDirection.LeftToRight
        }

        OctalDropDown {
            id: specialModesOctal

            visible: false

            layoutProperties: StackLayoutProperties {
                verticalAlignment: VerticalAlignment.Center
                spaceQuota: 1
            }

            selectedIndex: fileMode.specialModes.octal
            onSelectedIndexChanged: fileMode.specialModes.octal = selectedIndex
        }

        OctalDropDown {
            id: userModeOctal

            layoutProperties: StackLayoutProperties {
                verticalAlignment: VerticalAlignment.Center
                spaceQuota: 1
            }

            selectedIndex: fileMode.userMode.octal
            onSelectedIndexChanged: fileMode.userMode.octal = selectedIndex
        }

        OctalDropDown {
            id: groupModeOctal

            layoutProperties: StackLayoutProperties {
                verticalAlignment: VerticalAlignment.Center
                spaceQuota: 1
            }
            
            selectedIndex: fileMode.groupMode.octal
            onSelectedIndexChanged: fileMode.groupMode.octal = selectedIndex
        }

        OctalDropDown {
            id: otherModeOctal

            layoutProperties: StackLayoutProperties {
                verticalAlignment: VerticalAlignment.Center
                spaceQuota: 1
            }
            
            selectedIndex: fileMode.otherMode.octal
            onSelectedIndexChanged: fileMode.otherMode.octal = selectedIndex
        }

    }
}
