//
//  TTVSpell.m
//  HarryPotterSpellLibrary
//
//  Created by theevo on 3/26/20.
//  Copyright © 2020 Theo Vora. All rights reserved.
//

#import "TTVSpell.h"

@implementation TTVSpell

-(instancetype)initWithSpell:(NSString *)spell
                        type:(NSString *)type
                      effect:(NSString *)effect
{
    self = [super init];
    if (self) {
        _spell = spell;
        _type = type;
        _effect = effect;
    }
    return self;
}

@end


@implementation TTVSpell (JSONConvertable)

- (instancetype) initWithDictionary: (NSDictionary<NSString *, id> *)dictionary
{
    NSString *spell = dictionary[@"spell"];
    NSString *type = dictionary[@"type"];
    NSString *effect = dictionary[@"effect"];
    
    return [self initWithSpell:spell type:type effect:effect];
}

@end
