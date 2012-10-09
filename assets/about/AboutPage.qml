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

Page {
    id: root

    property alias contentBackground: container.background

    signal closeClicked
    
    titleBar: TitleBar {

        title: qsTr("About")
        
        acceptAction: ActionItem {
            title: qsTr("Close")
            onTriggered: root.closeClicked()
        }
    }

    content: Container {
        id: container

        topPadding: 20

        Copyright {
        }

        Attributions {
            layoutProperties: StackLayoutProperties {
                spaceQuota: 1
            }
        }
    }
}
