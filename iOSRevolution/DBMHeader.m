//
//  DBMHeader.m
//  iOSRevolution
//
//  Created by Sean Marty on 7/16/14.
//  Copyright (c) 2014 dBMEDx. All rights reserved.
//

#import "DBMHeader.h"
#import "DBMScan.h"

@implementation DBMHeader

- (NSUInteger)firstFour:(NSData *)ws {
    charbuffer = malloc(4);
    NSRange range;
    range.location = 0;
    range.length = 4;
    [ws getBytes:charbuffer range:range];
    _byte1 = charbuffer[0];
    _byte2 = charbuffer[1];
    _byte3 = charbuffer[2];
    _byte4 = charbuffer[3];
    
    return range.location + range.length;
}

- (NSUInteger)dimensionsFour:(NSData *)ws nextloc:(NSUInteger)location {
    shortbuffer = malloc(8);
    NSRange range;
    range.location = location;
    range.length = 8;
    [ws getBytes:shortbuffer range:range];
    _amodeBytes = shortbuffer[0];
    _bmodeScanlines = shortbuffer[1];
    _cmodeSlices = shortbuffer[2];
    _dmodeFrames = shortbuffer[3];
    
    return range.location + range.length;
}

- (NSUInteger)resolutionFive:(NSData *)ws nextloc:(NSUInteger)location {
    shortbuffer = malloc(10);
    NSRange range;
    range.location = 12;
    range.length = 10;
    [ws getBytes:shortbuffer range:range];
    _axialOffset = shortbuffer[0];
    _axialResolution = shortbuffer[1];
    _phiResolution = shortbuffer[2];
    _sliceResolution = shortbuffer[3];
    _timeResolution = shortbuffer[4];
    
    return range.location + range.length;
}

- (NSUInteger)schemeAndWallsTwo:(NSData *)ws nextloc:(NSUInteger)location {
    charbuffer = malloc(2);
    NSRange range;
    range.location = 22;
    range.length = 2;
    [ws getBytes:charbuffer range:range];
    _codingScheme = charbuffer[0];
    _includedWalls = charbuffer[1];
    
    return range.location + range.length;
}

- (NSUInteger)volumeOne:(NSData *)ws nextloc:(NSUInteger)location {
    shortbuffer = malloc(2);
    NSRange range;
    range.location = 24;
    range.length = 2;
    [ws getBytes:shortbuffer range:range];
    _volume3D = shortbuffer[0];
    
    return range.location + range.length;
}

- (NSUInteger)rsrvd2:(NSData *)ws nextloc:(NSUInteger)location {
    shortbuffer = malloc(2);
    NSRange range;
    range.location = 26;
    range.length = 2;
    [ws getBytes:shortbuffer range:range];
    _rsrvd2 = shortbuffer[0];
    
    return range.location + range.length;
}

- (void)n:(NSData *)ws nextloc:(NSUInteger)location {
    intbuffer = malloc(4);
    NSRange range;
    range.location = 28;
    range.length = 4;
    [ws getBytes:intbuffer range:range];
    _n = intbuffer[0];
}


// Method to essentially combine my previous 7 into one easy to use method
+ (DBMHeader *)headerFromScan:(DBMScan *)scan
{
    DBMHeader *result = [[DBMHeader alloc] init];
    [result generateVarVals:scan.rawData];
    return result;
}

- (void)generateVarVals:(NSData *)ws {
    NSUInteger nextLocation = [self firstFour:ws];
    nextLocation = [self dimensionsFour:ws nextloc:nextLocation];
    nextLocation = [self resolutionFive:ws nextloc:nextLocation];
    nextLocation = [self schemeAndWallsTwo:ws nextloc:nextLocation];
    nextLocation = [self volumeOne:ws nextloc:nextLocation];
    nextLocation = [self rsrvd2:ws nextloc:nextLocation];
    [self n:ws nextloc:nextLocation];
}


// Log the header data in a user friendly way

- (void)logHeader {
    NSLog(@" %c%c%c%c", _byte1, _byte2, _byte3, _byte4);
    NSLog(@" %u", _amodeBytes);
    NSLog(@" %u", _bmodeScanlines);
    NSLog(@" %u", _cmodeSlices);
    NSLog(@" %u", _dmodeFrames);
    NSLog(@" %u", _axialOffset);
    NSLog(@" %u", _axialResolution);
    NSLog(@" %u", _phiResolution);
    NSLog(@" %u", _sliceResolution);
    NSLog(@" %u", _timeResolution);
    NSLog(@" %u", _codingScheme);
    NSLog(@" %u", _includedWalls);
    NSLog(@" %u", _volume3D);
    NSLog(@" %u", _rsrvd2);
    NSLog(@" %u", _n);
}

@end
