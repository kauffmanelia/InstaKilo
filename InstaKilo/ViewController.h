//
//  ViewController.h
//  InstaKilo
//
//  Created by Elia Kauffman on 2014-10-23.
//  Copyright (c) 2014 Elia Kauffman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) IBOutlet UICollectionView * collectionView;
@property (nonatomic, strong) NSMutableArray * cellDataArray;
@property (nonatomic, strong) NSArray * subjects;
@property (nonatomic, strong) NSMutableArray * cellArraysBySubject;
@property (nonatomic, strong) NSMutableArray * cellArraysByLocation;
@property (nonatomic, strong) NSMutableArray * arrayOfCellArrays;
@property (nonatomic, assign) unsigned int currentSortIndex;

- (IBAction)setSortBySubject:(id)sender;
- (IBAction)setSortByLocation:(id)sender;

@end

