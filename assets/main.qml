import bb.cascades 1.2
import bb.cascades.pickers 1.0

Page {
    Menu.definition: MenuDefinition {
        settingsAction: SettingsActionItem {
            onTriggered : {
                console.log("Settings!!!")
            }
        }
        helpAction: HelpActionItem {
            onTriggered: {
                console.log("Help!!!")
            }            
        }
        actions: [
            ActionItem {
                title: "Info"
                imageSource: "asset:///images/ic_info.png"
                onTriggered: {
                    console.log("Info!!!")
                }
            }
        ]
    }
    actions: [
        ActionItem {
            title: "Save as"
            enabled: bigger.isBig() || medium.isBig() || small.isBig()
            imageSource: "asset:///images/ic_save_as.png"
            ActionBar.placement: ActionBarPlacement.OnBar
        },
        ActionItem {
            title: "Save"
            enabled: bigger.isBig() || medium.isBig() || small.isBig()
            imageSource: "asset:///images/ic_save.png"
            ActionBar.placement: ActionBarPlacement.OnBar
        }
    ]
    Container {
        layout: DockLayout {
        }
        background: bgDef.imagePaint
        ImageFrame {
            id: bigger
            text: "75%"
            portion: 0.75
        }
        ImageFrame {
            id: medium
            opacity: 1 * ! bigger.isBig()
            text: "50%"
            portion: 0.45
        }
        ImageFrame {
            id: small
            visible: 1 * (! bigger.isBig() && ! medium.isBig())
            text: "25%"
            portion: 0.25
        }
    }
    attachedObjects: [
        TextStyleDefinition {
            id: defaultTextStyle
            color: Color.create("#f8f8f8")
            base: SystemDefaults.TextStyles.BigText
        },
        ImagePaintDefinition {
            id: bgDef
            imageSource: "asset:///images/wood.jpeg"
        },
        FilePicker {
            id: filePicker
            type: FileType.Picture
            title: "Select Picture"
            directories: [ "/accounts/1000/shared/camera" ]
            onFileSelected: {
                console.log("FileSelected signal received : " + selectedFiles);

                //make sure to prepend "file://" when using as a source for an ImageView or MediaPlayer
                bigger.imageSource = "file://" + selectedFiles
                medium.imageSource = "file://" + selectedFiles
                small.imageSource = "file://" + selectedFiles
            }
        }
    ]
}
