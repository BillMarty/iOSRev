//
//  DBMHeader.m
//  iOSRevolution
//
//  Created by Sean Marty on 7/16/14.
//  Copyright (c) 2014 dBMEDx. All rights reserved.
//

#import "DBMHeader.h"

@implementation DBMHeader

- (void)firstFour:(NSData *)x {
    charbuffer = malloc(100);
    NSRange range;
    range.location = 0;
    range.length = 4;
    [x getBytes:charbuffer range:range];
    _byte1 = charbuffer[0];
    _byte2 = charbuffer[1];
    _byte3 = charbuffer[2];
    _byte4 = charbuffer[3];
}

- (void)dimensionsFour:(NSData *)x {
    shortbuffer = malloc(100);
    NSRange range;
    range.location = 4;
    range.length = 8;
    [x getBytes:shortbuffer range:range];
    _amodeBytes = shortbuffer[0];
    _bmodeScanlines = shortbuffer[1];
    _cmodeSlices = shortbuffer[2];
    _dmodeFrames = shortbuffer[3];
}

- (void)resolutionFive:(NSData *)x {
    shortbuffer = malloc(100);
    NSRange range;
    range.location = 12;
    range.length = 10;
    [x getBytes:shortbuffer range:range];
    _axialOffset = shortbuffer[0];
    _axialResolution = shortbuffer[1];
    _phiResolution = shortbuffer[2];
    _sliceResolution = shortbuffer[3];
    _timeResolution = shortbuffer[4];
}

- (void)schemeAndWallsTwo:(NSData *)x {
    charbuffer = malloc(100);
    NSRange range;
    range.location = 22;
    range.length = 2;
    [x getBytes:charbuffer range:range];
    _codingScheme = charbuffer[0];
    _includedWalls = charbuffer[1];
}

- (void)volumeOne:(NSData *)x {
    shortbuffer = malloc(100);
    NSRange range;
    range.location = 24;
    range.length = 2;
    [x getBytes:shortbuffer range:range];
    _volume3D = shortbuffer[0];
}

- (void)rsrvd2:(NSData *)x {
    shortbuffer = malloc(100);
    NSRange range;
    range.location = 26;
    range.length = 2;
    [x getBytes:shortbuffer range:range];
    _rsrvd2 = shortbuffer[0];
}

- (void)n:(NSData *)x {
    intbuffer = malloc(100);
    NSRange range;
    range.location = 28;
    range.length = 4;
    [x getBytes:intbuffer range:range];
    _n = intbuffer[0];
}

- (void)logHeader {
    NSLog(@"\n %c \n %c \n %c \n %c \n %u \n %u \n %u \n %u \n %u \n %u \n %u \n %u \n %u \n %u \n %u \n %u \n %u \n %u \n", _byte1, _byte2, _byte3, _byte4, _amodeBytes, _bmodeScanlines, _cmodeSlices, _dmodeFrames, _axialOffset, _axialResolution, _phiResolution, _sliceResolution, _timeResolution, _codingScheme, _includedWalls, _volume3D, _rsrvd2, _n);
}

@end
