//
//  Categorization.h
//  CategorizationKit
//
//  Created by Johnny Vega on 3/31/19.
//  Copyright © 2019 Johnny Vega. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Categories.h"

NS_ASSUME_NONNULL_BEGIN

/*!
 @class Categorization
 Categorization Class offer a simple way to categorize/group array items. An categorization object is mainly composed for a NSArray object with the items to categorize and a GroupLabel object with an array of Labels to use during the categorization process.
 */
@interface Categorization : NSObject <CategoryDelegate>


/*!
 @property items
 Array of items to categorize
 */
@property (strong,nonatomic) NSArray* items;


/*!
 @property categories
    Categories object with the array of Category objects to use in the items categorization.  Each category will provide the NSPredicate object to determine the items include in one particular category.
 */
@property (strong,nonatomic) Categories* categories;


/*!
 @property searchPredicate
    Predicate with additional end user criteria to restrict Items displayed in a GUI. Usually expressed as a SearchTextField.
 */
@property (strong,nonatomic) NSPredicate *searchPredicate;


/*!
 Convenient singleton to maintain a Categorization
 */
+ (Categorization*)shared;


/*!
 * Simple method to assign items and GroupLabel
 @param items Items to categorize
 @param categories Categories object with the List of categories.
 */
- (void)setItems:(NSArray*)items andCategories:(Categories*)categories;


/*!
Method to determine the number of items that satisfy the criteria of one particular Category.
 @param title Category title
 */
- (NSInteger)countforCategoryWithTitle:(NSString*)title;


/*!
 Simple method to determine is a particular Category should be displayed in a GUI.  A Category is established as visible if the alwaysVisible property is YES or the number of items that satisfy the Category criteria is greater than zero.
 @param title Category title
 @return YES if the category is always visible or the number of items in the category is greater than zero.  Otherwise NO.
 */
- (BOOL)isVisibleCategoryWithTitle:(NSString*)title;


/*
 Items that satisfy a Category criteria.  Category criteria is defined using a NSPredicate object.
 @param title Category title
 @return A new array object with items that satisfy the Category criteria.
 */
-(NSMutableArray*)itemsInCategoryWithTitle:(NSString*)title;


/*!
 Initializer
 */
-(instancetype)init;

@end

NS_ASSUME_NONNULL_END
