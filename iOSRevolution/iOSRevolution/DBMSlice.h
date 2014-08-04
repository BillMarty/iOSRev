//
//  DBMSlice.h
//  iOSRevolution
//
//  Created by Sean Marty on 7/23/14.
//  Copyright (c) 2014 dBMEDx. All rights reserved.
//

#import <Foundation/Foundation.h>

#define LINES_ARRAY_SIZE    120
#define POINTS_ARRAY_SIZE   602


@interface DBMSlice : NSObject

@property (nonatomic, assign) uint16_t *linesPointsArray;
@property (nonatomic, assign) uint16_t lines;
@property (nonatomic, assign) uint16_t points;
@property (nonatomic, assign) uint16_t walls;
@property (nonatomic, assign) NSInteger sliceNum;

@property (nonatomic, copy) NSMutableArray *linesArray;

- (instancetype)initWithLines:(uint16_t)lines points:(uint16_t)points walls:(uint16_t)walls;
- (void)fillSliceNumber:(NSInteger)sliceNum fromData:(NSData*)wholeScan;
- (uint16_t)sampleForLine:(uint16_t)line point:(uint16_t)point;

@end
