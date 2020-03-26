//
//  KLSPollution.m
//  AirQuality-C
//
//  Created by Kelsey Sparkman on 3/25/20.
//  Copyright © 2020 Kelsey Sparkman. All rights reserved.
//

#import "KLSPollution.h"


@implementation KLSPollution

- (instancetype)initWithAirQualityIndexUS:(NSInteger)airQualityIndexUS
{
    self = [super init];
    if (self)
    {
        _airQualityIndexUS = airQualityIndexUS;
    }
    return self;
}

@end

@implementation KLSPollution (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary<NSString *, id> *)dictionary
{
    NSInteger airQualityIndexUS = [dictionary [@"auius"] intValue];
    
    return [self initWithAirQualityIndexUS:airQualityIndexUS];
    
}

@end
