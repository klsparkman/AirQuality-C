//
//  KLSCityAirQualityModel.m
//  AirQuality-C
//
//  Created by Kelsey Sparkman on 3/25/20.
//  Copyright © 2020 Kelsey Sparkman. All rights reserved.
//

#import "KLSCityAirQualityModel.h"
#import "KLSWeather.h"
#import "KLSPollution.h"

@implementation KLSCityAirQualityModel

- (instancetype)initWithCity:(NSString *)city state:(NSString *)state country:(NSString *)country weather:(KLSWeather *)weather pollution:(KLSPollution *)pollution
{
    self = [super init];
    
    if (self) {
        _city = city;
        _state = state;
        _country = country;
        _weather = weather;
        _pollution = pollution;
    }
    return self;
}

@end

@implementation KLSCityAirQualityModel (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    NSString *city = dictionary[@"city"];
    NSString *state = dictionary[@"state"];
    NSString *country = dictionary[@"country"];
    NSDictionary *currentInfo = dictionary[@"current"];
    
    KLSWeather *weather = [[KLSWeather alloc] initWithDictionary:currentInfo[@"weather"]];
    KLSPollution *pollution = [[KLSPollution alloc] initWithDictionary:currentInfo[@"pollution"]];
    
    return [self initWithCity:city state:state country:country weather:weather pollution:pollution];
}

@end
