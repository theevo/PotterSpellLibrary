//
//  TTVSpell.h
//  HarryPotterSpellLibrary
//
//  Created by theevo on 3/26/20.
//  Copyright © 2020 Theo Vora. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TTVSpell : NSObject

@property (nonatomic, copy, readonly) NSString * spell;
@property (nonatomic, copy, readonly, nullable) NSString * type;
@property (nonatomic, copy, readonly, nullable) NSString * effect;

-(instancetype)initWithSpell:(NSString *)spell
                       state:(NSString *)type
                     country:(NSString *)effect;

@end


@interface TTVSpell (JSONConvertable)

- (instancetype) initWithDictionary: (NSDictionary<NSString *, id> *)dictionary;

@end

NS_ASSUME_NONNULL_END
