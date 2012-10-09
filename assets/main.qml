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

    Menu.definition: MenuDefinition {
        helpAction: HelpActionItem {
            onTriggered: {
                console.log("Hello world")
                manPageSheet.open()
            }
            title: qsTr("Man page")
        }
        
        settingsAction: SettingsActionItem {
            onTriggered: aboutSheet.open()
            title: qsTr("About")
            imageSource: "asset:///images/ninja_white.png"
        }
    }

    titleBar: TitleBar {
        title: " chmod-fu" // Remove space when TitleBar adds left padding 
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
        
        Sheet {
            id: aboutSheet
            content: About.AboutPage {
                contentBackground: backgroundDefinition.imagePaint
                onCloseClicked: aboutSheet.close()
            }
        },

        Sheet {
            id: manPageSheet
            content: ManPage.ManPage {
                onCloseClicked: manPageSheet.close()
            }
        }
    ]

    content: Container {

        layout: DockLayout {}
        background: backgroundDefinition.imagePaint

        FileModeView {
            topPadding: 20
            leftPadding: 10
            rightPadding: leftPadding
            bottomPadding: topPadding

	        fileMode: FileMode {}

	        showSpecialModes: appSettings.showAdvancedMode
	    }

    }
}
