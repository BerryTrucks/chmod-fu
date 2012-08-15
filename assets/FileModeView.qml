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

Container {
    id: root

    property bool showSpecialModes: false

    property FileMode fileMode

    SpecialModesView {
        bottomMargin: 20
        visible: showSpecialModes

        specialModes: fileMode.specialModes
    }

    PermissionView {
        id: userMode

        bottomMargin: 20

        title: qsTr("User")

        permission: fileMode.userMode
    }

    PermissionView {
        id: groupMode

        bottomMargin: 20

        title: qsTr("Group")        

        permission: fileMode.groupMode
    }

    PermissionView {
        id: otherMode

        bottomMargin: 20

        title: qsTr("Other")

        permission: fileMode.otherMode
    }

    OctalModeView {
        showSpecialModes: root.showSpecialModes
        fileMode: root.fileMode
    }

}