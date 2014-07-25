//
//  VolumeViewController.m
//  iOSRevolution
//
//  Created by Sean Marty on 7/16/14.
//  Copyright (c) 2014 dBMEDx. All rights reserved.
//

#import "VolumeViewController.h"
#import "DBMHeader.h"
#import "DBMMediator.h"

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
    
    DBMHeader *header = [[DBMHeader alloc] init];
    
    [header generateVarVals:mediator.wholeScan];
    // [header logHeader];
    DBLog(@"%@", header);
    
    
    
    // Displaying the volume reading to the screen
    
    NSString *volumeDisplay = [NSString stringWithFormat:@"%uml", header.volume3D];
    self.volumeNumDisplay.text = volumeDisplay;
    
    
    
    // Earlier attempt at filling a 3D array of NSMutableArrays... Did not work...
    
    /* unsigned char *charbuffer;
    int points = header.amodeBytes;
    int cols = header.bmodeScanlines;
    int sls = header.cmodeSlices;
    
    NSRange range;
    range.location = 32;
    range.length = points;
    
    NSMutableArray *slices = [[NSMutableArray alloc] init];
    
    for (int j = 0; j < sls; j++) {
        NSMutableArray *frame = [[NSMutableArray alloc] init];
        for (int i = 0; i < cols; i++) {
            charbuffer = nil;
            charbuffer = malloc(points);
        
            NSMutableData *row = [[NSMutableData alloc] init];
            [mediator.wholeScan getBytes:charbuffer range:range];
            [row appendBytes:charbuffer length:points];
            
            [frame addObject:row];
        }
        [slices addObject:frame];
    }
    NSLog(@"%@", slices[0][0]); */
    
    
    
    // Working way to fill a 2D array with the data needed, and used a pointer.
    // Just need to add this to an object, problem comes when I can't declare array size at build time
    
    int samples = (header.amodeBytes / 2);  // converting bytes to samples
    
    unsigned short *shortPtr = [mediator.wholeScan mutableBytes];
    shortPtr += 16;  // Increment past the header to point at 17th u short
    
    unsigned short array[header.bmodeScanlines][samples];
    
    
    for (int j = 0; j < header.bmodeScanlines; j++) {
        for (int k = 0; k < samples; k++) {
            array[j][k] = *shortPtr++;
        }
    }
    
    for (int n = 0; n < 120; n++) {
        NSLog(@"%x", array[n][601]);
    }
    
    
    
    
    
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
