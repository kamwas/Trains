//
//  ViewController.m
//  Trains
//
//  Created by Kamil Wasag on 15/01/16.
//  Copyright © 2016 Figure8. All rights reserved.
//

#import "ViewController.h"
#import "TrainCells.h"
#import <TrainsModel/TrainsModel.h>

@interface ViewController ()

@property (nonatomic, strong) NSMutableDictionary *datastructure;

@end

@implementation ViewController


- (NSMutableDictionary *)datastructure{
    if (!_datastructure) {
        _datastructure = [NSMutableDictionary new];
    }
    return _datastructure;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [[TMServerConnection sharedInstance] getMyTrainsWitchCompletionHandler:^(TMStationData *train, NSArray<TMTrainMovment*>* trainMovments) {
        NSSortDescriptor *soritng = [[NSSortDescriptor alloc] initWithKey:@"LocationOrder" ascending:YES];
        [trainMovments sortedArrayUsingDescriptors:@[soritng]];
        [self.datastructure setValue:[trainMovments sortedArrayUsingDescriptors:@[soritng]] forKey:train];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    }];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.datastructure.allKeys.count;
}

- (TrainCells*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"TrainCell";
    TrainCells *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    TMStationData *train = self.datastructure.allKeys[indexPath.row];
    NSArray<TMTrainMovment*> *movments = self.datastructure[train];
    cell.trainNumberLabel.text = train.Traincode;
    
    NSMutableString *string = [NSMutableString new];
    for (int i = 0; i < movments.count;i++) {
        [string appendFormat:@"%@, ",movments[i].LocationFullName];
        if ([movments[i].LocationFullName compare:KTMDestinationStation options:NSCaseInsensitiveSearch])
        {
            cell.departureTimeLabel.text = movments[i].ScheduledDeparture;
        }
    }
    cell.stationsLable.text = string;
    return cell;
    
}

@end
