//
//  CellData.m
//  InstaKilo
//
//  Created by Elia Kauffman on 2014-10-23.
//  Copyright (c) 2014 Elia Kauffman. All rights reserved.
//

#import "CellData.h"

@implementation CellData

- (void)setPhotoLocation:(NSString *)location {
    _PhotoLocation = location;
}

- (NSString *)photoLocation {
    return _PhotoLocation;
}

@end
