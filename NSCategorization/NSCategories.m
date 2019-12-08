//
//  Categories.h
//  CategorizationKit
//
//  Created by Alexey Chechetkin on 12.07.15.
//  Copyright (c) 2015 Alexey Chechetkin. All rights reserved.
//

#import "NSCategories.h"

@implementation NSCategories

-(instancetype)init {
    self = [super init];
    if(self) {
        self.categoryList = [NSArray array];
        return self;
    }
    return nil;
}

+(NSCategories*)categoriesWithCategoryArray:(NSArray<NSCategory *> *)categories {
    return [[NSCategories alloc] initWithCategories:categories];
    
}


- (instancetype)initWithCategories:(NSArray<NSCategory *> *)categories {
    self = [super init];
    self.categoryList = categories;
    return self;
}


- (NSCategory *)categoryAtIndex:(int)index
{
    return [_categoryList objectAtIndex:index];
}


- (NSCategory*)categoryWithTitle:(NSString *)title {
    for(NSCategory *category in _categoryList) {
        if([category.title isEqualToString:title])
            return category;
    }
    return nil;
}

- (NSInteger)sortIndexForCategoryWithTitle:(NSString *)title {
    for(NSCategory *category in _categoryList) {
        if([category.title isEqualToString:title])
            return category.sortIndex;
    }
    return 0;
}


-(NSPredicate*)predicateForCategoryWithTitle:(NSString *)title{
    for(NSCategory *category in _categoryList) {
        if([category.title isEqualToString:title])
            return category.predicate;
    }
    return nil;
}

-(BOOL)isVisibleCategoryWithTitle:(NSString *)title {
    for(NSCategory *category in _categoryList) {
        if([category.title isEqualToString:title])
            return category.isVisible;
    }
    return NO;
}


-(void)setCountForLCategoriesUsingItems:(NSArray *)items {
    for(NSCategory *category in _categoryList) {
        [category setItemsCount:[[items filteredArrayUsingPredicate:category.predicate] count]];
    }
}


-(NSInteger)countForCategoryWithTitle:(NSString *)title {
    for(NSCategory *category in _categoryList) {
        if([category.title isEqualToString:title])
            return category.itemsCount;
    }
    return -1;
}

@end
