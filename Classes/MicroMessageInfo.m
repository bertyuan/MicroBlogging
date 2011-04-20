//
//  MicroMessageInfo.m
//  MicroBlogging
//
//  Created by yuan bert on 8/22/10.
//  Copyright 2010 home. All rights reserved.
//

#import "MicroMessageInfo.h"


@implementation MicroMessageInfo

@synthesize name, portrait, client, date, message;

- (id)initWithName:(NSString*)_name portrait:(NSString*)_portraitStr client:(NSString*)_client date:(NSString*)_date message:(NSString*)_message {
	if (self = [super init]) {
		name = [_name retain];
		portrait = nil;
		portraitStr = [_portraitStr retain];
		client = [_client retain];
		date = [_date retain];
		message = [_message retain];
	}
	return self;
}

- (void)dealloc {
	[name release];
	[portrait release];
	[portraitStr release];
	[client release];
	[date release];
	[message release];
	[super dealloc];
}

- (UIImage* )portrait {
	if (portrait == nil) {
		portrait = [[UIImage imageNamed:portraitStr] retain];
	}
	return portrait;
}

@end
