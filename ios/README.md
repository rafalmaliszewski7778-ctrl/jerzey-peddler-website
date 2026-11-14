# Bubble Pop - iOS app

A native iPhone/iPad wrapper around `../bubble-pop/index.html`. The game file is
shared with the web version, so edit it there and both get the change.

## TestFlight steps (on the Mac)
1. Open `ios/BubblePop.xcodeproj` in Xcode.
2. Select the BubblePop target > Signing & Capabilities > Team: pick your developer team.
   (Bundle ID is `com.jerzeypeddlerllc.bubblepop`, so change it there if you want.)
3. Plug in the iPhone/iPad and press Run to test on the device first.
4. Choose "Any iOS Device (arm64)" as the destination, then Product > Archive.
5. In the Organizer: Distribute App > App Store Connect > Upload.
   Xcode offers to create the App Store Connect app record if it doesn't exist.
6. In App Store Connect > TestFlight, add testers once the build finishes processing.

For each new upload, raise the build number (target > General > Build).
