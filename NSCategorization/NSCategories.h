//
//  Categories.h
//  CategorizationKit
//
//  Holds the list of Group Labels to cateogorize array items.

#import <Foundation/Foundation.h>
#import "NSCategory.h"



/*!
 @class Categories. Holds the list of Categories.
 */
@interface NSCategories : NSObject

/*!
 Convenience init method.
 @param categories  An array of Category objects.
 */
+ (NSCategories*)categoriesWithCategoryArray:(NSArray<NSCategory*>*)categories;


/*!
 init method.
 @param categories  Array of Category obkects
 @return A new Categories object containing a list of categories.
 */
- (instancetype)initWithCategories:(NSArray<NSCategory*>*)categories;


/*!
 @property categoryList. Number of actual visible Categories
 */
@property(strong,nonatomic) NSArray<NSCategory*>* categoryList;


/*!
 Return the Category in a particular index in the Array
 @param index Index of the Label to return
 @return The Category correponding to index, nil if there is not label.
 */
- (NSCategory*)categoryAtIndex:(int)index;


/*!
 Return the Category with a particular title
 @param title title of the Label to return
 @return The Category with the correponding title, nil if there is none.
 */
-(NSCategory*)categoryWithTitle:(NSString*)title;


/*!
 Return sortIndex for Category with a particular title
 @param title title of the Category to return
 @return The sortIndex for the Category with the correponding title, nil if there is none.
 */
-(NSInteger)sortIndexForCategoryWithTitle:(NSString*)title;


/*!
 Determine if a particular Category is visible
 @param title title of Category
 @return YES if Category is Visible, NO otherwise.
 */
-(BOOL)isVisibleCategoryWithTitle:(NSString*)title;


/*!
 Filter predicate for a particular Category
 @param title Category title
 @return An NSPredicate object with the Category filter criteria, or nil if Category does not exists.
 */
-(NSPredicate*)predicateForCategoryWithTitle:(NSString*)title;


/*!
 @property NSPredicate to determine what Categories in the List will be displayed in a GUI.
 */
@property (nonatomic) NSPredicate* visibleCategoriesPredicate;

/*!
 Initializer
 */
-(instancetype)init;


/*!
 This method can assign the number of Items for each Category in the List, using the items passed as parameter.
 @param items
    Collection of items to use during the Category items count determination
 */
-(void)setCountForLCategoriesUsingItems:(NSArray*)items;


/*!
 This method can be used to return the number of items for a particular Category
 @param title
    Title of Category to return number of items.
 @return The number of items for the respective Category.
 */
-(NSInteger)countForCategoryWithTitle:(NSString*)title;

@end
