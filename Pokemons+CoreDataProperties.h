//
//  Pokemons+CoreDataProperties.h
//  Pokedex-by-DantasSoftware
//
//  Created by Fabio Dantas on 25/06/2016.
//  Copyright © 2016 DantasSoftware. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Pokemons.h"

NS_ASSUME_NONNULL_BEGIN

@interface Pokemons (CoreDataProperties)

@property (nullable, nonatomic, retain) NSDate *createdAt;
@property (nullable, nonatomic, retain) NSData *image;
@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSString *id;

@end

NS_ASSUME_NONNULL_END
