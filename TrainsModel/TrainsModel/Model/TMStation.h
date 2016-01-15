//
//  TMStation.h
//  TrainModel
//
//  Created by Kamil Wasag on 15/01/16.
//  Copyright © 2016 Figure8. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TMStation : NSObject<NSCopying>

+(NSString*)xmlNodeName;
- (instancetype)initWithXMLElement:(NSString*)xmlObject;
@property (nonatomic, strong) NSString* StationDesc;
@property (nonatomic, strong) NSString* StationAlias;
@property (nonatomic) float StationLatitude;
@property (nonatomic) float StationLongitude;
@property (nonatomic, strong) NSString* StationCode;
@property (nonatomic) int StationId;
@end
