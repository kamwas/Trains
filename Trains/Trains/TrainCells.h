//
//  TrainCells.h
//  Trains
//
//  Created by Kamil Wasag on 15/01/16.
//  Copyright © 2016 Figure8. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TrainCells : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *trainNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *departureTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *stationsLable;
@end
