//
//  DBMMediator.m
//  iOSRevolution
//
//  Created by Sean Marty on 7/16/14.
//  Copyright (c) 2014 dBMEDx. All rights reserved.
//

#import "DBMMediator.h"
#import "DBMScan.h"

@implementation DBMMediator

// Creates an NSData object with all of the scan in it
- (void)grabWholeScan {
    NSLog(@"Starting grabWholeScan");
    
    NSString *filepath = [[NSBundle mainBundle] pathForResource:@"20140521Firstvolume.bin" ofType:nil];
    _wholeScan = [NSData dataWithContentsOfFile:filepath];
    
    NSLog(@"Finished grabWholeScan");
}

// Logs whole scan to screen to check that it is there, also logs length in bytes at the end
- (void)logWholeScan {
    NSLog(@"Starting logWholeScan");
    
    NSLog(@"%@ \n%zd", _wholeScan, _wholeScan.length);
    
    NSLog(@"Finished logWholeScan");
}

- (void)pushToScan {
    NSLog(@"Starting pushToScan");
    
    _scan = [[DBMScan alloc] init];
    _scan.wholeScan = _wholeScan;
    [_scan calculateLength];
    [_scan logScanInfo];
    [_scan headerMake];
    
    NSLog(@"Finished pushToScan");
}

- (void)putItAllTogether {
    [self grabWholeScan];
    // [self logWholeScan];
    [self pushToScan];
}

@end
