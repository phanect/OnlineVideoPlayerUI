import QtQuick 1.1

Rectangle {
	id: pagebutton

	property string text
	signal clicked

	height: 50
	color: "#c0c0c0"

	Text {
		text: pagebutton.text
		anchors.centerIn: parent
		font.pixelSize: 15
	}

	MouseArea {
		onClicked: pagebutton.clicked()
		anchors.fill: parent
	}
}

/**
 ** Copyright (C) 2012 Jumpei Ogawa <phanective@gmail.com>
 ** This file is licensed under MIT license.
 ** See license.txt for copying this file.
 **/
