# TUCAssetsHelper
[![GitHub license](https://img.shields.io/github/license/mashape/apistatus.svg)]()
[![CocoaPods](https://img.shields.io/cocoapods/v/TUCAssetsHelper.svg)]()
[![CocoaPods](https://img.shields.io/cocoapods/p/TUCAssetsHelper.svg)]()

Save `UIImage *` to iOS devices Photos Library: `[image tuc_saveToCameraRoll]`, well down!

TUCAssetsHelper using Photos Framework, is supporting iOS 8.0 and newer, not support iOS 7 (need ALAssetsLibrary).

### Installation with CocoaPods

To integrate TUCAssetsHelper into your Xcode project using CocoaPods, specify it in your `Podfile`:
```ruby
pod 'TUCAssetsHelper'
```
Then, run the following command:
```bash
pod install
```

### save to camera roll
```objective-c
[image tuc_saveToCameraRoll];

// using block
[image tuc_saveToCameraRollSuccess:^{
    NSLog(@"save to camera roll: success!");
} failure:^(TUCAssetsHelperAuthorizationStatus status) {
    NSLog(@"save to camera roll: Denied!");
}];
```
*OR Swift*
```swift
image.tuc_saveToCameraRoll()

image.tuc_saveToCameraRoll(success:{() in

}, failure: {(status) in 
    switch(satus) {
        case .denied:
            print("save to camera roll: success!")
            break
        case .restricted:
            print("save to camera roll: Denied!")
    }
})

```


### save to app bundle name album
app bundle name -> Info.plist -> Bundle Name(CFBundleName)
```objective-c
[image tuc_saveToAlbumWithAppBundleName];

[image tuc_saveToAlbumWithAppBundleNameSuccess:^{
    NSLog(@"save to app bundle name album: success!");
} failure:^(TUCAssetsHelperAuthorizationStatus status) {
    NSLog(@"save to app bundle name album: Denied!");
}];
```

*OR Swift*
```swift
image.tuc_saveToAlbumWithAppBundleName()

image.tuc_saveToAlbumWithAppBundleName(success:{() in

}, failure: {(status) in 
    switch(satus) {
        case .denied:
            print("save to camera roll: success!")
            break
        case .restricted:
            print("save to camera roll: Denied!")
    }
})

```
### save to app localized name album
app localized name -> InfoPlist.string -> CFBundleName
```objective-c
[image tuc_saveToAlbumWithAppLocalizedName];

[image tuc_saveToAlbumWithAppLocalizedNameSuccess:^{
    NSLog(@"save to app localized name album: success!");
} failure:^(TUCAssetsHelperAuthorizationStatus status) {
    NSLog(@"save to app localized name album: Denied!");
}];
```
*OR Swift*
```swift
image.tuc_saveToAlbumWithAppLocalizedName()

image.tuc_saveToAlbumWithAppLocalizedName(success:{() in

}, failure: {(status) in 
    switch(satus) {
        case .denied:
            print("save to camera roll: success!")
            break
        case .restricted:
            print("save to camera roll: Denied!")
    }
})

```
### save to custom name album
```objective-c
[image tuc_saveToAlbumWithAlbumName:@"any album name here"];

[self.image tuc_saveToAlbumWithAlbumName:@"custom album name" success:^{
    NSLog(@"save to custom name album: success!");
} failure:^(TUCAssetsHelperAuthorizationStatus status) {
    NSLog(@"save to custom name album: Denied!");
}];
```
*OR Swift*
```swift
image.tuc_saveTo(album:"any album name here")

image.tuc_saveTo(album:"any album name here", 
    success:{() in

    },
    failure: {(status) in 
    switch(satus) {
        case .denied:
            print("save to camera roll: success!")
            break
        case .restricted:
            print("save to camera roll: Denied!")
    }
})

```
## License

Mantle is released under the MIT license. See
[LICENSE](https://github.com/Tuccuay/TUCAssetsHelper/blob/master/LICENSE).

## More Info

Have a question? Please [open an issue](https://github.com/Tuccuay/TUCAssetsHelper/issues/new)!
