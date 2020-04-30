#import "Converter.h"

// Do not change
NSString *KeyPhoneNumber = @"phoneNumber";
NSString *KeyCountry = @"country";

@implementation PNConverter
- (NSDictionary*)converToPhoneNumberNextString:(NSString*)string; {
    NSMutableString *resultNumber = [[NSMutableString alloc] init];
    NSArray *lenghtToFormat = @[
        @[@8, @2],
        @[@9, @2],
        @[@10, @3]
    ];
    NSMutableArray *codeOfPhoneNumber = [@[
        [@[@10, @"7", @"RU"] mutableCopy],
        [@[@10, @"7", @"KZ"] mutableCopy],
        [@[@8, @"373", @"MD"] mutableCopy],
        [@[@8, @"374", @"AM"] mutableCopy],
        [@[@9, @"375", @"BY"] mutableCopy],
        [@[@9, @"380", @"UA"] mutableCopy],
        [@[@9, @"992", @"TJ"] mutableCopy],
        [@[@8, @"993", @"TM"] mutableCopy],
        [@[@9, @"994", @"AZ"] mutableCopy],
        [@[@9, @"996", @"KG"] mutableCopy],
        [@[@9, @"998", @"UZ"] mutableCopy],
    ] mutableCopy];
    int placeOfCode = -1;
    for (int counterRow = 0; counterRow < 11; counterRow++) {
        int counterOfMatch = 0;
        for (int counterOfStringLenght = 0; counterOfStringLenght < [codeOfPhoneNumber[ counterRow][1] length]; counterOfStringLenght++) {
            if ([string length] >= [codeOfPhoneNumber[counterRow][1] length]) {
                if ([string characterAtIndex:counterOfStringLenght] == [codeOfPhoneNumber[counterRow][1] characterAtIndex:counterOfStringLenght]) {
                    counterOfMatch++;
                }
        }
    }
    if (counterOfMatch == [codeOfPhoneNumber[counterRow][1] length]) {
        placeOfCode = counterRow;
        if (counterOfMatch == 1 && [string length] >= 2) {
            if ([string characterAtIndex:1] == '7')
                placeOfCode = 1;
        }
        break;
    }
}

if (placeOfCode != -1) {
    int lenghtOfPhoneNumber = (int)([string length] - [codeOfPhoneNumber[placeOfCode][1] length]);
    [resultNumber appendFormat:@"+%@", codeOfPhoneNumber[placeOfCode][1]];
    
    if (lenghtOfPhoneNumber > 0)
        [resultNumber appendString:@" ("];
    
    if ([codeOfPhoneNumber[placeOfCode][0] intValue] <= 9) {
        for (int counter = 2; counter > 0; counter--) {
            if (lenghtOfPhoneNumber > 0) {
                [resultNumber appendString:[string substringWithRange:NSMakeRange([string length] - lenghtOfPhoneNumber, 1)]];
                lenghtOfPhoneNumber -= 1;
                [[codeOfPhoneNumber objectAtIndex:placeOfCode] setObject:[NSNumber numberWithInt:[[[codeOfPhoneNumber objectAtIndex:placeOfCode] objectAtIndex:0] intValue] - 1] atIndex:0];
            }
            else if (lenghtOfPhoneNumber == 0)
                return @{KeyPhoneNumber: resultNumber,
                         KeyCountry: codeOfPhoneNumber[placeOfCode][2]};
        }
        if (lenghtOfPhoneNumber > 0)
            [resultNumber appendString:@") "];
    }
    if ([codeOfPhoneNumber[placeOfCode][0] intValue] >= 10) {
        for (int counter = 3; counter > 0; counter--) {
            if (lenghtOfPhoneNumber > 0) {
                [resultNumber appendString:[string substringWithRange:NSMakeRange([string length] - lenghtOfPhoneNumber, 1)]];
                lenghtOfPhoneNumber -= 1;
                [[codeOfPhoneNumber objectAtIndex:placeOfCode] setObject:[NSNumber numberWithInt:[[[codeOfPhoneNumber objectAtIndex:placeOfCode] objectAtIndex:0] intValue] - 1] atIndex:0];
            }
            else if (lenghtOfPhoneNumber == 0)
                return @{KeyPhoneNumber: resultNumber,
                         KeyCountry: codeOfPhoneNumber[placeOfCode][2]};
        }
        if (lenghtOfPhoneNumber > 0)
            [resultNumber appendString:@") "];
    }
    
    for (int counter = 3; counter > 0; counter--) {
        if (lenghtOfPhoneNumber > 0 && [codeOfPhoneNumber[placeOfCode][0] intValue] > 0) {
            [resultNumber appendString:[string substringWithRange:NSMakeRange([string length] - lenghtOfPhoneNumber, 1)]];
            lenghtOfPhoneNumber -= 1;
            [[codeOfPhoneNumber objectAtIndex:placeOfCode] setObject:[NSNumber numberWithInt:[[[codeOfPhoneNumber objectAtIndex:placeOfCode] objectAtIndex:0] intValue] - 1] atIndex:0];
        }
        else if (lenghtOfPhoneNumber == 0)
            return @{KeyPhoneNumber: resultNumber,
                     KeyCountry: codeOfPhoneNumber[placeOfCode][2]};
    }
    if (lenghtOfPhoneNumber > 0 && [codeOfPhoneNumber[placeOfCode][0] intValue] > 0)
        [resultNumber appendString:@"-"];
    
    if ([codeOfPhoneNumber[placeOfCode][0] intValue] == 3) {
        for (int counter = 3; counter > 0; counter--) {
            if (lenghtOfPhoneNumber > 0 && [codeOfPhoneNumber[placeOfCode][0] intValue] > 0) {
                [resultNumber appendString:[string substringWithRange:NSMakeRange([string length] - lenghtOfPhoneNumber, 1)]];
                lenghtOfPhoneNumber -= 1;
                [[codeOfPhoneNumber objectAtIndex:placeOfCode] setObject:[NSNumber numberWithInt:[[[codeOfPhoneNumber objectAtIndex:placeOfCode] objectAtIndex:0] intValue] - 1] atIndex:0];
            }
            else if (lenghtOfPhoneNumber == 0)
                return @{KeyPhoneNumber: resultNumber,
                         KeyCountry: codeOfPhoneNumber[placeOfCode][2]};
        }
    }
    
    for (int counter = 2; counter > 0; counter--) {
        if (lenghtOfPhoneNumber > 0 && [codeOfPhoneNumber[placeOfCode][0] intValue] > 0) {
            [resultNumber appendString:[string substringWithRange:NSMakeRange([string length] - lenghtOfPhoneNumber, 1)]];
            lenghtOfPhoneNumber -= 1;
            [[codeOfPhoneNumber objectAtIndex:placeOfCode] setObject:[NSNumber numberWithInt:[[[codeOfPhoneNumber objectAtIndex:placeOfCode] objectAtIndex:0] intValue] - 1] atIndex:0];
        }
        else if (lenghtOfPhoneNumber == 0)
            return @{KeyPhoneNumber: resultNumber,
                     KeyCountry: codeOfPhoneNumber[placeOfCode][2]};
    }
    if (lenghtOfPhoneNumber > 0 && [codeOfPhoneNumber[placeOfCode][0] intValue] > 0)
        [resultNumber appendString:@"-"];
    
    for (int counter = 2; counter > 0; counter--) {
        if (lenghtOfPhoneNumber > 0 && [codeOfPhoneNumber[placeOfCode][0] intValue] > 0) {
            [resultNumber appendString:[string substringWithRange:NSMakeRange([string length] - lenghtOfPhoneNumber, 1)]];
            lenghtOfPhoneNumber -= 1;
            [[codeOfPhoneNumber objectAtIndex:placeOfCode] setObject:[NSNumber numberWithInt:[[[codeOfPhoneNumber objectAtIndex:placeOfCode] objectAtIndex:0] intValue] - 1] atIndex:0];
        }
        else if (lenghtOfPhoneNumber == 0)
            return @{KeyPhoneNumber: resultNumber,
                     KeyCountry: codeOfPhoneNumber[placeOfCode][2]};
    }
    return @{KeyPhoneNumber: resultNumber,
             KeyCountry: codeOfPhoneNumber[placeOfCode][2]};
}
else {
    [resultNumber appendString:@"+"];
    int lenghtOfPhoneNumber = (int)[string length];
    for (int counter = 0; counter < 12; counter++) {
        if (lenghtOfPhoneNumber > 0) {
            [resultNumber appendString:[string substringWithRange:NSMakeRange(counter, 1)]];
            lenghtOfPhoneNumber--;
        }
        else if (lenghtOfPhoneNumber == 0)
            return @{KeyPhoneNumber: resultNumber,
                     KeyCountry: @""};
    }
    return @{KeyPhoneNumber: resultNumber,
             KeyCountry: @""};
}
}
@end
