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

Container {

    Container {

        layout: StackLayout {
            topPadding: 70
            leftPadding: 10           
        }

        Label {
            text: qsTr("Attributions")
            textStyle.base: SystemDefaults.TextStyles.TitleText
            
            layoutProperties: StackLayoutProperties {
                horizontalAlignment: HorizontalAlignment.Center
            }
        }
    }

    ListView {

        dataModel: XmlDataModel { source: "attributions.xml" }
        
        selectionMode: SelectionMode.None

        listItemComponents: [
            ListItemComponent {
                type: "item"
                StandardListItem {
                    imageSource: ListItemData.imageSource
                    title: ListItemData.title
                    description: qsTr("by %1").arg(ListItemData.description)
                    status: ListItemData.status
                }
            }
        ]
    }
}
