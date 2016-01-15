//
//  TNServerConnection.m
//  TrainModel
//
//  Created by Kamil Wasag on 14/01/16.
//  Copyright © 2016 Figure8. All rights reserved.
//

#import "TMServerConnection.h"
#import "TMConstans.h"
#import "TMTrainMovment.h"
#import "DDXML.h"

@implementation TMServerConnection

+ (TMServerConnection *)sharedInstance {
    static TMServerConnection *singleton;
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        singleton = [TMServerConnection new];
    });
    return singleton;
}

- (void)getMyTrainsWitchCompletionHandler:(void(^)(TMStationData *trains, NSArray<TMTrainMovment*>*trainMovments))chandler{
    [self getTrainsOnMyStationWitchCompletionHandler:^(NSArray<TMStationData *> *trains, NSError *error) {
        for (TMStationData *data in trains) {
            [self getTrainsMovmentsWithTrainID:[data.Traincode stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] withCompletionHandler:^(NSArray<TMTrainMovment *> *trains, NSError *error) {
                NSPredicate *predicate = [NSPredicate predicateWithFormat:@"LocationFullName == %@", KTMDestinationStation];
                NSArray *filteredArray = [trains filteredArrayUsingPredicate:predicate];
                if (filteredArray.count > 0) {
                    chandler(data,trains);
                }
            }];
        }
    }];
}


- (NSURLSessionDataTask *)getTrainsMovmentsWithTrainID:(NSString *)trainId
                                 withCompletionHandler:(void(^)(NSArray<TMStationData*> *trains, NSError *error))cHandler{
    return [self downloadDataWithRequest:[self getURLForEndpoint:TMEndpointMethods.kTMGetTrainMovements witchParameters:@{@"TrainId":trainId,
                                                                                                                          @"TrainDate": @"not_def"}]
                  witchCompletionHandler:^(NSData *data, NSError *error) {
                      DDXMLDocument *xmlDoc = [[DDXMLDocument alloc] initWithData:data options:0 error:nil];
                      NSArray *xmlTrainMovements = [[xmlDoc rootElement] elementsForName:[TMTrainMovment xmlNodeName]];
                      NSMutableArray<TMTrainMovment *>* trainMovements = [NSMutableArray<TMTrainMovment*> new];
                      for (DDXMLElement* element in xmlTrainMovements) {
                          [trainMovements addObject:[[TMTrainMovment alloc] initWithXMLElement:[element XMLString]]];
                      }
                      cHandler([trainMovements copy],error);
                  }];
}


- (void)getTrainsOnMyStationWitchCompletionHandler:(void(^)(NSArray<TMStationData*> *trains, NSError *error))cHandler{
    [self downloadDataWithRequest:[self getURLForEndpoint:TMEndpointMethods.kTMGetStationDataByName witchParameters:@{@"StationDesc":KTMStartStation}] witchCompletionHandler:^(NSData *data, NSError *error) {
        if (!error) {
            DDXMLDocument *xmlDoc = [[DDXMLDocument alloc] initWithData:data options:0 error:nil];
            NSArray *xmlTrainsInfro = [[xmlDoc rootElement] elementsForName:[TMStationData xmlNodeName]];
            NSMutableArray<TMStationData*> *trainsInfo = [NSMutableArray<TMStationData*> new];
            for (DDXMLElement *element in xmlTrainsInfro) {
                [trainsInfo addObject:[[TMStationData alloc] initWithXMLElement:element.XMLString]];
            }
            cHandler([trainsInfo copy],error);
        }
    }];
}

- (NSURLRequest*)getURLForEndpoint:(TMEndpointMethod*)endpoint witchParameters:(NSDictionary*)parameters{
    NSMutableString *urlString = [[kTMBaseURLString stringByAppendingPathComponent:endpoint] mutableCopy];
    if (parameters) {
        [urlString appendString:@"?"];
        
        for (NSString *key in [parameters allKeys]){
            [urlString appendFormat:@"%@=%@&", key, [parameters objectForKey:key]];
        }
        
    }
    return [NSURLRequest requestWithURL:[NSURL URLWithString:[urlString substringToIndex:urlString.length-1]]];
}

- (NSURLSessionDataTask*)downloadDataWithRequest:(NSURLRequest*)request
         witchCompletionHandler:(void(^)(NSData *data, NSError *error))cHandler{
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (cHandler) {
            cHandler(data,error);
        }
    }];
    [task resume];
    return  task;
}

@end
