//
//  Label.m
//  CategorizationKit
//
//  Created by Alexey Chechetkin on 12.07.15.
//  Copyright (c) 2015 Alexey Chechetkin. All rights reserved.
//

#import "Label.h"



@implementation Label


+(Label*)label:(NSString *)label withPredicate:(NSPredicate *)predicate andSortIndex:(NSInteger)sortIndex isAlwaysVisible:(BOOL)visible
{
    return [[Label alloc] initWithTitle:label predicate:predicate andSortIndex:sortIndex isAlwaysVisible:visible];
}


- (instancetype)initWithTitle:(NSString*)label predicate:(NSPredicate*)predicate andSortIndex:(NSInteger)sortIndex isAlwaysVisible:(BOOL)alwaysVisible
{
    self = [self init];
    
    if( self )
    {
        _title = label;
        _predicate = predicate;
        _sortIndex = sortIndex;
        _alwaysVisible = alwaysVisible;
        _itemsCount = 0;
    }
    
    return self;
}


-(BOOL)isVisible {
    if(_itemsCount>0)
        return YES;
    if(_delegate && [_delegate performSelector:@selector(countForLabel:) withObject:_title])
            return (_alwaysVisible || ([_delegate countForLabel:_title] > 0));
    return _alwaysVisible;
}


-(NSMutableArray*)items {
    if(_delegate && [_delegate performSelector:@selector(itemsForLabel:) withObject:_title])
        return [self.delegate itemsForLabel:_title];
    return nil;
}


-(NSInteger)itemsCount {
    if(_itemsCount)
        return _itemsCount;
    if(_delegate && [_delegate performSelector:@selector(countForLabel:) withObject:_title])
         return [self.delegate countForLabel:_title];
    return 0;
}


+ (NSSet *)keyPathsForValuesAffectingValueForKey:(NSString *)key {
    
    NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
    
    if ([key isEqualToString:@"isVisible"]) {
        NSArray *affectingKeys = @[@"items", @"itemsCount",@"alwaysVisible"];
        keyPaths = [keyPaths setByAddingObjectsFromArray:affectingKeys];
    }
    else if([key isEqualToString:@"itemsCounts"]) {
        NSArray *affectingKeys = @[@"items"];
        keyPaths = [keyPaths setByAddingObjectsFromArray:affectingKeys];
    }
    
    return keyPaths;
}


-(NSPredicate*)predicate {
    NSPredicate *userPredicate;
    if(_delegate && [_delegate performSelector:@selector(searchPredicate)])
        if((userPredicate = [_delegate searchPredicate]))
            return [NSCompoundPredicate andPredicateWithSubpredicates:@[_predicate,userPredicate]];
    return _predicate;
}

-(instancetype)init {
    self = [super init];
    if(self) {
        self.title =  [NSString string];
        self.predicate = [NSPredicate predicateWithValue:YES];
        self.sortIndex = -1;
        self.alwaysVisible = NO;
        self.itemsCount = 0;
        return self;
    }
    return nil;
}

@end
