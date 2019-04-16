//
//  Categories.h
//  CategorizationKit
//
//  Created by Alexey Chechetkin on 12.07.15.
//  Copyright (c) 2015 Alexey Chechetkin. All rights reserved.
//

#import "Categories.h"

@implementation Categories

-(instancetype)init {
    self = [super init];
    if(self) {
        self.categoryList = [NSArray array];
        return self;
    }
    return nil;
}

+(Categories*)categoriesWithCategoryArray:(NSArray<Category *> *)categories {
    return [[Categories alloc] initWithCategories:categories];
    
}


- (instancetype)initWithCategories:(NSArray<Category *> *)categories {
    self = [super init];
    self.categoryList = categories;
    return self;
}


- (Category *)categoryAtIndex:(int)index
{
    return [_categoryList objectAtIndex:index];
}


- (Category*)categoryWithTitle:(NSString *)title {
    for(Category *category in _categoryList) {
        if([category.title isEqualToString:title])
            return category;
    }
    return nil;
}

- (NSInteger)sortIndexForCategoryWithTitle:(NSString *)title {
    for(Category *category in _categoryList) {
        if([category.title isEqualToString:title])
            return category.sortIndex;
    }
    return 0;
}


-(NSPredicate*)predicateForCategoryWithTitle:(NSString *)title{
    for(Category *category in _categoryList) {
        if([category.title isEqualToString:title])
            return category.predicate;
    }
    return nil;
}

-(BOOL)isVisibleCategoryWithTitle:(NSString *)title {
    for(Category *category in _categoryList) {
        if([category.title isEqualToString:title])
            return category.isVisible;
    }
    return NO;
}


-(void)setCountForLCategoriesUsingItems:(NSArray *)items {
    for(Category *category in _categoryList) {
        [category setItemsCount:[[items filteredArrayUsingPredicate:category.predicate] count]];
    }
}


-(NSInteger)countForCategoryWithTitle:(NSString *)title {
    for(Category *category in _categoryList) {
        if([category.title isEqualToString:title])
            return category.itemsCount;
    }
    return -1;
}

@end
