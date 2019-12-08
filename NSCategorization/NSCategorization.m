//
//  Categorization.m
//  CategorizationKit
//
//  Created by Johnny Vega on 3/31/19.
//  Copyright © 2019 Johnny Vega. All rights reserved.
//

#import "NSCategorization.h"

@implementation NSCategorization

-(void)setItems:(NSArray *)items andCategories:(nonnull NSCategories *)categories {
    _items = items;
    _categories = categories;
    for(NSCategory *category in _categories.categoryList) {
        [category setItemsCount:[[_items filteredArrayUsingPredicate:category.predicate] count]];
        category.delegate = self;
    }
}

-(instancetype)init {
    self = [super init];
    if(self) {
        self.categories = [[NSCategories alloc] init];
        self.items = [NSArray array];
        self.searchPredicate = [NSPredicate predicateWithValue:YES];
    }
    return self;
}


+(NSCategorization*)shared {
    static NSCategorization *_inst = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _inst = [[NSCategorization alloc] init];
    });
    return _inst;
}

-(void)setCategories:(NSCategories *)categories {
    _categories = categories;
    for(NSCategory *category in _categories.categoryList) {
        [category setItemsCount:[[_items filteredArrayUsingPredicate:category.predicate] count]];
        category.delegate = self;
    }
}

@synthesize items = _items;

-(NSArray*)items {
    return _items;
}

-(void)setItems:(NSArray *)items {
    _items = items;
    for(NSCategory *category in _categories.categoryList)
        [category setItemsCount:[[_items filteredArrayUsingPredicate:category.predicate] count]];
}


-(NSInteger)countforCategoryWithTitle:(NSString *)title{
    return [_categories countForCategoryWithTitle:title];
}


-(NSMutableArray*)itemsInCategoryWithTitle:(NSString *)title {
    NSPredicate *predicate = [_categories predicateForCategoryWithTitle:title];
    if(predicate) {
        NSPredicate *searchPredicate = [NSCompoundPredicate  andPredicateWithSubpredicates:@[predicate,_searchPredicate]];

        return [NSMutableArray arrayWithArray:[self.items filteredArrayUsingPredicate:searchPredicate]];
    }
    return [NSMutableArray arrayWithArray:[self.items filteredArrayUsingPredicate:_searchPredicate]];
}

-(BOOL)isVisibleCategoryWithTitle:(NSString *)title {
    return [_categories isVisibleCategoryWithTitle:title];
}


#pragma mark - CategoryDelegate

- (NSInteger)countForCategory:(NSString *)category {
    NSPredicate *predicate = [_categories predicateForCategoryWithTitle:category];
    if(predicate) {
        NSPredicate *searchPredicate = [NSCompoundPredicate  andPredicateWithSubpredicates:@[predicate,_searchPredicate]];
        return [[self.items filteredArrayUsingPredicate:searchPredicate] count];
    }
    return [[self.items filteredArrayUsingPredicate:_searchPredicate] count];;
}

- (NSMutableArray*)itemsForCategory:(NSString *)category {
    return [self itemsInCategoryWithTitle:category];
}

@end
