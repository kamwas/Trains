//
//  TMTrain.m
//  TrainsModel
//
//  Created by Kamil Wasag on 15/01/16.
//  Copyright © 2016 Figure8. All rights reserved.
//

#import "TMStationData.h"
#import "DDXML.h"

@implementation TMStationData


- (instancetype)initWithXMLElement:(NSString*)xmlObject{
    if(self=[super init]){
        DDXMLElement* element = [[DDXMLElement alloc] initWithXMLString:xmlObject error:nil];
        if (element) {
            _Servertime = [[[element elementsForName:@"Servertime"] firstObject] stringValue];
            _Traincode = [[[element elementsForName:@"Traincode"] firstObject] stringValue];
            _Stationfullname = [[[element elementsForName:@"Stationfullname"] firstObject] stringValue];
            _Stationcode = [[[element elementsForName:@"Stationcode"] firstObject] stringValue];
            _Querytime = [[[element elementsForName:@"Querytime"] firstObject] stringValue];
            _Traindate = [[[element elementsForName:@"Traindate"] firstObject] stringValue];
            _Origin = [[[element elementsForName:@"Origin"] firstObject] stringValue];
            _Destination = [[[element elementsForName:@"Destination"] firstObject] stringValue];
            _Origintime = [[[element elementsForName:@"TrainCode"] firstObject] stringValue];
            _Destinationtime = [[[element elementsForName:@"TrainCode"] firstObject] stringValue];
            _Status = [[[element elementsForName:@"TrainCode"] firstObject] stringValue];
            _Lastlocation = [[[element elementsForName:@"TrainCode"] firstObject] stringValue];
            _Duein = [[[element elementsForName:@"TrainCode"] firstObject] stringValue];
            _Late = [[[element elementsForName:@"TrainCode"] firstObject] stringValue];
            _Exparrival = [[[element elementsForName:@"TrainCode"] firstObject] stringValue];
            _Expdepart = [[[element elementsForName:@"TrainCode"] firstObject] stringValue];
            _Scharrival = [[[element elementsForName:@"TrainCode"] firstObject] stringValue];
            _Schdepart = [[[element elementsForName:@"TrainCode"] firstObject] stringValue];
            _Direction = [[[element elementsForName:@"TrainCode"] firstObject] stringValue];
            _Traintype = [[[element elementsForName:@"TrainCode"] firstObject] stringValue];
            _Locationtype = [[[element elementsForName:@"TrainCode"] firstObject] stringValue];
        }
    }
    return self;
}

- (instancetype)copyWithZone:(NSZone *)zone
{
    TMStationData*copy = [TMStationData new];
    
    copy.Servertime = _Servertime;
    copy.Traincode= _Traincode;
    copy.Stationfullname = _Stationfullname;
    copy.Stationcode = _Stationcode;
    copy.Querytime = _Querytime;
    copy.Traindate = _Traindate;
    copy.Origin = _Origin;
    copy.Destination = _Destination;
    copy.Origintime = _Origintime;
    copy.Destinationtime = _Destinationtime;
    copy.Status = _Status;
    copy.Lastlocation = _Lastlocation;
    copy.Duein = _Duein;
    copy.Late = _Late;
    copy.Exparrival = _Exparrival;
    copy.Expdepart = _Expdepart;
    copy.Scharrival = _Scharrival;
    copy.Schdepart = _Schdepart;
    copy.Direction = _Direction;
    copy.Traintype = _Traintype;
    copy.Locationtype = _Locationtype;
    
    return copy;
}


+ (NSString *)xmlNodeName{
    return @"objStationData";
}

@end
