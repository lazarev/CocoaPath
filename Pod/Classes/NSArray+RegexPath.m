//
//  NSArray+RegexPath.m
//  CollectionPath
//
//  Created by Андрей Лазарев on 23/01/16.
//  Copyright © 2016 APPGRANULA. All rights reserved.
//

#import "NSArray+RegexPath.h"
#import "NSObject+RegexPath.h"

@implementation NSArray (CPSearchable)
-(void)enumarateLeafsWithPath:(NSString*)path
                     callback:(void (^)(id object, NSString* path))callback {
    for (id object in self) {
        NSUInteger index = [self indexOfObject:object];
        NSString* fullPath = [NSString stringWithFormat:@"%@[%ld]", path ?: @"", (unsigned long)index];
        callback(object, fullPath);
        if ([object respondsToSelector:@selector(enumarateLeafsWithPath:callback:)]) {
            [object enumarateLeafsWithPath:fullPath
                                  callback:callback];
        }
    }
}

@end
