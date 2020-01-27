# iOS_BootStrap


iOS BootStrap Script is a helper for Bootstraping iOS Projects with 5 Seconds of your time.

## How It Works

Its magical. You are a developer you do not need to know that. It will be much
helpful for you if you just look into the Usage. 

## Prerequisites 
You need to know how to use a computer.


## Usage

```sh
First Download this awesome Repostiory & import it into xCode 
```

## Renaming The Project

```sh
Step 1 - Rename the project
Click on the project you want to rename in the "Project navigator" on the left of the Xcode view.
On the right select the "File inspector" and the name of your project should be in there under "Identity and Type", change it to the new name.
Click "Rename" in a dropdown menu

Step 2 - Rename the Scheme
In the top bar (near "Stop" button), there is a scheme for your OLD product, click on it, then go to "Manage schemes"
Click on the OLD name in the scheme, and it will become editable, change the name

Step 3 - Rename the folder with your assets
Quit Xcode
In the correctly named master folder, there is a newly named xcodeproj file with the wrongly named OLD folder. Rename the OLD folder to your new name
Reopen the project, you will see a warning: "The folder OLD does not exist", dismiss the warning
In the "Project navigator" on the left, click the top level OLD folder name
In Utilities pane under "Identity and type" you will see the "Name" entry, change this from the OLD to the new name
Just below there is a "Location" entry. Click on a folder with the OLD name and chose the newly renamed folder

Step 4 - Rename the Build plist data**
Click on the project in the "Project navigator" on the left, in the main panel select "Build Settings"
Search for "plist" in this section
Under packaging, you will see Info.plist, and Product bundle identifier
Rename the top entry in Info.plist
Do the same for Product Identifier
```

## Frameworks
```sh
'RxSwift', '4.3.1'
'RxCocoa', '4.3.1'
'RxFlow', '1.6.0'
'Reusable', '4.0.3'
'RxDataSources', '3.1.0'
'SwiftLint', '0.27.0'
'Alamofire', '4.7.3'
'XCGLogger', '6.1.0'
'Kingfisher', '4.10.0'
'Fabric', '1.7.12'
'Crashlytics', '3.10.8'
'Firebase/Core'
'Firebase/DynamicLinks'
'GoogleAnalytics'
'Google-Mobile-Ads-SDK'
'AppsFlyerFramework', '4.8.9'
'KeychainAccess', '3.1.1'
'youtube-ios-player-helper', '0.1.6'
'AMScrollingNavbar', '5.1.0'
'SnapKit', '4.0.1'
'IQKeyboardManagerSwift', '6.1.1'
'SkeletonView', '1.4.0'
'RxGesture', '2.0.1'
'Gifu', '3.2.0'
'Firebase/Messaging'
'CryptoSwift', '0.12.0'
'UITextView+Placeholder'
'XLPagerTabStrip', '8.0.1'
'ReachabilitySwift'
```

## License
MIT




