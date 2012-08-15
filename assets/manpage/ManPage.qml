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
    
    signal closeClicked

    titleBar: TitleBar {

        title: qsTr("Man page")
        
        acceptAction: ActionItem {
            title: qsTr("Close")
            onTriggered: root.closeClicked() 
        }
    }

    content: Container {

        ScrollView {
            id: scrollView

            scrollViewProperties {
                scrollMode: scrollView.contentScale > 1.0 ? ScrollMode.Both : ScrollMode.Vertical
                pinchToZoomEnabled: true
                minContentScale: 1.0
                maxContentScale: 2.5
                
            }

            content: WebView {
	            url: "man_chmod.html"
	        }
        }
    }

}