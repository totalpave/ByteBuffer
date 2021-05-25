//
//  NSData+BYTExtension.m
//  ByteBuffer
//
//  Created by Masaki Ando on 2019/01/06.
//  Copyright (c) 2019 Hituzi Ando. All rights reserved.
//

#import "NSData+BYTExtension.h"

@implementation NSData (BYTExtension)

#pragma mark - Initializer

+ (instancetype)byt_dataWithInteger:(NSInteger)value {
    return [NSData dataWithBytes:&value length:sizeof(value)];
}

+ (instancetype)byt_dataWithUInteger:(NSUInteger)value {
    return [NSData dataWithBytes:&value length:sizeof(value)];
}

+ (instancetype)byt_dataWithShort:(short)value {
    return [NSData dataWithBytes:&value length:sizeof(value)];
}

+ (instancetype)byt_dataWithInt8:(int8_t)value {
    return [NSData dataWithBytes:&value length:sizeof(value)];
}

+ (instancetype)byt_dataWithUInt8:(uint8_t)value {
    return [NSData dataWithBytes:&value length:sizeof(value)];
}

+ (instancetype)byt_dataWithInt16:(int16_t)value {
    return [NSData dataWithBytes:&value length:sizeof(value)];
}

+ (instancetype)byt_dataWithUInt16:(uint16_t)value {
    return [NSData dataWithBytes:&value length:sizeof(value)];
}

+ (instancetype)byt_dataWithInt32:(int32_t)value {
    return [NSData dataWithBytes:&value length:sizeof(value)];
}

+ (instancetype)byt_dataWithUInt32:(uint32_t)value {
    return [NSData dataWithBytes:&value length:sizeof(value)];
}

+ (instancetype)byt_dataWithInt64:(int64_t)value {
    return [NSData dataWithBytes:&value length:sizeof(value)];
}

+ (instancetype)byt_dataWithUInt64:(uint64_t)value {
    return [NSData dataWithBytes:&value length:sizeof(value)];
}

+ (instancetype)byt_dataWithInt:(int)value {
    return [NSData dataWithBytes:&value length:sizeof(value)];
}

+ (instancetype)byt_dataWithUInt:(unsigned int)value {
    return [NSData dataWithBytes:&value length:sizeof(value)];
}

+ (instancetype)byt_dataWithLong:(long)value {
    return [NSData dataWithBytes:&value length:sizeof(value)];
}

+ (instancetype)byt_dataWithLongLong:(long long)value {
    return [NSData dataWithBytes:&value length:sizeof(value)];
}

+ (instancetype)byt_dataWithFloat:(float)value {
    return [NSData dataWithBytes:&value length:sizeof(value)];
}

+ (instancetype)byt_dataWithDouble:(double)value {
    return [NSData dataWithBytes:&value length:sizeof(value)];
}

#pragma mark - private method

- (NSData*)_byt_swapByteOrder:(NSData*)subdata {
    uint8_t bytes[subdata.length];
    uint8_t reversedBytes[subdata.length];
    [subdata getBytes:bytes length:subdata.length];
    for (int i = 0; i < subdata.length; ++i) {
        reversedBytes[i] = bytes[subdata.length - 1 - i];
    }
    return [[NSData alloc] initWithBytes:reversedBytes length:subdata.length];
}

#pragma mark - public method

- (NSInteger)byt_toIntegerWithLocation:(NSUInteger)loc swapByteOrder:(BOOL)swapByteOrder {
    NSInteger value;
    NSData *data = [self subdataWithRange:NSMakeRange(loc, sizeof(value))];
    if (swapByteOrder) {
        data = [self _byt_swapByteOrder:data];
    }
    [data getBytes:&value length:sizeof(value)];

    return value;
}

- (NSUInteger)byt_toUIntegerWithLocation:(NSUInteger)loc swapByteOrder:(BOOL)swapByteOrder {
    NSUInteger value;
    NSData *data = [self subdataWithRange:NSMakeRange(loc, sizeof(value))];
    if (swapByteOrder) {
        data = [self _byt_swapByteOrder:data];
    }
    [data getBytes:&value length:sizeof(value)];

    return value;
}

- (short)byt_toShortWithLocation:(NSUInteger)loc swapByteOrder:(BOOL)swapByteOrder {
    short value;
    NSData *data = [self subdataWithRange:NSMakeRange(loc, sizeof(value))];
    if (swapByteOrder) {
        data = [self _byt_swapByteOrder:data];
    }
    [data getBytes:&value length:sizeof(value)];

    return value;
}

- (int8_t)byt_toInt8WithLocation:(NSUInteger)loc {
    int8_t value;
    NSData *data = [self subdataWithRange:NSMakeRange(loc, sizeof(value))];
    [data getBytes:&value length:sizeof(value)];

    return value;
}

- (uint8_t)byt_toUInt8WithLocation:(NSUInteger)loc {
    uint8_t value;
    NSData *data = [self subdataWithRange:NSMakeRange(loc, sizeof(value))];
    [data getBytes:&value length:sizeof(value)];

    return value;
}

