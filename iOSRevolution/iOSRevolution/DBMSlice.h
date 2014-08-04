//
//  DBMSlice.h
//  iOSRevolution
//
//  Created by Sean Marty on 7/23/14.
//  Copyright (c) 2014 dBMEDx. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface DBMSlice : NSObject

@property (nonatomic) unsigned short lines;
@property (nonatomic) unsigned short points;
@property (nonatomic) unsigned short walls;
@property (nonatomic) int sliceNum;

@property (nonatomic, copy) NSMutableArray *linesArray;

- (instancetype)initWithLines:(unsigned short)lines Points:(unsigned short)points Walls:(unsigned short)walls;
- (void)populateVariablesWithLines:(unsigned short)lines Points:(unsigned short)points Walls:(unsigned short)walls;
- (unsigned short *)populateLinesArray:(unsigned short *)shortPtr;

- (void)logTest;

@end
