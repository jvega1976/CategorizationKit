//
//  Category.h
//  CategorizationKit
//
//  Created by Alexey Chechetkin on 12.07.15.
//  Copyright (c) 2015 Alexey Chechetkin. All rights reserved.
//

#import <Foundation/Foundation.h>

/*!
@protocol CategoryDelegate
*/
@protocol CategoryDelegate <NSObject>

/*!
 Method to establish the number of items that satisfy the Category predicate.
 */
-(NSInteger)countForCategory:(NSString*)category;


/*!
 Method to establish items beloging to the respective Category.
 */
-(NSMutableArray*)itemsForCategory:(NSString*)category;


/*!
 Method to determine the NSPredicate with the Category criteria.
 */
-(NSPredicate*)searchPredicate;

@end

/*!
 @class Category
 Categories represent a categorization/grouping of Elements.  Category allow to present the items categorized information based in defined filter criterias.  Example of Categories in the Torrent world could be Active, Downloading, Tracker, etc.
 */

@interface Category : NSObject

/*! Convinience init method
 @param title Identifying Category title
 @param predicate  Predicate with group filter label criteria
 @param sortIndex Optional group label sort index
 @param visible  Boolean to establish if label will be always visible in the user interface even if there are not items that satisfy the label group criteria.
 */

+(Category*)categoryWithTitle:(NSString*)title predicate:(NSPredicate*)predicate andSortIndex:(NSInteger)sortIndex  isAlwaysVisible:(BOOL)visible;


/*!
 @property title Title to identify Category. Example: "All", "Downloading", "Seeding", "Stopped", etc.
 */
@property(strong,nonatomic) NSString       *title;


/*!
 @property predicate Preedicate with the corresponding Category filter criteria
 */
@property(strong,nonatomic) NSPredicate*   predicate;


/*!
 @property delagate delegate for CategoryDelegate protocol.
 */
@property(weak,nonatomic) id<CategoryDelegate> delegate;


/*!
 @property alwaysVisible  This property determine if the Category will be visible in the final user interface, even if there is not items that satisfy the corresponding Group filter criteria.
 */
@property(nonatomic) BOOL           alwaysVisible;


/*!
 @property isVisible
 */
@property (nonatomic,readonly) BOOL isVisible;


/*!
 @property index Categorys can have an index number to help the arragement of multiple Categoriess
 */
@property(nonatomic)   NSInteger   sortIndex;


/*!
 @property Array of items that satisfy the Category filter criteria.
 Warning: This property require the implementation of the method itemsForCategory for the CategoryDelegate protocol, if the Category class is used outside the Catetorization Framework scope.
 */
@property(nonatomic,readonly) NSMutableArray* items;


/*!
 @property itemsCount Number of items that satisfy the Category filter criteria.
 Warning: This property can be assigned or returned using the instance variable or implementing the method countForCategory of the CategoryDelegate protocol. The getter method will first verify if the property instance variable have a value different from zero (the initial value), if not, it will verify if there is a delegate that have implemented the countForCategory method.
 */
@property(nonatomic) NSInteger itemsCount;


/*!
 initializer
 */
-(instancetype)init;

@end