- (int16_t)byt_toInt16WithLocation:(NSUInteger)loc swapByteOrder:(BOOL)swapByteOrder {
    int16_t value;
    NSData *data = [self subdataWithRange:NSMakeRange(loc, sizeof(value))];
    if (swapByteOrder) {
        data = [self _byt_swapByteOrder:data];
    }
    [data getBytes:&value length:sizeof(value)];

    return value;
}

- (uint16_t)byt_toUInt16WithLocation:(NSUInteger)loc swapByteOrder:(BOOL)swapByteOrder {
    uint16_t value;
    NSData *data = [self subdataWithRange:NSMakeRange(loc, sizeof(value))];
    if (swapByteOrder) {
        data = [self _byt_swapByteOrder:data];
    }
    [data getBytes:&value length:sizeof(value)];

    return value;
}

- (int32_t)byt_toInt32WithLocation:(NSUInteger)loc swapByteOrder:(BOOL)swapByteOrder {
    int32_t value;
    NSData *data = [self subdataWithRange:NSMakeRange(loc, sizeof(value))];
    if (swapByteOrder) {
        data = [self _byt_swapByteOrder:data];
    }
    [data getBytes:&value length:sizeof(value)];

    return value;
}

- (uint32_t)byt_toUInt32WithLocation:(NSUInteger)loc swapByteOrder:(BOOL)swapByteOrder {
    uint32_t value;
    NSData *data = [self subdataWithRange:NSMakeRange(loc, sizeof(value))];
    if (swapByteOrder) {
        data = [self _byt_swapByteOrder:data];
    }
    [data getBytes:&value length:sizeof(value)];

    return value;
}

- (int64_t)byt_toInt64WithLocation:(NSUInteger)loc swapByteOrder:(BOOL)swapByteOrder {
    int64_t value;
    NSData *data = [self subdataWithRange:NSMakeRange(loc, sizeof(value))];
    if (swapByteOrder) {
        data = [self _byt_swapByteOrder:data];
    }
    [data getBytes:&value length:sizeof(value)];

    return value;
}

- (uint64_t)byt_toUInt64WithLocation:(NSUInteger)loc swapByteOrder:(BOOL)swapByteOrder {
    uint64_t value;
    NSData *data = [self subdataWithRange:NSMakeRange(loc, sizeof(value))];
    if (swapByteOrder) {
        data = [self _byt_swapByteOrder:data];
    }
    [data getBytes:&value length:sizeof(value)];

    return value;
}

- (int)byt_toIntWithLocation:(NSUInteger)loc swapByteOrder:(BOOL)swapByteOrder {
    int value;
    NSData *data = [self subdataWithRange:NSMakeRange(loc, sizeof(value))];
    if (swapByteOrder) {
        data = [self _byt_swapByteOrder:data];
    }
    [data getBytes:&value length:sizeof(value)];

    return value;
}

- (unsigned int)byt_toUIntWithLocation:(NSUInteger)loc swapByteOrder:(BOOL)swapByteOrder {
    unsigned int value;
    NSData *data = [self subdataWithRange:NSMakeRange(loc, sizeof(value))];
    if (swapByteOrder) {
        data = [self _byt_swapByteOrder:data];
    }
    [data getBytes:&value length:sizeof(value)];

    return value;
}

- (long)byt_toLongWithLocation:(NSUInteger)loc swapByteOrder:(BOOL)swapByteOrder {
    long value;
    NSData *data = [self subdataWithRange:NSMakeRange(loc, sizeof(value))];
    if (swapByteOrder) {
        data = [self _byt_swapByteOrder:data];
    }
    [data getBytes:&value length:sizeof(value)];

    return value;
}

- (long long)byt_toLongLongWithLocation:(NSUInteger)loc swapByteOrder:(BOOL)swapByteOrder {
    long long value;
    NSData *data = [self subdataWithRange:NSMakeRange(loc, sizeof(value))];
    if (swapByteOrder) {
        data = [self _byt_swapByteOrder:data];
    }
    [data getBytes:&value length:sizeof(value)];

    return value;
}

- (float)byt_toFloatWithLocation:(NSUInteger)loc swapByteOrder:(BOOL)swapByteOrder {
    float value;
    NSData *data = [self subdataWithRange:NSMakeRange(loc, sizeof(value))];
    if (swapByteOrder) {
        data = [self _byt_swapByteOrder:data];
    }
    [data getBytes:&value length:sizeof(value)];

    return value;
}

- (double)byt_toDoubleWithLocation:(NSUInteger)loc swapByteOrder:(BOOL)swapByteOrder {
    double value;
    NSData *data = [self subdataWithRange:NSMakeRange(loc, sizeof(value))];
    if (swapByteOrder) {
        data = [self _byt_swapByteOrder:data];
    }
    [data getBytes:&value length:sizeof(value)];

    return value;
}

@end
