//
//  ViewController.m
//  TUCAssetsHelperDemo
//
//  Created by 朔 洪 on 16/3/9.
//  Copyright © 2016年 Tuccuay. All rights reserved.
//

#import "ViewController.h"

#import "UIImage+TUCAssetsHelper.h"

@interface ViewController ()

@property (nonatomic, strong) UIImage *image;
@property (weak, nonatomic) IBOutlet UITextField *customAlbumName;
@property (weak, nonatomic) IBOutlet UISwitch *showDebugMessageSwitch;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (IBAction)saveToCameraRoll:(id)sender {
    if (self.showDebugMessageSwitch.isOn) {
        [self.image tuc_saveToCameraRollSuccess:^{
            NSLog(@"save to camera roll: success!");
        } failure:^(TUCAssetsHelperAuthorizationStatus status) {
            NSLog(@"save to camera roll: Denied!");
        }];
    } else {
        [self.image tuc_saveToCameraRoll];
    }
}

- (IBAction)saveToAppBundleNameAlbum:(id)sender {
    if (self.showDebugMessageSwitch.isOn) {
        [self.image tuc_saveToAlbumWithAppBundleNameSuccess:^{
            NSLog(@"save to app bundle name album: success!");
        } failure:^(TUCAssetsHelperAuthorizationStatus status) {
            NSLog(@"save to app bundle name album: Denied!");
        }];
    } else {
        [self.image tuc_saveToAlbumWithAppBundleName];
    }
}

- (IBAction)saveToAppLocalizedNameAlbum:(id)sender {
    if (self.showDebugMessageSwitch.isOn) {
        [self.image tuc_saveToAlbumWithAppLocalizedNameSuccess:^{
            NSLog(@"save to app localized name album: success!");
        } failure:^(TUCAssetsHelperAuthorizationStatus status) {
            NSLog(@"save to app localized name album: Denied!");
        }];
    } else {
        [self.image tuc_saveToAlbumWithAppLocalizedName];
    }
}

- (IBAction)saveToCustomNameAlbum:(id)sender {
    if (self.showDebugMessageSwitch.isOn) {
        [self.image tuc_saveToAlbumWithAlbumName:self.customAlbumName.text success:^{
            NSLog(@"save to custom name album: success!");
        } failure:^(TUCAssetsHelperAuthorizationStatus status) {
            NSLog(@"save to custom name album: Denied!");
        }];
    } else {
        [self.image tuc_saveToAlbumWithAlbumName:self.customAlbumName.text];
    }
}


- (UIImage *)image {
	if(_image == nil) {
		_image = [UIImage imageNamed:@"TUCAssetsHelper-Canton-PRC"];
	}
	return _image;
}

@end
