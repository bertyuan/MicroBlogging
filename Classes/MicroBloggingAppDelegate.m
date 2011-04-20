//
//  MicroBloggingAppDelegate.m
//  MicroBlogging
//
//  Created by yuan bert on 8/22/10.
//  Copyright home 2010. All rights reserved.
//

#import "MicroBloggingAppDelegate.h"
#import "MicroBloggingViewController.h"
#import "MicroMessageInfo.h"

@implementation MicroBloggingAppDelegate

@synthesize window;
@synthesize viewController;


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after application launch.
	[self generateMicroMessages];
	UINavigationController *aNavigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
	[window addSubview:[aNavigationController view]];
	//[aNavigationController release];
	
    // Add the view controller's view to the window and display.
    //[window addSubview:viewController.view];
    [window makeKeyAndVisible];

    return YES;
}

- (void)generateMicroMessages {
	NSMutableArray* microMessages = [[NSMutableArray alloc] init];
	NSArray* infos = [NSArray arrayWithObjects:
					  @"偷吃嘴的家伙", @"p1.jpeg", @"Android客户端", @"1分钟前", @"娄山关路的小吃不错，今天和一堆朋友一起，大战3个小时，过足了瘾",  
					  @"赵菁Kelly", @"p2.jpeg", @"Android客户端", @"2分钟前", @"招行真便利，拿着手机就能办理业务",  
					  @"作家棉花", @"p3.jpeg", @"新浪微波", @"2分钟前", @"赶稿子，又是一夜未眠。。。", 
					  @"李湾顺", @"p4.jpeg", @"iPhone客户端", @"3分钟前", @"太变态了，明早3点集合",  
					  @"ForeverLove", @"p6.jpeg", @"Android客户端", @"3小时前", @"多亏Android客户端，让我能定到最后一班飞机",  
					  @"小花姐姐", @"p5.jpeg", @"iPhone客户端", @"半小时前", @"热带风暴真好玩，我们全湿身了",  
					  @"花样男子", @"p7.jpeg", @"Android客户端", @"8小时前", @"我对各种小糕点情有独钟。醒了，有点饿，在考虑是继续睡觉还是起床吃饭",  
					  @"军雷哥哥", @"p8.jpeg", @"Android客户端", @"1天前", @"招行手机业务拓展不错，看来我要买入招行股票了",  
					  nil];
	
	int count = [infos count]/5;
	for (int i = 0; i < count; ++i) {
		MicroMessageInfo* msg = [[MicroMessageInfo alloc] initWithName:[infos objectAtIndex:i*5+0] portrait:[infos objectAtIndex:i*5+1] client:[infos objectAtIndex:i*5+2] date:[infos objectAtIndex:i*5+3] message:[infos objectAtIndex:i*5+4]];
		[microMessages addObject:msg];
		[msg release];
	}
	
	[viewController setMicroMessages:microMessages];
	[microMessages release];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
