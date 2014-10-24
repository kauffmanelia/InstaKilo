//
//  ViewController.m
//  InstaKilo
//
//  Created by Elia Kauffman on 2014-10-23.
//  Copyright (c) 2014 Elia Kauffman. All rights reserved.
//

#import "ViewController.h"
#import "InstaKiloCollectionViewCell.h"
#import "CellData.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.cellDataArray = [[NSMutableArray alloc] init];
    // Do any additional setup after loading the view, typically from a nib.
    NSArray * imageArray = @[[UIImage imageNamed:@"aurora-glacier-woodend"], [UIImage imageNamed:@"helix-nebula-fitz-henry"], [UIImage imageNamed:@"horsehead-nebula-dholakia-2"], [UIImage imageNamed:@"horsehead-nebula-snyder"], [UIImage imageNamed:@"hybrid-solar-eclipse-kamenew"], [UIImage imageNamed:@"lost-souls-fletcher"], [UIImage imageNamed:@"wind-farm-star-trails-james"]];
    NSArray * subjectsArray = @[@"Aurora", @"Nebula", @"Nebula", @"Nebula", @"Eclipse", @"Stars", @"Stars"];
    NSArray * locationsArray = @[@"outside", @"space", @"space", @"space", @"outside", @"outside", @"outside"];
    
    for(int i=0;i<imageArray.count;i++){
        CellData * newCell = [[CellData alloc] init];
        newCell.image = imageArray[i];
        newCell.subject = subjectsArray[i];
        newCell.PhotoLocation = locationsArray[i];
        [self.cellDataArray addObject:newCell];
    }
    self.subjects = [[NSOrderedSet orderedSetWithArray:subjectsArray] array];
//    self.collectionView.numberOfSections = uniqueArray.count;
    
    self.cellArraysBySubject = [[NSMutableArray alloc] init];
    for(CellData * currentData in self.cellDataArray){
        if([self subjectArrayContains:currentData.subject]){
            int arrayIndex = [self indexOfArrayForSubject:currentData.subject];
            NSMutableArray * subjectArray = self.cellArraysBySubject[arrayIndex];
            [subjectArray addObject:currentData];
        } else {
            NSMutableArray * newArray = [@[currentData] mutableCopy];
            [self.cellArraysBySubject addObject:newArray];
        }
    }
    
    self.cellArraysByLocation = [[NSMutableArray alloc] init];
    for(CellData * currentData in self.cellDataArray){
        if([self subjectArrayContainsLocation:currentData.PhotoLocation]){
            int arrayIndex = [self indexOfArrayForLocation:currentData.PhotoLocation];
            NSMutableArray * locationArray = self.cellArraysByLocation[arrayIndex];
            [locationArray addObject:currentData];
        } else {
            NSMutableArray * newArray = [@[currentData] mutableCopy];
            [self.cellArraysByLocation addObject:newArray];
        }
    }
    
}

- (BOOL)subjectArrayContains:(NSString *) subject {
    for(NSArray * currentArray in self.cellArraysBySubject){
        if([[currentArray[0] subject] isEqualToString:subject]){
            return YES;
        }
    }
    return NO;
}

- (BOOL)subjectArrayContainsLocation:(NSString *) location {
    for(NSArray * currentArray in self.cellArraysByLocation){
        if([[currentArray[0] PhotoLocation] isEqualToString:location]){
            return YES;
        }
    }
    return NO;
}

- (int)indexOfArrayForSubject:(NSString *)subject {
    for(int i=0;i<self.cellArraysBySubject.count;i++){
        NSArray * currentArray = self.cellArraysBySubject[i];
        if([[currentArray[0] subject] isEqualToString:subject]){
            return i;
        }
    }
    return -1;
}

- (int)indexOfArrayForLocation:(NSString *)location {
    for(int i=0;i<self.cellArraysByLocation.count;i++){
        NSArray * currentArray = self.cellArraysByLocation[i];
        if([[currentArray[0] PhotoLocation] isEqualToString:location]){
            return i;
        }
    }
    return -1;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    // NEEDS TO BE CHANGED WHEN CHANGING SORTING TYPE
    return self.cellArraysByLocation.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    // NEEDS TO BE CHANGED WHEN CHANGING SORTING TPYE
    return [self.cellArraysByLocation[section] count];
}

- (UICollectionViewCell *)collectionView: (UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    // NEEDS TO BE CHANGED WHEN CHANGING SORTING TYPE
    CellData * cellData = self.cellArraysByLocation[indexPath.section][indexPath.row];
    
    InstaKiloCollectionViewCell *cell = (InstaKiloCollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:@"InstaKiloCell" forIndexPath:indexPath];
    
    cell.subject = cellData.subject;
    cell.image.image = cellData.image;
    cell.PhotoLocation = cellData.PhotoLocation;
    return cell;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return UIInterfaceOrientationIsLandscape(toInterfaceOrientation);
}

- (BOOL)shouldAutorotate {
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskLandscape;
}


- (IBAction)setSortBySubject:(id)sender {
}

- (IBAction)setSortByLocation:(id)sender {
}
@end
