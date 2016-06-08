//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

-(NSString *)removeSpacesAndMakeLowercase:(NSString *)string {
    //remove spaces and makes lowercase strings
    string = [string lowercaseString];
    string = [string stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    return string;
}



-(BOOL)characterInStateAndCapitalMatch:(NSString *)stateName capital:(NSString *)capitalName {
    
    for (NSUInteger j = 0; j < [stateName length]; j++) {
        NSString *stateCharacter = [NSString stringWithFormat:@"%c",[stateName characterAtIndex:j]];
        
        //NSLog(@"%@", stateCharacter);
        
        for (NSUInteger n = 0; n <[capitalName length]; n++) {
            NSString *capitalCharacter = [NSString stringWithFormat:@"%c", [capitalName characterAtIndex:n]];
            if ([capitalCharacter isEqualToString:stateCharacter]) {
                return NO;
            }
            //NSLog(@"%@", capitalCharacter);
        }
    }
    
    return YES;
}

-(NSString *)solveTrivia {
    
    NSDictionary *stateAndCapitalDict = @{
                                          @"Alabama": @"Montgomery",
                                          @"Alaska": @"Juneau",
                                          @"Arizona": @"Phoenix",
                                          @"Arkansas": @"Little Rock",
                                          @"California": @"Sacramento",
                                          @"Colorado": @"Denver",
                                          @"Connecticut": @"Hartford",
                                          @"Delaware": @"Dover",
                                          @"Florida": @"Tallahassee",
                                          @"Georgia": @"Atlanta",
                                          @"Hawaii": @"Honolulu",
                                          @"Idaho": @"Boise",
                                          @"Illinois": @"Springfield",
                                          @"Indiana": @"Indianapolis",
                                          @"Iowa": @"Des Moines",
                                          @"Kansas": @"Topeka",
                                          @"Kentucky": @"Frankfort",
                                          @"Louisiana": @"Baton Rouge",
                                          @"Maine": @"Augusta",
                                          @"Maryland": @"Annapolis",
                                          @"Massachusetts": @"Boston",
                                          @"Michigan": @"Lansing",
                                          @"Minnesota": @"Saint Paul",
                                          @"Mississippi": @"Jackson",
                                          @"Missouri": @"Jefferson City",
                                          @"Montana": @"Helana",
                                          @"Nebraska": @"Lincoln",
                                          @"Nevada": @"Carson City",
                                          @"New Hampshire": @"Concord",
                                          @"New Jersey": @"Trenton",
                                          @"New Mexico": @"Santa Fe",
                                          @"New York": @"Albany",
                                          @"North Carolina": @"Raleigh",
                                          @"North Dakota": @"Bismarck",
                                          @"Ohio": @"Columbus",
                                          @"Oklahoma": @"Oklahoma City",
                                          @"Oregon": @"Salem",
                                          @"Pennsylvania": @"Harrisburg",
                                          @"Rhode Island": @"Providence",
                                          @"South Carolina": @"Columbia",
                                          @"South Dakota": @"Pierre",
                                          @"Tennessee": @"Nashville",
                                          @"Texas": @"Austin",
                                          @"Utah": @"Salt Lake City",
                                          @"Vermont": @"Montpelier",
                                          @"Virginia": @"Richmond",
                                          @"Washington": @"Olympia",
                                          @"West Virginia": @"Charleston",
                                          @"Wisconsin": @"Madison",
                                          @"Wyoming": @"Cheyenne"
                                          };
    
    NSArray *allStates = [stateAndCapitalDict allKeys];
    
    for (NSUInteger i = 0; i < [allStates count]; i++) {
        NSString *stateAndCapitalDictKey = allStates[i];
        NSString *stateAndCapitalDictValueBasedOnKey = stateAndCapitalDict[stateAndCapitalDictKey];
        
        NSString *stateName = [NSString stringWithFormat:@"%@" ,[self removeSpacesAndMakeLowercase:stateAndCapitalDictKey]];
        NSString *capitalName = [NSString stringWithFormat:@"%@", [self removeSpacesAndMakeLowercase:stateAndCapitalDictValueBasedOnKey]];
        
        if ([self characterInStateAndCapitalMatch:stateName capital:capitalName] == YES) {
            return stateAndCapitalDictKey;
        }
        
    }
    
    
    
    return nil;
}

@end
