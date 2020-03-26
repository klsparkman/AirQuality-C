//
//  KLSPollution.h
//  AirQuality-C
//
//  Created by Kelsey Sparkman on 3/25/20.
//  Copyright © 2020 Kelsey Sparkman. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface KLSPollution : NSObject

@property (nonatomic, readonly) NSInteger airQualityIndexUS;

-(instancetype)initWithAirQualityIndexUS:(NSInteger)airQualityIndexUS;

-(instancetype)initWithDictionary:(NSDictionary<NSString *, id> *)dictionary;

@end

NS_ASSUME_NONNULL_END
