//
//  TMStation.m
//  TrainModel
//
//  Created by Kamil Wasag on 15/01/16.
//  Copyright © 2016 Figure8. All rights reserved.
//

#import "TMStation.h"
#import "DDXML.h"
@implementation TMStation

- (instancetype)initWithXMLElement:(NSString*)xmlObject{
    if(self=[super init]){
        DDXMLElement* element = [[DDXMLElement alloc] initWithXMLString:xmlObject error:nil];
        if (element) {
            _StationAlias = [[[element elementsForName:@"StationAlias"] firstObject] stringValue];
            _StationCode = [[[element elementsForName:@"StationCode"] firstObject] stringValue];
            _StationDesc = [[[element elementsForName:@"StationDesc"] firstObject] stringValue];
            _StationId = [[[[element elementsForName:@"StationId"] firstObject] stringValue] intValue];
            _StationLatitude = [[[[element elementsForName:@"StationLatitude"] firstObject] stringValue] floatValue];
            _StationLongitude = [[[[element elementsForName:@"StationLongitude"] firstObject] stringValue] floatValue];
        }
    }
    return self;
}

- (instancetype)copyWithZone:(NSZone *)zone
{
    TMStation*copy = [TMStation new];
    
    copy.StationAlias = _StationAlias;
    copy.StationCode = _StationCode;
    copy.StationDesc = _StationDesc;
    copy.StationId = _StationId;
    copy.StationLatitude = _StationLatitude;
    copy.StationLongitude = _StationLongitude;
    
    return copy;
}

+ (NSString *)xmlNodeName{
    return @"objStation";
}

@end
