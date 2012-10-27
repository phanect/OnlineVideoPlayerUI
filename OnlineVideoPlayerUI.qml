import QtQuick 1.1
import QtWebKit 1.0
import QtDesktop 0.1
import "Views" as Views

Rectangle {
	id: base
	width: 1200
	height: 640

	Column {
		id: sidemenu
		width: 200

		PageButton {
			text: qsTr("Search")

			onClicked: {
				base.state = "SearchView";
			}

			anchors.right: parent.right
			anchors.left: parent.left

		}

		PageButton {
			text: qsTr("Video List")

			onClicked: {
				base.state = "VideoList";
			}

			anchors.right: parent.right
			anchors.left: parent.left

		}

		anchors.left: parent.left
		anchors.top: parent.top
		anchors.bottom: parent.bottom
	}

	Component.onCompleted: {
		base.state = "SearchView";
	}

	Views.SearchView {
		id: searchview

		visible: false // Invisible by default

		anchors.left: sidemenu.right
		anchors.right: base.right
		anchors.top: base.top
		anchors.bottom: base.bottom
	}

	Views.VideoList {
		id: videolist

		visible: false // Invisible by default

		anchors.left: sidemenu.right
		anchors.right: base.right
		anchors.top: base.top
		anchors.bottom: base.bottom
	}

	states: [
		State {
			name: "SearchView"
			PropertyChanges { target: searchview;	visible: true	}
			PropertyChanges { target: videolist;	visible: false	}
		},
		State {
			name: "VideoList"
			PropertyChanges { target: videolist;	visible: true	}
			PropertyChanges { target: searchview;	visible: false	}
		}
	]
}

/**
 ** Copyright (C) 2012 Jumpei Ogawa <phanective@gmail.com>
 ** See license.txt for copying this file
 **/
