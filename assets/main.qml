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

import "about" as About
import "manpage" as ManPage

Page {
    id: mainPage

    titleBar: TitleBar {
        title: "chmod-fu"
    }

    actions: [
        ActionItem {
            id: advancedModeSwitch

            title: appSettings.showAdvancedMode ? qsTr("Basic") : qsTr("Advanced")
            imageSource: "asset:///images/transfer_white.png"
            ActionBar.placement: ActionBarPlacement.OnBar

            onTriggered: appSettings.showAdvancedMode = !appSettings.showAdvancedMode 
        }
    ]

    attachedObjects: [
        ImagePaintDefinition {
            id: backgroundDefinition
            repeatPattern: RepeatPattern.XY
            imageSource: "asset:///images/background.png"
        },

        AppSettings {
            id: appSettings
        },
        
	    AppMenu {
	        infoEnabled: !aboutSheet.visible
	        manPageEnabled: !manPageSheet.visible

	        onInfoRequested: aboutSheet.visible = true
	        onManPageRequested: manPageSheet.visible = true
	    },

        Sheet {
            id: aboutSheet
            content: About.AboutPage {
                contentBackground: backgroundDefinition.imagePaint
                onCloseClicked: aboutSheet.visible = false
            }
        },

        Sheet {
            id: manPageSheet
            content: ManPage.ManPage {
                onCloseClicked: manPageSheet.visible = false
            }
        }
    ]

    content: Container {
        layout: StackLayout {
            topPadding: 20
            leftPadding: 10
            rightPadding: leftPadding
        }

        background: backgroundDefinition.imagePaint

        FileModeView {

	        fileMode: FileMode {}

	        showSpecialModes: appSettings.showAdvancedMode
	    }
    }
}
