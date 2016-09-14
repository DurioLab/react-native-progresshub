//
//  RNProgressHUB.m
//  RNProgressHUB
//
//  Created by ma arno on 16/9/12.
//  Copyright © 2016年 amsoft. All rights reserved.
//

#import "RNProgressHUB.h"
#import "MBProgressHUD.h"


typedef NS_ENUM(NSInteger, RNProgressHUBMode) {
    /// Ring-shaped progress view.
    RNProgressHUBModeAnnularDeterminate,
    /// Horizontal progress bar.
    RNProgressHUBModeDeterminateHorizontalBar
};

@interface RNProgressHUB()


@property (nonatomic,strong) MBProgressHUD *hub;
@property (nonatomic,strong) UIWindow *window;


@end

@implementation RNProgressHUB


-(UIWindow *)window{
    if (!_window) {
        _window = [UIApplication sharedApplication].keyWindow;
    }
    return _window;
}

RCT_EXPORT_MODULE();


RCT_EXPORT_METHOD(showSimpleText:(NSString *)message duration:(NSInteger)duration)
{
    
    dispatch_async(dispatch_get_main_queue(), ^{
        if(self.hub){
            [self.hub hideAnimated:YES];
        }
        self.hub = [MBProgressHUD showHUDAddedTo:self.window animated:YES];
        self.hub.mode = MBProgressHUDModeText;
        self.hub.label.text = message;
        
        if (self.hub) {
            [self.hub hideAnimated:YES afterDelay:duration / 1000];
            self.hub = NULL;
        }
    });
    
}
RCT_EXPORT_METHOD(showSpinIndeterminate)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        if(self.hub){
            [self.hub hideAnimated:YES];
        }
        self.hub = [MBProgressHUD showHUDAddedTo:self.window animated:YES];
        self.hub.mode = MBProgressHUDModeIndeterminate;
    });
}
RCT_EXPORT_METHOD(showSpinIndeterminateWithTitle:(NSString *)title)
{

    dispatch_async(dispatch_get_main_queue(), ^{
        if(self.hub){
            [self.hub hideAnimated:YES];
        }
        self.hub = [MBProgressHUD showHUDAddedTo:self.window animated:YES];
        self.hub.mode = MBProgressHUDModeIndeterminate;
        self.hub.label.text = title;
    });
    
}
RCT_EXPORT_METHOD(showSpinIndeterminateWithTitleAndDetails:(NSString *)title content:(NSString *)details)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        if(self.hub){
            [self.hub hideAnimated:YES];
        }
        self.hub = [MBProgressHUD showHUDAddedTo:self.window animated:YES];
        self.hub.mode = MBProgressHUDModeIndeterminate;
        self.hub.label.text = title;
        self.hub.detailsLabel.text = details;
    });
}
RCT_EXPORT_METHOD(showDeterminate:(NSInteger *)mode title:(NSString *)title details:(NSString *)details)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        if(self.hub){
            [self.hub hideAnimated:YES];
        }
        self.hub = [MBProgressHUD showHUDAddedTo:self.window animated:YES];
    
        if(mode == RNProgressHUBModeAnnularDeterminate){
            self.hub.mode = MBProgressHUDModeAnnularDeterminate;
        } else if(mode == RNProgressHUBModeDeterminateHorizontalBar){
            self.hub.mode = MBProgressHUDModeDeterminateHorizontalBar;
        }
        
        if (title) {
            self.hub.label.text = title;
        }
        if(details){
            self.hub.detailsLabel.text = details;
        }
     
    });
}

RCT_EXPORT_METHOD(setProgress:(CGFloat)progress )
{
    dispatch_async(dispatch_get_main_queue(), ^{
        if (_hub) {
            [MBProgressHUD HUDForView:self.window].progress = progress;
        }
    });
}

RCT_EXPORT_METHOD(dismiss)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        if(self.hub){
            [self.hub hideAnimated:YES];
            self.hub = NULL;
        }
    });
}


@end
