//
//  InstaKiloCollectionViewCell.h
//  InstaKilo
//
//  Created by Elia Kauffman on 2014-10-23.
//  Copyright (c) 2014 Elia Kauffman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InstaKiloCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (nonatomic, strong) NSString * subject;
@property (nonatomic, strong) NSString * PhotoLocation;

@end
