//
//  Categorization.m
//  CategorizationKit
//
//  Created by Johnny Vega on 3/31/19.
//  Copyright © 2019 Johnny Vega. All rights reserved.
//

#import "Categorization.h"

@implementation Categorization

-(void)setItems:(NSArray *)items andLabels:(GroupLabel *)labels {
    _items = items;
    _groupLabel = labels;
    for(Label *label in _groupLabel.labels) {
        [label setItemsCount:[[_items filteredArrayUsingPredicate:label.predicate] count]];
        label.delegate = self;
    }
}

-(instancetype)init {
    self = [super init];
    if(self) {
        self.groupLabel = [[GroupLabel alloc] init];
        self.items = [NSArray array];
        self.searchPredicate = [NSPredicate predicateWithValue:YES];
    }
    return self;
}


+(Categorization*)shared {
    static Categorization *_inst = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _inst = [[Categorization alloc] init];
    });
    return _inst;
}

-(void)setGroupLabel:(GroupLabel *)groupLabel {
    _groupLabel = groupLabel;
    for(Label *label in _groupLabel.labels) {
        [label setItemsCount:[[_items filteredArrayUsingPredicate:label.predicate] count]];
        label.delegate = self;
    }
}

@synthesize items = _items;

-(NSArray*)items {
    return _items;
}

-(void)setItems:(NSArray *)items {
    _items = items;
    for(Label *label in _groupLabel.labels)
        [label setItemsCount:[[_items filteredArrayUsingPredicate:label.predicate] count]];
}


-(NSInteger)countforLabelWithTitle:(NSString *)label {
    return [_groupLabel itemCountForLabelWithTitle:label];
}


-(NSMutableArray*)itemsInLabel:(NSString *)label {
    NSPredicate *predicate = [_groupLabel predicateForLabelWithTitle:label];
    if(predicate) {
        NSPredicate *searchPredicate = [NSCompoundPredicate  andPredicateWithSubpredicates:@[predicate,_searchPredicate]];

        return [NSMutableArray arrayWithArray:[self.items filteredArrayUsingPredicate:searchPredicate]];
    }
    return [NSMutableArray arrayWithArray:[self.items filteredArrayUsingPredicate:_searchPredicate]];
}

-(BOOL)isVisibleLabelWithTitle:(NSString *)label {
    return [_groupLabel isVisibleLabelWithTitle:label];
}


#pragma mark - GroupLabelDelegate

- (NSInteger)countForLabel:(NSString *)label {
    NSPredicate *predicate = [_groupLabel predicateForLabelWithTitle:label];
    if(predicate) {
        NSPredicate *searchPredicate = [NSCompoundPredicate  andPredicateWithSubpredicates:@[predicate,_searchPredicate]];
        return [[self.items filteredArrayUsingPredicate:searchPredicate] count];
    }
    return [[self.items filteredArrayUsingPredicate:_searchPredicate] count];;
}

- (NSMutableArray*)itemsForLabel:(NSString *)label {
    return [self itemsInLabel:label];
}

@end

