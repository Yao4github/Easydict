//
//  EZServiceStorage.m
//  Easydict
//
//  Created by tisfeng on 2022/11/22.
//  Copyright © 2022 izual. All rights reserved.
//

#import "EZLocalStorage.h"
#import "EZLog.h"

static NSString *const kServiceInfoStorageKey = @"kServiceInfoStorageKey";
static NSString *const kAllServiceTypesKey = @"kAllServiceTypesKey";
static NSString *const kQueryCountKey = @"kQueryCountKey";
static NSString *const kQueryCharacterCountKey = @"kQueryCharacterCountKey";

@interface EZLocalStorage ()

@end

@implementation EZLocalStorage


static EZLocalStorage *_instance;

+ (instancetype)shared {
    if (!_instance) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            _instance = [[self alloc] init];
        });
    }
    return _instance;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super allocWithZone:zone];
    });
    return _instance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

// init data, save all service info
- (void)setup {
    NSArray *allServiceTypes = [EZServiceTypes allServiceTypes];

    NSArray *allWindowTypes = @[ @(EZWindowTypeMini), @(EZWindowTypeFixed), @(EZWindowTypeMain) ];
    for (NSNumber *number in allWindowTypes) {
        EZWindowType windowType = [number integerValue];
        for (EZServiceType type in allServiceTypes) {
            EZServiceInfo *serviceInfo = [self serviceInfoWithType:type windowType:windowType];
            if (!serviceInfo) {
                serviceInfo = [[EZServiceInfo alloc] init];
                serviceInfo.type = type;
                serviceInfo.enabled = YES;
                serviceInfo.enabledQuery = YES;
                [self setServiceInfo:serviceInfo windowType:windowType];
            }
        }
    }
}

- (NSArray<EZServiceType> *)allServiceTypes:(EZWindowType)windowType {
    NSString *allServiceTypesKey = [self serviceTypesKeyOfWindowType:windowType];
    NSArray *allStoredServiceTypes = [[NSUserDefaults standardUserDefaults] objectForKey:allServiceTypesKey];
    if (!allStoredServiceTypes) {
        allStoredServiceTypes = [EZServiceTypes allServiceTypes];
        [[NSUserDefaults standardUserDefaults] setObject:allStoredServiceTypes forKey:allServiceTypesKey];
    } else {
        NSMutableArray *array = [NSMutableArray arrayWithArray:allStoredServiceTypes];
        NSArray *allServiceTypes = [EZServiceTypes allServiceTypes];
        if (allStoredServiceTypes.count != allServiceTypes.count) {
            for (EZServiceType type in allServiceTypes) {
                if ([allStoredServiceTypes indexOfObject:type] == NSNotFound) {
                    [array insertObject:type atIndex:0];
                }
            }
        }
        allStoredServiceTypes = [array copy];
    }

    return allStoredServiceTypes;
}
- (void)setAllServiceTypes:(NSArray<EZServiceType> *)allServiceTypes windowType:(EZWindowType)windowType {
    NSString *allServiceTypesKey = [self serviceTypesKeyOfWindowType:windowType];
    [[NSUserDefaults standardUserDefaults] setObject:allServiceTypes forKey:allServiceTypesKey];
}

- (NSArray<EZQueryService *> *)allServices:(EZWindowType)windowType {
    NSArray *allServices = [EZServiceTypes servicesFromTypes:[self allServiceTypes:windowType]];
    for (EZQueryService *service in allServices) {
        EZServiceInfo *serviceInfo = [self serviceInfoWithType:service.serviceType windowType:windowType];
        service.enabled = serviceInfo.enabled;
        service.enabledQuery = serviceInfo.enabledQuery;
    }
    return allServices;
}

- (void)setServiceInfo:(EZServiceInfo *)serviceInfo windowType:(EZWindowType)windowType {
    // ???: if save EZQueryService, mj_JSONData will Dead cycle.
    NSData *data = [serviceInfo mj_JSONData];
    NSString *serviceInfoKey = [self keyForServiceType:serviceInfo.type windowType:windowType];
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:serviceInfoKey];
}
- (EZServiceInfo *)serviceInfoWithType:(EZServiceType)type windowType:(EZWindowType)windowType {
    NSString *serviceInfoKey = [self keyForServiceType:type windowType:windowType];
    NSData *data = [[NSUserDefaults standardUserDefaults] objectForKey:serviceInfoKey];
    if (data) {
        return [EZServiceInfo mj_objectWithKeyValues:data];
    }
    return nil;
}

