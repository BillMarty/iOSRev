//
//  DBMSliceTest.m
//  iOSRevolution
//
//  Created by Sean Marty on 8/1/14.
//  Copyright (c) 2014 dBMEDx. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DBMMediator.h"
#import "DBMScan.h"
#import "DBMHeader.h"
#import "DBMSlice.h"

@interface DBMSliceTest : XCTestCase

@end

@implementation DBMSliceTest

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testCreation
{
    DBMSlice *slice = [[DBMSlice alloc] initWithLines:120 points:602 walls:1];
    XCTAssertTrue(slice.lines == 120, @"lines wrong %zd", slice.lines);
}

- (void)testFill
{
    DBMSlice *slice = [[DBMSlice alloc] initWithLines:120 points:602 walls:1];
#define FILLVALUE 23
    [slice fillSliceArrayWith:FILLVALUE];
    
    
    uint16_t *arrayPointer = slice.linesPointsArray;
    for (NSInteger line = 0; line < slice.lines; line++) {
        for (NSInteger point = 0; point < slice.points; point++) {
            XCTAssertTrue(*arrayPointer++ == FILLVALUE, @"oops");
        }
    }


}

- (void)testCreateAndFill
{
    DBMMediator *mediator = [DBMMediator sharedMediator];
    DBMScan *scan = [mediator scan];
    DBMHeader *header = [DBMHeader headerFromScan:scan];
    [scan createAndFill8Slices];
    for (NSInteger sliceCount = 0; sliceCount < 8; sliceCount++) {
        // DBLog(@"Delimiter for slice #%ld: %@", (long)sliceCount, scan.slices[sliceCount]);
        XCTAssertEqual([scan.slices[sliceCount] sampleForLine:56 point:601], 1, @"Delimiter did not come out right");
    }
    
    
}

/* - (void)testSample
{
    DBMSlice *slice = [[DBMSlice alloc] initWithLines:120 points:602 walls:1];
    XCTAssertEqual([slice sampleForLine:45 point:(slice.points - 1)],
                   1,
                   @"didn't find the right delimiter");
}
*/
@end
