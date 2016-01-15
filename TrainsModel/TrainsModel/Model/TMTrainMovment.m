//
//  TMTrainMovment.m
//  TrainsModel
//
//  Created by Kamil Wasag on 15/01/16.
//  Copyright © 2016 Figure8. All rights reserved.
//

#import "TMTrainMovment.h"
#import "DDXML.h"

@implementation TMTrainMovment

+ (NSString *)xmlNodeName{
    return @"objTrainMovements";
}

- (instancetype)initWithXMLElement:(NSString*)xmlObject{
    if(self=[super init]){
        DDXMLElement* element = [[DDXMLElement alloc] initWithXMLString:xmlObject error:nil];
        if (element) {
            _TrainCode = [[[element elementsForName:@"TrainCode"] firstObject] stringValue];
            _TrainDate = [[[element elementsForName:@"TrainDate"] firstObject] stringValue];
            _LocationCode = [[[element elementsForName:@"LocationCode"] firstObject] stringValue];
            _LocationFullName = [[[element elementsForName:@"LocationFullName"] firstObject] stringValue];
            _LocationOrder = [[[element elementsForName:@"LocationOrder"] firstObject] stringValue];
            _LocationType = [[[element elementsForName:@"LocationType"] firstObject] stringValue];
            _TrainOrigin = [[[element elementsForName:@"TrainOrigin"] firstObject] stringValue];
            _TrainDestination = [[[element elementsForName:@"TrainDestination"] firstObject] stringValue];
            _ScheduledArrival = [[[element elementsForName:@"ScheduledArrival"] firstObject] stringValue];
            _ScheduledDeparture = [[[element elementsForName:@"ScheduledDeparture"] firstObject] stringValue];
            _ExpectedArrival = [[[element elementsForName:@"ExpectedArrival"] firstObject] stringValue];
            _ExpectedDeparture = [[[element elementsForName:@"ExpectedDeparture"] firstObject] stringValue];
            _Arrival = [[[element elementsForName:@"Arrival"] firstObject] stringValue];
            _Departure = [[[element elementsForName:@"Departure"] firstObject] stringValue];
            _AutoArrival = [[[element elementsForName:@"AutoArrival"] firstObject] stringValue];
            _AutoDepart = [[[element elementsForName:@"AutoDepart"] firstObject] stringValue];
            _StopType = [[[element elementsForName:@"StopType"] firstObject] stringValue];
        }
    }
    return self;
}

- (instancetype)copyWithZone:(NSZone *)zone
{
    TMTrainMovment*copy = [TMTrainMovment new];
    
    copy.TrainCode = _TrainCode;
    copy.TrainDate = _TrainDate;
    copy.LocationCode = _LocationCode;
    copy.LocationFullName = _LocationFullName;
    copy.LocationOrder = _LocationOrder;
    copy.LocationType = _LocationType;
    copy.TrainOrigin = _TrainOrigin;
    copy.TrainDestination= _TrainDestination;
    copy.ScheduledArrival= _ScheduledArrival;
    copy.ScheduledDeparture= _ScheduledDeparture;
    copy.ExpectedArrival= _ExpectedArrival;
    copy.ExpectedDeparture= _ExpectedDeparture;
    copy.Arrival= _Arrival;
    copy.Departure= _Departure;
    copy.AutoArrival= _AutoArrival;
    copy.AutoDepart= _AutoDepart;
    copy.StopType= _StopType;
    
    return copy;
}

@end
