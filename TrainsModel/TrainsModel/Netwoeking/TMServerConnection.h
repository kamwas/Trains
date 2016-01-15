//
//  TNServerConnection.h
//  TrainModel
//
//  Created by Kamil Wasag on 14/01/16.
//  Copyright © 2016 Figure8. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TMStationData.h"
#import "TMTrainMovment.h"

@interface TMServerConnection : NSObject

+ (TMServerConnection *)sharedInstance;
- (void)getMyTrainsWitchCompletionHandler:(void(^)(TMStationData *trains, NSArray<TMTrainMovment*>*trainMovments))chandler;

@end
