# TUCAssetsHelper
Save `UIImage *` to iOS devices Photos Library: `[image tuc_saveToCameraRoll]`, well down!

TUCAssetsHelper using Photos Framework, is supporting iOS 8.0 and newer, not support iOS 7 (need ALAssetsLibrary).

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

### save to custom name album
```objective-c
[image tuc_saveToAlbumWithAlbumName:@"any album name here"];

[self.image tuc_saveToAlbumWithAlbumName:@"custom album name" success:^{
    NSLog(@"save to custom name album: success!");
} failure:^(TUCAssetsHelperAuthorizationStatus status) {
    NSLog(@"save to custom name album: Denied!");
}];
```

## License

Mantle is released under the MIT license. See
[LICENSE.md](https://github.com/Tuccuay/TUCAssetsHelper/blob/master/LICENSE.md).

## More Info

Have a question? Please [open an issue](https://github.com/Tuccuay/TUCAssetsHelper/issues/new)!
