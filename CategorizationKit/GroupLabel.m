//
//  GroupLabel.m
//  CategorizationKit
//
//  Created by Alexey Chechetkin on 12.07.15.
//  Copyright (c) 2015 Alexey Chechetkin. All rights reserved.
//

#import "GroupLabel.h"

@interface GroupLabel()

@end

@implementation GroupLabel

-(instancetype)init {
    self = [super init];
    if(self) {
        self.labels = [NSArray array];
        return self;
    }
    return nil;
}

+(GroupLabel*)groupwithLabels:(NSArray<Label*>*)labels {
    return [[GroupLabel alloc] initWithLabels:labels];
    
}


- (instancetype)initWithLabels:(NSArray<Label *> *)labels {
    self = [super init];
    self.labels = labels;
    return self;
}


- (Label *)labelAtIndex:(int)index
{
    return [_labels objectAtIndex:index];
}


- (Label*)labelWithTitle:(NSString *)label {
    for(Label *_label in _labels) {
        if([_label.title isEqualToString:label])
            return _label;
    }
    return nil;
}

- (NSInteger)sortIndexForLabelWithTitle:(NSString *)label {
    for(Label *_label in _labels) {
        if([_label.title isEqualToString:label])
            return _label.sortIndex;
    }
    return 0;
}


-(NSPredicate*)predicateForLabelWithTitle:(NSString*)label {
    for(Label *_label in _labels) {
        if([_label.title isEqualToString:label])
            return _label.predicate;
    }
    return nil;
}

-(BOOL)isVisibleLabelWithTitle:(NSString*)label {
    for(Label *_label in _labels) {
        if([_label.title isEqualToString:label])
            return _label.isVisible;
    }
    return NO;
}


-(void)setCountForLabelsUsingItems:(NSArray *)items {
    for(Label *label in _labels) {
        [label setItemsCount:[[items filteredArrayUsingPredicate:label.predicate] count]];
    }
}


-(NSInteger)itemCountForLabelWithTitle:(NSString *)label {
    for(Label *_label in _labels) {
        if([_label.title isEqualToString:label])
            return _label.itemsCount;
    }
    return -1;
}

@end
