//
//  TNConstans.h
//  TrainModel
//
//  Created by Kamil Wasag on 14/01/16.
//  Copyright © 2016 Figure8. All rights reserved.
//

#import <Foundation/Foundation.h>



const static NSString *kTMBaseURLString = @"http://api.irishrail.ie/realtime/realtime.asmx/";
const static NSString *KTMStartStation = @"Broombridge";
const static NSString *KTMDestinationStation = @"Booterstown";
typedef NSString TMEndpointMethod;
struct TMEndpointMethodsStructs {
    TMEndpointMethod const __unsafe_unretained * kTMGetAllStations;
    TMEndpointMethod const __unsafe_unretained * kTMGetStationDataByName;
    TMEndpointMethod const __unsafe_unretained * kTMGetTrainMovements;
};

extern const struct TMEndpointMethodsStructs TMEndpointMethods;
