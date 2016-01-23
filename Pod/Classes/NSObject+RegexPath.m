//
//  NSObject+RegexPath.m
//  CollectionPath
//
//  Created by Андрей Лазарев on 23/01/16.
//  Copyright © 2016 APPGRANULA. All rights reserved.
//

#import "NSObject+RegexPath.h"

@implementation NSObject (RegexPath)
-(NSDictionary *)pathIndex {
    if (![self respondsToSelector:@selector(enumarateLeafsWithPath:callback:)]) {
        return nil;
    }
    
    NSMutableDictionary* dictionary = [NSMutableDictionary dictionary];
    
    [self enumarateLeafsWithPath:nil
                        callback:^(id object, NSString *path) {
                            dictionary[path] = object;
                        }];

    return dictionary.copy;
}

-(NSArray*)valuesForKeyRegexp:(NSString*)pattern {
    return [self valuesAndKeysForKeyRegexp:pattern].allValues;
}

-(NSArray*)valuesForKeyWildcard:(NSString*)pattern {
    return [self valuesAndKeysForKeyWildcard:pattern].allValues;
}

-(id)firstForKeyWildcard:(NSString*)pattern {
    return [self valuesForKeyWildcard:pattern].firstObject;
}

-(id)firstForKeyRegexp:(NSString*)pattern {
    return [self valuesForKeyRegexp:pattern].firstObject;
}

-(NSDictionary*)valuesAndKeysForKeyWildcard:(NSString*)pattern {
    pattern = [pattern stringByReplacingOccurrencesOfString:@"[" withString:@"\\["];
    pattern = [pattern stringByReplacingOccurrencesOfString:@"]" withString:@"\\]"];
    pattern = [pattern stringByAppendingString:@"$"];
    return [self valuesAndKeysForKeyRegexp:pattern];
}

-(NSDictionary*)valuesAndKeysForKeyRegexp:(NSString*)pattern {
    NSRegularExpression* expression =
    [NSRegularExpression regularExpressionWithPattern:pattern
                                              options:0
                                                error:nil];

    if (![self respondsToSelector:@selector(enumarateLeafsWithPath:callback:)]) {
        return nil;
    }
    
    NSMutableDictionary* dictionary = [NSMutableDictionary dictionary];
    
    [self enumarateLeafsWithPath:nil
                        callback:^(id object, NSString *path) {
                            if ([expression firstMatchInString:path
                                                       options:0
                                                         range:NSMakeRange(0, path.length)])
                            {
                                dictionary[path] = object;
                            }
                        }];
    
    return dictionary.allValues.count > 0 ? dictionary.copy : nil;
}

@end
