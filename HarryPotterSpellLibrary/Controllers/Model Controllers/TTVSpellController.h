//
//  TTVSpellController.h
//  HarryPotterSpellLibrary
//
//  Created by theevo on 3/26/20.
//  Copyright © 2020 Theo Vora. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class TTVSpell;

@interface TTVSpellController : NSObject

+(void) fetchAllSpells:(void(^)(NSArray<TTVSpell *> *_Nullable))completion;

@end

NS_ASSUME_NONNULL_END
