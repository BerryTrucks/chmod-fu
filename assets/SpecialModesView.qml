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

    property SpecialModes specialModes

    title: qsTr("Special Modes")

    Container {

        layout: StackLayout {
            orientation: LayoutOrientation.LeftToRight
        }

        ModeBit {
            layoutProperties: StackLayoutProperties {
                spaceQuota: 1
            }

            titleText: qsTr("Setuid")
            
            checked: specialModes.hasSetuid
            onCheckedChanged: specialModes.hasSetuid = checked
        }

        ModeBit {
            layoutProperties: StackLayoutProperties {
                spaceQuota: 1
            }

            titleText: qsTr("Setgid")

            checked: specialModes.hasSetgid
            onCheckedChanged: specialModes.hasSetgid = checked
        }

        ModeBit {
            layoutProperties: StackLayoutProperties {
                spaceQuota: 1
            }

            titleText: qsTr("Sticky")

            checked: specialModes.hasSticky
            onCheckedChanged: specialModes.hasSticky = checked
        }
    }
}
