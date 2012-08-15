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

    layout: StackLayout {
        leftPadding: 10
        rightPadding: leftPadding
        layoutDirection: LayoutDirection.LeftToRight
    }

    ImageView {

        layoutProperties: StackLayoutProperties {
            verticalAlignment: VerticalAlignment.Center
        }

        imageSource: "asset:///images/icon.png"
    }

    TextArea {

        layoutProperties: StackLayoutProperties {
            verticalAlignment: VerticalAlignment.Center
            spaceQuota: 1
        }
        textStyle.base: SystemDefaults.TextStyles.BodyText
        textStyle.alignment: TextAlignment.Left            

        editable: false

        text: "" +
        "chmod-fu v1.0.0\n" +
        "Copyright (c) 2012 Mario Boikov"
    }
}
