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
{
//    uint16_t linesPointsArray[LINES_ARRAY_SIZE][POINTS_ARRAY_SIZE];
}

@property (nonatomic, assign) uint16_t *linesPointsArray;
@property (nonatomic, assign) uint16_t lines;
@property (nonatomic, assign) uint16_t points;
@property (nonatomic, assign) uint16_t walls;
@property (nonatomic, assign) NSInteger sliceNum;

@property (nonatomic, copy) NSMutableArray *linesArray;

- (instancetype)initWithLines:(uint16_t)lines points:(uint16_t)points walls:(uint16_t)walls;
- (void)populateVariablesWithLines:(uint16_t)lines points:(uint16_t)points walls:(uint16_t)walls;
- (const uint16_t *)fillArray:(const uint16_t *)shortPtr;
- (void)logTest;
- (void)fillSliceArrayWith:(uint16_t)fillValue;

@end
