//
//  HeaderDisplayViewController.m
//  iOSRevolution
//
//  Created by Sean Marty on 7/23/14.
//  Copyright (c) 2014 dBMEDx. All rights reserved.
//

#import "HeaderDisplayViewController.h"
#import "DBMMEdiator.h"
#import "DBMHeader.h"
#import "DBMSlice.h"
#import "DBMScan.h"

@interface HeaderDisplayViewController ()

@end

@implementation HeaderDisplayViewController

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
    
    
    // Chunk of code that brings in the data from the file and creates a header with correct values
    // I shouldn't need this here once I figure out how to "pass an object to the next view"
    
    /* DBMMediator *mediator = [[DBMMediator alloc] init];
    
    [mediator grabWholeScan];
    
    DBMHeader *header = [[DBMHeader alloc] init];
    
    [header generateVarVals:mediator.wholeScan];
    // [header logHeader]; */
    
    
    
    // Attempt at using my new DBMSlice object.  Works up until filling the array
    
    unsigned short *shortPtr = [scan.rawData mutableBytes];
    shortPtr += 16;
    
    DBMSlice *testSlice = [[DBMSlice alloc] init];
    [testSlice populateVariablesWithLines:header.bmodeScanlines Points:header.amodeBytes Walls:header.includedWalls];
    [testSlice populateLinesArray:shortPtr];
    
    NSLog(@"%hu , %hu , %hu", testSlice.lines, testSlice.points, testSlice.walls);
    
    /* for (int n = 0; n < header.bmodeScanlines; n++) {
        NSLog(@"%@", testSlice.linesArray[n][300]);
    } */
    
    [testSlice logTest];
    
    
    
    // Populating all of the label items on this page ...

    /* 
    NSString *headerDataType = [NSString stringWithFormat:@"Data Type: %c%c%c%c", header.byte1, header.byte2, header.byte3, header.byte4];
    _headerDataType.text = headerDataType;
    
    NSString *headerVolume = [NSString stringWithFormat:@"Volume: %u", header.volume3D];
    _headerVolume.text = headerVolume;
    
    NSString *headerPoints = [NSString stringWithFormat:@"Points: %u", (header.amodeBytes / 2)];
    _headerPoints.text = headerPoints;
    
    NSString *headerLines = [NSString stringWithFormat:@"Lines: %u", header.bmodeScanlines];
    _headerLines.text = headerLines;
    
    NSString *headerSlices = [NSString stringWithFormat:@"Slices: %u", header.cmodeSlices];
    _headerSlices.text = headerSlices;
    
    if (header.includedWalls == 1) {
        NSString *headerWalls = [NSString stringWithFormat:@"Walls Included: YES"];
        _headerWalls.text = headerWalls;
    }
    else if (header.includedWalls == 0) {
        NSString *headerWalls = [NSString stringWithFormat:@"Walls Included: NO"];
        _headerWalls.text = headerWalls;
    }
    else {
        NSString *headerWalls = [NSString stringWithFormat:@"Error in Wall Value"];
        _headerWalls.text = headerWalls;
    }
    
    NSString *headerTotalBytes = [NSString stringWithFormat:@"Total Scan: %u bytes", header.n];
    _headerTotalBytes.text = headerTotalBytes;
    */
    
    
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
