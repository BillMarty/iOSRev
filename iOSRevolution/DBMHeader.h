//
//  DBMHeader.h
//  iOSRevolution
//
//  Created by Sean Marty on 7/16/14.
//  Copyright (c) 2014 dBMEDx. All rights reserved.
//

#import <Foundation/Foundation.h>
@class DBMScan;

@interface DBMHeader : NSObject
{
    unsigned char *charbuffer;
    unsigned short *shortbuffer;
    unsigned int *intbuffer;
}
+ (DBMHeader *)headerFromScan:(DBMScan *)scan;

@property (nonatomic) uint8_t byte1;
@property (nonatomic) uint8_t byte2;
@property (nonatomic) uint8_t byte3;
@property (nonatomic) uint8_t byte4;
@property (nonatomic) uint16_t amodeBytes;
@property (nonatomic) uint16_t bmodeScanlines;
@property (nonatomic) uint16_t cmodeSlices;
@property (nonatomic) uint16_t dmodeFrames;
@property (nonatomic) uint16_t axialOffset;
@property (nonatomic) uint16_t axialResolution;
@property (nonatomic) uint16_t phiResolution;
@property (nonatomic) uint16_t sliceResolution;
@property (nonatomic) uint16_t timeResolution;
@property (nonatomic) uint8_t codingScheme;
@property (nonatomic) uint8_t includedWalls;
@property (nonatomic) uint16_t volume3D;
@property (nonatomic) uint16_t rsrvd2;
@property (nonatomic) uint32_t n;

- (NSUInteger)firstFour:(NSData *)ws;
- (NSUInteger)dimensionsFour:(NSData *)ws nextloc:(NSUInteger)location;
- (NSUInteger)resolutionFive:(NSData *)ws nextloc:(NSUInteger)location;
- (NSUInteger)schemeAndWallsTwo:(NSData *)ws nextloc:(NSUInteger)location;
- (NSUInteger)volumeOne:(NSData *)ws nextloc:(NSUInteger)location;
- (NSUInteger)rsrvd2:(NSData *)ws nextloc:(NSUInteger)location;
- (void)n:(NSData *)ws nextloc:(NSUInteger)location;
- (void)generateVarVals:(NSData *)ws;
- (void)logHeader;

@end
