//
//  UIImage+TUCAssetsHelper.m
//  TUCAssetsHelperDemo
//
//  Created by 朔 洪 on 16/3/7.
//  Copyright © 2016年 Tuccuay. All rights reserved.
//

#import "UIImage+TUCAssetsHelper.h"
#import <Photos/Photos.h>

@implementation UIImage (TUCAssetsHelper)

- (void)tuc_saveToCameraRoll {
    [self tuc_saveToCameraRollSuccess:nil failure:nil];
}

- (void)tuc_saveToCameraRollSuccess:(nullable void (^)())success
                            failure:(nullable void (^)(TUCAssetsHelperAuthorizationStatus status))failure {
    [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
        dispatch_async(dispatch_get_main_queue(), ^{
            switch (status) {
                case PHAuthorizationStatusNotDetermined: {
                    [self saveToCameraRollWithSuccess:success];
                    break;
                }
                case PHAuthorizationStatusRestricted: {
                    if (failure) {
                        failure(TUCAssetsHelperAuthorizationStatusRestricted);
                    }
                    break;
                }
                case PHAuthorizationStatusDenied: {
                    if (failure) {
                        failure(TUCAssetsHelperAuthorizationStatusDenied);
                    }
                    break;
                }
                case PHAuthorizationStatusAuthorized: {
                    [self saveToCameraRollWithSuccess:success];
                    break;
                }
            }
        });
    }];
}

- (void)tuc_saveToAlbumWithAppBundleName {
    [self tuc_saveToAlbumWithAppBundleNameSuccess:nil failure:nil];
}

- (void)tuc_saveToAlbumWithAppBundleNameSuccess:(nullable void (^)())success
                                        failure:(nullable void (^)(TUCAssetsHelperAuthorizationStatus status))failure {
    NSString *appBundleName = [NSBundle mainBundle].infoDictionary[(NSString *)kCFBundleNameKey];
    [self tuc_saveToAlbumWithAlbumName:appBundleName success:success failure:failure];
}

- (void)tuc_saveToAlbumWithAppLocalizedName {
    [self tuc_saveToAlbumWithAppLocalizedNameSuccess:nil failure:nil];
}

- (void)tuc_saveToAlbumWithAppLocalizedNameSuccess:(nullable void (^)())success
                                           failure:(nullable void (^)(TUCAssetsHelperAuthorizationStatus status))failure {
    NSString *appLocalizedName = NSLocalizedStringFromTable((NSString *)kCFBundleNameKey, @"InfoPlist", nil);
    [self tuc_saveToAlbumWithAlbumName:appLocalizedName success:success failure:failure];
}

- (void)tuc_saveToAlbumWithAlbumName:(NSString * _Nullable)albumName {
    [self tuc_saveToAlbumWithAlbumName:albumName success:nil failure:nil];
}

- (void)tuc_saveToAlbumWithAlbumName:(NSString * _Nullable)albumName
                             success:(nullable void (^)())success
                             failure:(nullable void (^)(TUCAssetsHelperAuthorizationStatus status))failure {
    [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
        dispatch_async(dispatch_get_main_queue(), ^{
            PHAssetCollection *album = [self getAlbumWithAlbumName:albumName];
            switch (status) {
                case PHAuthorizationStatusNotDetermined: {
                    [self addNewAssetToAlbum:album success:success];
                    break;
                }
                case PHAuthorizationStatusRestricted: {
                    if (failure) {
                        failure(TUCAssetsHelperAuthorizationStatusRestricted);
                    }
                    break;
                }
                case PHAuthorizationStatusDenied: {
                    if (failure) {
                        failure(TUCAssetsHelperAuthorizationStatusDenied);
                    }
                    break;
                }
                case PHAuthorizationStatusAuthorized: {
                    [self addNewAssetToAlbum:album success:success];
                    break;
                }
            }
        });
    }];
}

- (void)saveToCameraRollWithSuccess:(nullable void (^)())successBlock {
    [[PHPhotoLibrary sharedPhotoLibrary] performChanges:^{
        [PHAssetChangeRequest creationRequestForAssetFromImage:self];
    } completionHandler:^(BOOL success, NSError *error) {
        if (success) {
            if (successBlock) {
                successBlock();
            }
        } else {
#ifdef DEBUG
            NSLog(@"TUCAssetsHelper: %@", error);
#endif
        }
    }];
}

- (PHAssetCollection *)getAlbumWithAlbumName:(NSString *)albumName {
    PHFetchResult<PHAssetCollection *> *collections = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeAlbum subtype:PHAssetCollectionSubtypeAlbumRegular options:nil];
    for (PHAssetCollection *collection in collections) {
        if ([collection.localizedTitle isEqualToString:albumName]) {
            return collection;
        }
    }
    
    __block NSString *collectionIdentity = nil;
    BOOL performedChanges = [[PHPhotoLibrary sharedPhotoLibrary] performChangesAndWait:^{
        collectionIdentity = [PHAssetCollectionChangeRequest creationRequestForAssetCollectionWithTitle:albumName].placeholderForCreatedAssetCollection.localIdentifier;
    } error:nil];

    if(performedChanges) {
        return [PHAssetCollection fetchAssetCollectionsWithLocalIdentifiers:@[collectionIdentity] options:nil].firstObject;
    }

    return nil;
}

- (void)addNewAssetToAlbum:(PHAssetCollection *)album success:(nullable void (^)())successBlock {
    [[PHPhotoLibrary sharedPhotoLibrary] performChanges:^{
        PHAssetChangeRequest *createAssetRequest = [PHAssetChangeRequest creationRequestForAssetFromImage:self];
        PHAssetCollectionChangeRequest *albumChangeRequest = [PHAssetCollectionChangeRequest changeRequestForAssetCollection:album];
        PHObjectPlaceholder *assetPlaceholder = [createAssetRequest placeholderForCreatedAsset];
        [albumChangeRequest addAssets:@[ assetPlaceholder ]];
    } completionHandler:^(BOOL success, NSError *error) {
        if (success) {
            if (successBlock) {
                successBlock();
            }
        } else {
#ifdef DEBUG
            NSLog(@"TUCAssetsHelper: %@", error);
#endif
        }
    }];
}

@end
