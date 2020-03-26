//
//  TTVSpellController.m
//  HarryPotterSpellLibrary
//
//  Created by theevo on 3/26/20.
//  Copyright © 2020 Theo Vora. All rights reserved.
//

#import "TTVSpellController.h"
#import "TTVSpell.h"

static NSString * const baseURLstring = @"https://www.potterapi.com/v1/";
static NSString * const spellsComponent = @"spells";
static NSString * const apiKeyAirvisual = @"key";
static NSString * const apiKeyValueAirvisual = @"$2a$10$JVY9jkkJWC9kxs1DqcfWIe97sTOkcIgDz1WGCL0YQiBKdFmjDnZFG";

@implementation TTVSpellController

+(void) fetchAllSpells:(void(^)(NSArray<TTVSpell *> *_Nullable))completion
{
    NSURL *baseURL = [NSURL URLWithString:baseURLstring];
    
    NSURL *spellsURL = [baseURL URLByAppendingPathComponent:spellsComponent];
    
    NSURLQueryItem *apiQueryItem = [[NSURLQueryItem alloc] initWithName:apiKeyAirvisual value:apiKeyValueAirvisual];
    
    NSMutableArray<NSURLQueryItem *> *queryItems = [NSMutableArray new];
    [queryItems addObject:apiQueryItem];
    
    NSURLComponents *urlComponents = [[NSURLComponents alloc] initWithURL:spellsURL resolvingAgainstBaseURL:true];
        
    [urlComponents setQueryItems:queryItems];
    
    NSURL *finalURL = [urlComponents URL];
    
    NSLog(@"%@", finalURL);
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error)
        {
            NSLog(@"Error fetching posts: %@", error);
            completion(nil);
            return;
        }
        
        if (!data)
        {
            NSLog(@"Error. No data was returned: %@", error);
            completion(nil);
            return;
        }
        
        NSArray *arrayOfDictionaries = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error: &error];
        
        NSMutableArray *spellsArray = [NSMutableArray new];
        
        for (NSDictionary *currentDictionary in arrayOfDictionaries)
        {
            TTVSpell *spell = [[TTVSpell alloc] initWithDictionary:currentDictionary];
            [spellsArray addObject:spell];
        }
        
        completion(spellsArray);
        
    }] resume];
}

@end
