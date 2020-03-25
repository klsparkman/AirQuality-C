//
//  KLSCityAirQualityModel.h
//  AirQuality-C
//
//  Created by Kelsey Sparkman on 3/25/20.
//  Copyright © 2020 Kelsey Sparkman. All rights reserved.
//

#import <Foundation/Foundation.h>
@class KLSWeather;
@class KLSPollution;

NS_ASSUME_NONNULL_BEGIN

@interface KLSCityAirQualityModel : NSObject

@property (nonatomic, copy, readonly) NSString *city;
@property (nonatomic, copy, readonly) NSString *state;
@property (nonatomic, copy, readonly) NSString *country;
@property (nonatomic, copy, readonly) KLSWeather *weather;
@property (nonatomic, copy, readonly) KLSPollution *pollution;

-(instancetype)initWithCity:(NSString *)city state:(NSString *)state country:(NSString *)country weather:(KLSWeather *)weather pollution:(KLSPollution *)pollution;

-(instancetype)initWithDictionary:(NSDictionary<NSString *, id> *)dictionary;



@end

NS_ASSUME_NONNULL_END
