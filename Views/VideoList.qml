import QtQuick 1.1
import QtDesktop 0.1

Rectangle {
	width: 800
	height: 600
	Column {

		//
		// Toolbar
		//
		Rectangle {

			Row {
				spacing: 5

				Text {
					text: "URL:"
				}

				TextField {
					id: videoUrlInput
					width: 240
					text: "http://"

					//				// Select all characters on clicked event
					//				MouseArea {
					//					anchors.fill: parent
					//					onClicked: {
					//						parent.selectAll();
					//					}
					//				}
				}

				Text {
					text: "Video Title: "
				}

				TextField {
					id: videoTitleInput
					width: 240

					//				// Select all characters on clicked event
					//				MouseArea {
					//					anchors.fill: parent
					//					onClicked: {
					//						parent.selectAll();
					//					}
					//				}
				}

				// Video Add Button
				Button {
					text:"Add Video"


					onClicked: {
						if (videoTitleInput.text === "" || !videoUrlInput.text === ""){  // validate before
							dialog.show("Fill both Title and URL text box.");
							return;
						} else {
							dialog.show(videoManager.addVideo(videoTitleInput.text, videoUrlInput.text));
							// TODO Reflect added video to the list
						}
					}

				} // Button end
			}

			width: childrenRect.width
			height: childrenRect.height + 20 // 20 is margin.
		} // Toolbar end


		//
		// Video List
		//
		Rectangle{
			Grid {
				rows: 2
				columns: 5
				spacing: 2

				Rectangle {
					color: "#808080"
					Text {
						text: "Title"
					}
					width: childrenRect.width
					height: childrenRect.height
				}
			}

			width: childrenRect.width
			height: childrenRect.height
		}
	}

	//
	// Dialog
	//
	Dialog{
		id: dialog
		anchors.centerIn: parent
	}
}

/**
 ** Copyright (C) 2012 Jumpei Ogawa <phanective@gmail.com>
 ** This file is licensed under MIT license.
 ** See license.txt for copying this file.
 **/
