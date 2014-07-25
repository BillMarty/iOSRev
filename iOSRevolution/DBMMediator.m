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
    NSMutableData *scanData = [NSMutableData dataWithContentsOfFile:filepath];

    if (!scanData) {
        NSLog(@"DID NOT IMPORT DATA CORRECTLY");
    }
    else {
        self.wholeScan = scanData;
        NSLog(@"Imported a scanner data file of length %lu bytes", self.wholeScan.length);
    }
    
    NSLog(@"Finished grabWholeScan");
}

- (NSUInteger)wholeScanLength
{
    return self.wholeScan.length;
}

// Logs whole scan to screen to check that it is there, also logs length in bytes at the end

- (NSString *)description {
    return [NSString stringWithFormat:@"<%@ \n file size: %lu bytes>",
            self.wholeScan, self.wholeScan.length];
}


@end
