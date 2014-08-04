//
//  VolumeViewController.m
//  iOSRevolution
//
//  Created by Sean Marty on 7/16/14.
//  Copyright (c) 2014 dBMEDx. All rights reserved.
//

#import "VolumeViewController.h"
#import "HeaderDisplayViewController.h"
#import "DBMHeader.h"
#import "DBMMediator.h"
#import "DBMScan.h"
#import "DBMSlice.h"

@interface VolumeViewController ()

@end

@implementation VolumeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    // Chunk of code to bring in data, parse to header variables
    
    DBMMediator *mediator = [DBMMediator sharedMediator];
    
    DBMScan *scan = [mediator scan];
    
    DBMHeader *header = [DBMHeader headerFromScan:scan];
    
    [scan createAndFill8Slices];
    
    for (NSInteger sliceCount = 0; sliceCount < 8; sliceCount++) {
        DBLog(@"Delimiter for slice #%ld: %hu", (long)sliceCount, [scan.slices[sliceCount] sampleForLine:119 point:601]);
    }

    // DBLog(@"%@", header);
    
    
    // [scan fill8Slices];
    // [scan slicesLogTest];
    
    
    // Displaying the volume reading to the screen
    
    NSString *volumeDisplay = [NSString stringWithFormat:@"%uml", header.volume3D];
    self.volumeNumDisplay.text = volumeDisplay;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
