//
//  NSDictionary+RegexPath.m
//  CollectionPath
//
//  Created by Андрей Лазарев on 23/01/16.
//  Copyright © 2016 APPGRANULA. All rights reserved.
//

#import "NSDictionary+RegexPath.h"
#import "NSObject+RegexPath.h"

@implementation NSDictionary (CPSearchable)

-(void)enumarateLeafsWithPath:(NSString*)path
                     callback:(void (^)(id object, NSString* path))callback {
    path = path.length>0 ? [path stringByAppendingString:@"."] : @"";
    for (id key in self) {
        id object = self[key];
        NSString* fullPath = [path stringByAppendingString:key];
        callback(object, fullPath);
        if ([object respondsToSelector:@selector(enumarateLeafsWithPath:callback:)]) {
            [object enumarateLeafsWithPath:fullPath
                                  callback:callback];
        }
    }
}

@end
