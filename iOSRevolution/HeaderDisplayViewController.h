//
//  HeaderDisplayViewController.h
//  iOSRevolution
//
//  Created by Sean Marty on 7/23/14.
//  Copyright (c) 2014 dBMEDx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeaderDisplayViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *headerDataType;
@property (weak, nonatomic) IBOutlet UILabel *headerVolume;
@property (weak, nonatomic) IBOutlet UILabel *headerPoints;
@property (weak, nonatomic) IBOutlet UILabel *headerLines;
@property (weak, nonatomic) IBOutlet UILabel *headerSlices;
@property (weak, nonatomic) IBOutlet UILabel *headerWalls;
@property (weak, nonatomic) IBOutlet UILabel *headerTotalBytes;
@property (nonatomic) UITableView *taskTable;
@property (nonatomic) NSMutableArray *data;

@end
