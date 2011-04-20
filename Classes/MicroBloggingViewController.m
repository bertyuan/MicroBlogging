//
//  MicroBloggingViewController.m
//  MicroBlogging
//
//  Created by yuan bert on 8/22/10.
//  Copyright home 2010. All rights reserved.
//

#import "MicroBloggingViewController.h"
#import "MicroMessageCell.h"

@implementation MicroBloggingViewController

@synthesize microMessages;

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

- (void)addFlexibleSpace:(NSMutableArray*)toolbarItems{
	UIBarButtonItem* barBtnItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
	[toolbarItems addObject:barBtnItem];
	[barBtnItem release];
}

- (void)initNavagationBarItems{
	UIBarButtonItem* barBtnItem = nil;
	
	barBtnItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleBordered target:self action:@selector(onBack)];
	self.navigationItem.leftBarButtonItem = barBtnItem;
	[barBtnItem release];
	
	barBtnItem = [[UIBarButtonItem alloc] initWithTitle:@"撰写" style:UIBarButtonItemStyleBordered target:self action:@selector(onCompose)];
	self.navigationItem.rightBarButtonItem = barBtnItem;
	[barBtnItem release];
	
}

- (void)initToolbarItems{
	
	NSMutableArray* toolbarItems = [NSMutableArray array];
	UIBarButtonItem* barBtnItem = nil;
	
	barBtnItem = [[UIBarButtonItem alloc] initWithTitle:@"转发" style:UIBarButtonItemStyleBordered target:self action:@selector(onForward)];
	[toolbarItems addObject:barBtnItem];
	[barBtnItem release];
	
	[self addFlexibleSpace:toolbarItems];
	
	barBtnItem = [[UIBarButtonItem alloc] initWithTitle:@"评论" style:UIBarButtonItemStyleBordered target:self action:@selector(onComment)];
	[toolbarItems addObject:barBtnItem];
	[barBtnItem release];
	
	[self setToolbarItems:toolbarItems animated:NO];
	
}

- (void)viewWillAppear:(BOOL)animated{
	if ([self navigationController] != nil) {
		[self initToolbarItems];
		[[self navigationController] setToolbarHidden:NO animated:animated];
		[self initNavagationBarItems];
		[[self navigationController] setNavigationBarHidden:NO animated:animated];		
	}
	
	[super viewWillAppear:animated];
}
	 

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	// There is only one section.
	return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	// Return the number of time zone names.
	return [microMessages count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	static NSString *MyIdentifier = @"MyIdentifier";
	
	// Try to retrieve from the table view a now-unused cell with the given identifier.
	MicroMessageCell *cell = (MicroMessageCell*)[tableView dequeueReusableCellWithIdentifier:MyIdentifier];
	
	// If no cell is available, create a new one using the given identifier.
	if (cell == nil) {
		// Use the default cell style.
		cell = [[[MicroMessageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier] autorelease];
	}
	
	MicroMessageInfo* messageInfo = [microMessages objectAtIndex:indexPath.row];
	[cell setMessageInfo:messageInfo];
	
	return cell;
}

/*
 To conform to Human Interface Guildelines, since selecting a row would have no effect (such as navigation), make sure that rows cannot be selected.
 */
- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	return indexPath;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
	return UITableViewCellEditingStyleNone;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	MicroMessageCell *cell = (MicroMessageCell*)[self tableView:tableView cellForRowAtIndexPath:indexPath];
	return [cell cellHeight];
}

- (IBAction)onBack {
}

- (IBAction)onCompose {
}

- (IBAction)onForward {
}

- (IBAction)onComment {
}

@end
