//
//  DBMMediator.m
//  iOSRevolution
//
//  Created by Sean Marty on 7/16/14.
//  Copyright (c) 2014 dBMEDx. All rights reserved.
//

#import "DBMMediator.h"

@implementation DBMMediator

// Creates an NSData object with all of the scan in it
- (void)grabWholeScan {
    NSLog(@"Starting grabWholeScan");
    
    NSString *filepath = [[NSBundle mainBundle] pathForResource:@"20140521Firstvolume.bin" ofType:nil];
    _wholeScan = [NSMutableData dataWithContentsOfFile:filepath];
    
    if (!_wholeScan) {
        NSLog(@"DID NOT IMPORT DATA CORRECTLY");
    }
    else {
        _wholeScanLength = _wholeScan.length;
        NSLog(@"Imported a scanner data file of length %lu bytes", _wholeScanLength);
    }
    
    NSLog(@"Finished grabWholeScan");
}

// Logs whole scan to screen to check that it is there, also logs length in bytes at the end
- (void)logWholeScan {
    NSLog(@"Starting logWholeScan");
    
    NSLog(@"%@ \n file size: %lu bytes", _wholeScan, _wholeScanLength);
    
    NSLog(@"Finished logWholeScan");
}


@end
