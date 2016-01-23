//
//  CocoaPathTests.m
//  CocoaPathTests
//
//  Created by Андрей Лазарев on 01/24/2016.
//  Copyright (c) 2016 Андрей Лазарев. All rights reserved.
//
// https://github.com/Specta/Specta

#import "CPSearchable.h"
#import "NSObject+RegexPath.h"

SpecBegin(InitialSpecs)

describe(@"dictionary", ^{

    id<CPSearchable> object = @{@"A": @{@"A": @1},
                                @"B": @2,
                                @"C": @[@1, @[@YES], @{@"D": @3}]};
    
    it(@"can fetch paths", ^{
        expect([object valuesForKeyRegexp:@"A$"]).toNot.beNil();
    });
    
    it(@"can fetch exact from NSArray", ^{
        expect([object firstForKeyWildcard:@"C[0]"]).to.equal(@1);
    });

    it(@"can fetch exact from NSDictionary", ^{
        expect([object firstForKeyWildcard:@"C[2].D"]).to.equal(@3);
    });
    
});

describe(@"array", ^{

    id<CPSearchable> object = @[@{@"A": @1},
                                @2,
                                @[@1, @[@YES], @{@"D": @3}]];

    it(@"can fetch paths", ^{
        expect([object valuesForKeyRegexp:@"\\[0\\]$"]).toNot.beNil();
    });
    
    it(@"can fetch exact from NSArray by regexp", ^{
        expect([object firstForKeyRegexp:@"\\[2\\]\\[0\\]$"]).to.equal(@1);
    });
    
    it(@"can fetch exact from NSArray by wildcard", ^{
        expect([object firstForKeyWildcard:@"[2][0]"]).to.equal(@1);
    });

    it(@"can fetch exact from NSDictionary by regexp", ^{
        expect([object firstForKeyRegexp:@"\\[2\\]\\[2\\].D$"]).to.equal(@3);
    });
    
    it(@"can fetch exact from NSDictionary by wildcard", ^{
        expect([object firstForKeyWildcard:@"[2][2].D"]).to.equal(@3);
    });
    
});

SpecEnd

