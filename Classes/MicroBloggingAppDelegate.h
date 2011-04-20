//
//  MicroBloggingAppDelegate.h
//  MicroBlogging
//
//  Created by yuan bert on 8/22/10.
//  Copyright home 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MicroBloggingViewController;

@interface MicroBloggingAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    MicroBloggingViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet MicroBloggingViewController *viewController;

- (void)generateMicroMessages;

@end

