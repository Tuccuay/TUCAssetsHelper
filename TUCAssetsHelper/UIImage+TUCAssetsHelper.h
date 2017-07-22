//
//  UIImage+TUCAssetsHelper.h
//  TUCAssetsHelperDemo
//
//  Created by 朔 洪 on 16/3/7.
//  Copyright © 2016年 Tuccuay. All rights reserved.
//

/*
 PHAuthorizationStatusNotDetermined = 0, // User has not yet made a choice with regards to this application
 PHAuthorizationStatusRestricted,        // This application is not authorized to access photo data.
 // The user cannot change this application’s status, possibly due to active restrictions
 //   such as parental controls being in place.
 PHAuthorizationStatusDenied,            // User has explicitly denied this application access to photos data.
 PHAuthorizationStatusAuthorized         // User has authorized this application to access photos data.
 */

#import <UIKit/UIKit.h>

// see PHAuthorizationStatus
typedef NS_ENUM(NSInteger, TUCAssetsHelperAuthorizationStatus) {
    // User has explicitly denied this application access to photos data.
    TUCAssetsHelperAuthorizationStatusDenied = 0,
    
    // This application is not authorized to access photo data.
    // The user cannot change this application’s status, possibly due to active restrictions
    //   such as parental controls being in place.
    TUCAssetsHelperAuthorizationStatusRestricted
};

@interface UIImage (TUCAssetsHelper)

- (void)tuc_saveToCameraRoll  NS_SWIFT_NAME(tuc_saveToCameraRoll());
- (void)tuc_saveToCameraRollSuccess:(nullable void (^)())success
                            failure:(nullable void (^)(TUCAssetsHelperAuthorizationStatus status))failure NS_SWIFT_NAME(tuc_saveToCameraRoll(success:failure:));

- (void)tuc_saveToAlbumWithAppBundleName NS_SWIFT_NAME(tuc_saveToAlbumWithAppBundleName());
- (void)tuc_saveToAlbumWithAppBundleNameSuccess:(nullable void (^)())success
                                        failure:(nullable void (^)(TUCAssetsHelperAuthorizationStatus status))failure NS_SWIFT_NAME(tuc_saveToAlbumWithAppBundleName(success:failure:));

- (void)tuc_saveToAlbumWithAppLocalizedName NS_SWIFT_NAME(tuc_saveToAlbumWithAppLocalizedName())  ;
- (void)tuc_saveToAlbumWithAppLocalizedNameSuccess:(nullable void (^)())success
                                         failure:(nullable void (^)(TUCAssetsHelperAuthorizationStatus status))failure NS_SWIFT_NAME(tuc_saveToAlbumWithAppLocalizedName(success:failure:));

- (void)tuc_saveToAlbumWithAlbumName:(NSString * _Nullable)albumName NS_SWIFT_NAME(tuc_saveTo(album:));
- (void)tuc_saveToAlbumWithAlbumName:(NSString * _Nullable)albumName
                             success:(nullable void (^)())success
                             failure:(nullable void (^)(TUCAssetsHelperAuthorizationStatus status))failure NS_SWIFT_NAME(tuc_saveTo(album:success:failure:));



@end