- (void)setService:(EZQueryService *)service windowType:(EZWindowType)windowType {
    EZServiceInfo *serviceInfo = [EZServiceInfo serviceInfoWithService:service];
    [self setServiceInfo:serviceInfo windowType:windowType];
}

- (void)setEnabledQuery:(BOOL)enabledQuery serviceType:(EZServiceType)serviceType windowType:(EZWindowType)windowType {
    EZServiceInfo *service = [self serviceInfoWithType:serviceType windowType:windowType];
    service.enabledQuery = enabledQuery;
    [self setServiceInfo:service windowType:windowType];
}

#pragma mark - Query count

- (void)increaseQueryCount:(NSString *)queryText {
    NSInteger count = [self queryCount];
    NSInteger level = [self queryLevel:count];
    count++;
    NSInteger newLevel = [self queryLevel:count];
    if (count == 1 || newLevel != level) {
        NSString *title = [self queryLevelTitle:newLevel chineseFlag:YES];
        NSLog(@"new level: %@", title);

        NSDictionary *dict = @{
            @"count" : [NSString stringWithFormat:@"%ld", count],
            @"level" : [NSString stringWithFormat:@"%ld", newLevel],
            @"title" : title,
        };
        [EZLog logEventWithName:@"query_count" parameters:dict];
    }

    [[NSUserDefaults standardUserDefaults] setInteger:count forKey:kQueryCountKey];

    NSInteger queryCharacterCount = [self queryCharacterCount];
    queryCharacterCount += queryText.length;
    [self saveQueryCharacterCount:queryCharacterCount];
}

- (NSInteger)queryCount {
    return [[NSUserDefaults standardUserDefaults] integerForKey:kQueryCountKey];
}

- (void)resetQueryCount {
    [[NSUserDefaults standardUserDefaults] setInteger:0 forKey:kQueryCountKey];
}

#pragma mark - Query character count

- (void)saveQueryCharacterCount:(NSInteger)count {
    [[NSUserDefaults standardUserDefaults] setInteger:count forKey:kQueryCharacterCountKey];
}

- (NSInteger)queryCharacterCount {
    return [[NSUserDefaults standardUserDefaults] integerForKey:kQueryCharacterCountKey];
}

#pragma mark -

/**
query count  | level | title
0-10         | 1     | 黑铁 Iron
10-100       | 2     | 青铜 Bronze
100-500      | 3     | 白银 Silver
500-2000     | 4     | 黄金 Gold
2000-5000    | 5     | 铂金 Platinum
5000-10000   | 6     | 钻石 Diamond
10000-20000  | 7     | 大师 Master
20000-50000  | 8     | 宗师 Grandmaster
50000-100000 | 9     | 王者 King
100000-∞     | 10    | 传奇 Legend
*/

- (NSInteger)queryLevel:(NSInteger)count {
    if (count < 10) {
        return 1;
    } else if (count < 100) {
        return 2;
    } else if (count < 500) {
        return 3;
    } else if (count < 2000) {
        return 4;
    } else if (count < 5000) {
        return 5;
    } else if (count < 10000) {
        return 6;
    } else if (count < 20000) {
        return 7;
    } else if (count < 50000) {
        return 8;
    } else if (count < 100000) {
        return 9;
    } else {
        return 10;
    }
}

- (NSString *)queryLevelTitle:(NSInteger)level chineseFlag:(BOOL)chineseFlag {
    NSString *title = nil;
    NSArray *titles = @[ @"黑铁", @"青铜", @"白银", @"黄金", @"铂金", @"钻石", @"大师", @"宗师", @"王者", @"传奇" ];
    NSArray *enTitles = @[ @"Iron", @"Bronze", @"Silver", @"Gold", @"Platinum", @"Diamond", @"Master", @"Grandmaster", @"King", @"Legend" ];

    level = MAX(level, 1);
    level = MIN(level, titles.count);

    if (chineseFlag) {
        title = titles[level - 1];
    } else {
        title = enTitles[level - 1];
    }

    return title;
}

#pragma mark -

- (NSString *)keyForServiceType:(EZServiceType)serviceType windowType:(EZWindowType)windowType {
    return [NSString stringWithFormat:@"%@-%@-%ld", kServiceInfoStorageKey, serviceType, windowType];
}

- (NSString *)serviceTypesKeyOfWindowType:(EZWindowType)windowType {
    return [NSString stringWithFormat:@"%@-%ld", kAllServiceTypesKey, windowType];
}

@end
