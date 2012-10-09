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
            orientation: LayoutOrientation.LeftToRight
        }

        Button {
            id: specialModesOctal
            text: fileMode.specialModes.octal
            onClicked: listDialog.execDialog(fileMode.specialModes)
        }

        Button {
            id: userModeButton
            text: fileMode.userMode.octal
            onClicked: listDialog.execDialog(fileMode.userMode)
        }

        Button {
            text: fileMode.groupMode.octal
            onClicked: listDialog.execDialog(fileMode.groupMode)
        }

        Button {
            text: fileMode.otherMode.octal
            onClicked: listDialog.execDialog(fileMode.otherMode)
        }
        
    }

    attachedObjects: [
        SystemListDialog {
            id: listDialog

            title: qsTr("Pick value")

            function execDialog(theMode) {
                listDialog.clearList()

		        for (var i = 0; i < 8; i++)
		            listDialog.appendItem('' + i, true, i === theMode.octal)
		            
		        listDialog.exec()
		        if (listDialog.result === SystemUiResult.ConfirmButtonSelection) {
		            theMode.octal = listDialog.selectedIndices[0]
		        }
		            
            }
        }
    ]
}
