//
//  KLSCityAirQualityController.h
//  AirQuality-C
//
//  Created by Kelsey Sparkman on 3/25/20.
//  Copyright © 2020 Kelsey Sparkman. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface KLSCityAirQualityController : NSObject

+ (void)fetchSupportedCountries:(void(^) (NSArray<NSString *> *_Nullable))conmpletion;

+(void)fetchSupportedStatesInCountry:(NSString *)country completion:(void (^) (NSArray<NSString *> *_Nullable))completion;

+(void)fetchSupportedCitiesInState:(NSString *)state country:(NSString *)country completion:(void (^) (NSArray<NSString *> *_Nullable))completion;

+(void)fetchDataForCity:(NSString *)city state:(NSString *)state country:(NSString *)country completion:(void (^) (NSArray<NSString *> *_Nullable))completion;

@end

NS_ASSUME_NONNULL_END
