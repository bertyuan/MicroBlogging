//
//  MicroBloggingViewController.h
//  MicroBlogging
//
//  Created by yuan bert on 8/22/10.
//  Copyright home 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MicroBloggingViewController : UIViewController {
	IBOutlet id msgTableView;
	
	NSMutableArray* microMessages;
}

@property(nonatomic, retain) NSMutableArray* microMessages;

@end

