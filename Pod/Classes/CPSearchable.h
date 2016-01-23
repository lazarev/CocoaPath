//
//  CPSearchable.h
//  CollectionPath
//
//  Created by Андрей Лазарев on 23/01/16.
//  Copyright © 2016 APPGRANULA. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CPSearchable <NSObject>
@required
-(NSDictionary*)valuesAndKeysForKeyRegexp:(NSString*)pattern;
-(NSDictionary*)valuesAndKeysForKeyWildcard:(NSString*)pattern;
-(NSArray*)valuesForKeyRegexp:(NSString*)pattern;
-(NSArray*)valuesForKeyWildcard:(NSString*)pattern;
-(id)firstForKeyWildcard:(NSString*)pattern;
-(id)firstForKeyRegexp:(NSString*)pattern;
@optional
-(void)enumarateLeafsWithPath:(NSString*)path
                     callback:(void (^)(id object, NSString* path))callback;
@end
