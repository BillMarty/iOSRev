//
//  DBMHeader.h
//  iOSRevolution
//
//  Created by Sean Marty on 7/16/14.
//  Copyright (c) 2014 dBMEDx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DBMHeader : NSObject
{
    unsigned char *charbuffer;
    unsigned short *shortbuffer;
    unsigned int *intbuffer;
}
@property (nonatomic) unsigned char byte1;
@property (nonatomic) unsigned char byte2;
@property (nonatomic) unsigned char byte3;
@property (nonatomic) unsigned char byte4;
@property (nonatomic) unsigned short amodeBytes;
@property (nonatomic) unsigned short bmodeScanlines;
@property (nonatomic) unsigned short cmodeSlices;
@property (nonatomic) unsigned short dmodeFrames;
@property (nonatomic) unsigned short axialOffset;
@property (nonatomic) unsigned short axialResolution;
@property (nonatomic) unsigned short phiResolution;
@property (nonatomic) unsigned short sliceResolution;
@property (nonatomic) unsigned short timeResolution;
@property (nonatomic) unsigned char codingScheme;
@property (nonatomic) unsigned char includedWalls;
@property (nonatomic) unsigned short volume3D;
@property (nonatomic) unsigned short rsrvd2;
@property (nonatomic) unsigned int n;

- (NSUInteger)firstFour:(NSMutableData *)ws;
- (NSUInteger)dimensionsFour:(NSMutableData *)ws nextloc:(NSUInteger)location;
- (NSUInteger)resolutionFive:(NSMutableData *)ws nextloc:(NSUInteger)location;
- (NSUInteger)schemeAndWallsTwo:(NSMutableData *)ws nextloc:(NSUInteger)location;
- (NSUInteger)volumeOne:(NSMutableData *)ws nextloc:(NSUInteger)location;
- (NSUInteger)rsrvd2:(NSMutableData *)ws nextloc:(NSUInteger)location;
- (void)n:(NSMutableData *)ws nextloc:(NSUInteger)location;
- (void)generateVarVals:(NSMutableData *)ws;
- (void)logHeader;

@end
