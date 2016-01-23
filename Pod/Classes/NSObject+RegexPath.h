//
//  NSObject+RegexPath.h
//  CollectionPath
//
//  Created by Андрей Лазарев on 23/01/16.
//  Copyright © 2016 APPGRANULA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CPSearchable.h"

@interface NSObject (RegexPath)<CPSearchable>
-(NSDictionary*)valuesAndKeysForKeyRegexp:(NSString*)pattern;
-(NSDictionary*)valuesAndKeysForKeyWildcard:(NSString*)pattern;
-(NSArray*)valuesForKeyRegexp:(NSString*)pattern;
-(NSArray*)valuesForKeyWildcard:(NSString*)pattern;
-(id)firstForKeyWildcard:(NSString*)pattern;
-(id)firstForKeyRegexp:(NSString*)pattern;
@end
