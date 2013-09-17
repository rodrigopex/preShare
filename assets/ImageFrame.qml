import bb.cascades 1.2

Container {
    id: self
    property bool big: false
    property alias text: label.text
    property double portion: 1.0
    property alias imageSource: img.imageSource
    property variant display: _displayInfo.getDisplayInfo()
    function isBig() {
        return self.big
    }
    function setBig(big) {
        if(self.big != big) {
            self.big = big
        }
    }
    function setFrameSize(big) {
        if (big) {
            self.preferredHeight = display["height"]
            self.preferredWidth = display["width"]
        } else {
            self.preferredHeight = display["height"] * (self.portion + 0.25)
            self.preferredWidth = display["width"] * (self.portion + 0.25)
        }
    }
    verticalAlignment: VerticalAlignment.Bottom
    horizontalAlignment: HorizontalAlignment.Right
    layout: DockLayout {
    }
    onCreationCompleted: {
        self.setFrameSize(false)
    }
    gestureHandlers: [
        TapHandler {

            onTapped: {
                big = ! big
                self.setFrameSize(big)
                console.log(label.text, "!!!")
            }
        }
    ]
    Container {
        topPadding: 12
        bottomPadding: 18
        leftPadding: 18
        rightPadding: 18
        background: bg.imagePaint
        attachedObjects: [
            ImagePaintDefinition {
                id: bg
                imageSource: "asset:///images/shadow.amd"
                repeatPattern: RepeatPattern.Fill
            }
        ]
        ImageView {
            id: img
            imageSource: "asset:///images/beer.jpeg"
            //scalingMethod: ScalingMethod.AspectFit
        }
    }
    Label {
        id: label
        horizontalAlignment: HorizontalAlignment.Center
        textStyle.base: defaultTextStyle.style
    }
}