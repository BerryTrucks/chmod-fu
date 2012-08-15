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
#include "AppMenu.h"

#include <bb/cascades/Application>
#include <bb/cascades/ActionItem>
#include <bb/cascades/HelpActionItem>
#include <bb/cascades/SettingsActionItem>
#include <bb/cascades/Menu>

using namespace bb::cascades;

static Menu *appMenu = 0;
static SettingsActionItem *aboutItem = 0;
static HelpActionItem *manPageItem = 0;

AppMenu::AppMenu() {
	if (appMenu == 0) {
		aboutItem = SettingsActionItem::create().parent(this).title(tr("About")).image(QUrl("asset:///images/ninja_white.png"));
		manPageItem = HelpActionItem::create().title(tr("Man page"));

		appMenu = Menu::create();
		appMenu->setSettingsAction(aboutItem);
		appMenu->setHelpAction(manPageItem);
		Application::setMenu(appMenu);
	}

	connect(aboutItem, SIGNAL(triggered()), this, SIGNAL(infoRequested()));
	connect(aboutItem, SIGNAL(enabledChanged(bool)), this, SIGNAL(infoEnabledChanged()));

	connect(manPageItem, SIGNAL(triggered()), this, SIGNAL(manPageRequested()));
	connect(manPageItem, SIGNAL(enabledChanged(bool)), this, SIGNAL(manPageEnabledChanged()));
}

AppMenu::~AppMenu() {
}

bool AppMenu::infoEnabled() const {
	return aboutItem->isEnabled();
}
void AppMenu::setInfoEnabled(bool enabled) {
	aboutItem->setEnabled(enabled);
}

bool AppMenu::manPageEnabled() const {
	return manPageItem->isEnabled();
}
void AppMenu::setManPageEnabled(bool enabled) {
	manPageItem->setEnabled(enabled);
}
