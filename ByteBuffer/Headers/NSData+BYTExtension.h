//
//  NSData+BYTExtension.h
//  ByteBuffer
//
//  Created by Masaki Ando on 2019/01/06.
//  Copyright (c) 2019 Hituzi Ando. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSData (BYTExtension)
/**
 * Creates the instance from given NSInteger value.
 *
 * @param value A value
 * @return A NSData
 */
+ (instancetype)byt_dataWithInteger:(NSInteger)value;
/**
 * Creates the instance from given NSUInteger value.
 *
 * @param value A value
 * @return A NSData
 */
+ (instancetype)byt_dataWithUInteger:(NSUInteger)value;
/**
 * Creates the instance from given short value.
 *
 * @param value A value
 * @return A NSData
 */
+ (instancetype)byt_dataWithShort:(short)value;
/**
 * Creates the instance from given int8_t value.
 *
 * @param value A value
 * @return A NSData
 */
+ (instancetype)byt_dataWithInt8:(int8_t)value;
/**
 * Creates the instance from given uint8_t value.
 *
 * @param value A value
 * @return A NSData
 */
+ (instancetype)byt_dataWithUInt8:(uint8_t)value;
/**
 * Creates the instance from given int16_t value.
 *
 * @param value A value
 * @return A NSData
 */
+ (instancetype)byt_dataWithInt16:(int16_t)value;
/**
 * Creates the instance from given uint16_t value.
 *
 * @param value A value
 * @return A NSData
 */
+ (instancetype)byt_dataWithUInt16:(uint16_t)value;
/**
 * Creates the instance from given int32_t value.
 *
 * @param value A value
 * @return A NSData
 */
+ (instancetype)byt_dataWithInt32:(int32_t)value;
/**
 * Creates the instance from given uint32_t value.
 *
 * @param value A value
 * @return A NSData
 */
+ (instancetype)byt_dataWithUInt32:(uint32_t)value;
/**
 * Creates the instance from given int64_t value.
 *
 * @param value A value
 * @return A NSData
 */
+ (instancetype)byt_dataWithInt64:(int64_t)value;
/**
 * Creates the instance from given uint64_t value.
 *
 * @param value A value
 * @return A NSData
 */
+ (instancetype)byt_dataWithUInt64:(uint64_t)value;
/**
 * Creates the instance from given int value.
 *
 * @param value A value
 * @return A NSData
 */
+ (instancetype)byt_dataWithInt:(int)value;
/**
 * Creates the instance from given unsigned int value.
 *
 * @param value A value
 * @return A NSData
 */
+ (instancetype)byt_dataWithUInt:(unsigned int)value;
/**
 * Creates the instance from given long value.
 *
 * @param value A value
 * @return A NSData
 */
+ (instancetype)byt_dataWithLong:(long)value;
/**
 * Creates the instance from given long long value.
 *
 * @param value A value
 * @return A NSData
 */
+ (instancetype)byt_dataWithLongLong:(long long)value;
/**
 * Creates the instance from given float value.
 *
 * @param value A value
 * @return A NSData
 */
+ (instancetype)byt_dataWithFloat:(float)value;
/**
 * Creates the instance from given double value.
 *
 * @param value A value
 * @return A NSData
 */
+ (instancetype)byt_dataWithDouble:(double)value;

/**
 * Converts the receiver using given starting location to NSInteger.
 *
 * @param loc A starting location of range.
 * @param swapByteOrder Flag to indicate the ByteOrder to read data in. If true, and system byte order is big endian, data will be read in little endian and vice versa.
 * @return A value.
 */
- (NSInteger)byt_toIntegerWithLocation:(NSUInteger)loc swapByteOrder:(BOOL)swapByteOrder;
/**
 * Converts the receiver using given starting location to NSUInteger.
 *
 * @param loc A starting location of range.
 * @return A value.
 */
- (NSUInteger)byt_toUIntegerWithLocation:(NSUInteger)loc swapByteOrder:(BOOL)swapByteOrder;
/**
 * Converts the receiver using given starting location to short.
 *
 * @param loc A starting location of range.
 * @return A value.
 */
- (short)byt_toShortWithLocation:(NSUInteger)loc swapByteOrder:(BOOL)swapByteOrder;
/**
 * Converts the receiver using given starting location to int8_t.
 *
 * @param loc A starting location of range.
 * @return A value.
 */
- (int8_t)byt_toInt8WithLocation:(NSUInteger)loc;
/**
 * Converts the receiver using given starting location to uint8_t.
 *
 * @param loc A starting location of range.
 * @return A value.
 */
- (uint8_t)byt_toUInt8WithLocation:(NSUInteger)loc;
/**
 * Converts the receiver using given starting location to int16_t.
 *
 * @param loc A starting location of range.
 * @return A value.
 */
- (int16_t)byt_toInt16WithLocation:(NSUInteger)loc swapByteOrder:(BOOL)swapByteOrder;
/**
 * Converts the receiver using given starting location to uint16_t.
 *
 * @param loc A starting location of range.
 * @return A value.
 */
- (uint16_t)byt_toUInt16WithLocation:(NSUInteger)loc swapByteOrder:(BOOL)swapByteOrder;
/**
 * Converts the receiver using given starting location to int32_t.
 *
 * @param loc A starting location of range.
 * @return A value.
 */
- (int32_t)byt_toInt32WithLocation:(NSUInteger)loc swapByteOrder:(BOOL)swapByteOrder;
/**
 * Converts the receiver using given starting location to uint32_t.
 *
 * @param loc A starting location of range.
 * @return A value.
 */
- (uint32_t)byt_toUInt32WithLocation:(NSUInteger)loc swapByteOrder:(BOOL)swapByteOrder;
/**
 * Converts the receiver using given starting location to int64_t.
 *
 * @param loc A starting location of range.
 * @return A value.
 */
- (int64_t)byt_toInt64WithLocation:(NSUInteger)loc swapByteOrder:(BOOL)swapByteOrder;
/**
 * Converts the receiver using given starting location to uint64_t.
 *
 * @param loc A starting location of range.
 * @return A value.
 */
- (uint64_t)byt_toUInt64WithLocation:(NSUInteger)loc swapByteOrder:(BOOL)swapByteOrder;
/**
 * Converts the receiver using given starting location to int.
 *
 * @param loc A starting location of range.
 * @return A value.
 */
- (int)byt_toIntWithLocation:(NSUInteger)loc swapByteOrder:(BOOL)swapByteOrder;
/**
 * Converts the receiver using given starting location to unsigned int.
 *
 * @param loc A starting location of range.
 * @return A value.
 */
- (unsigned int)byt_toUIntWithLocation:(NSUInteger)loc swapByteOrder:(BOOL)swapByteOrder;
/**
 * Converts the receiver using given starting location to long.
 *
 * @param loc A starting location of range.
 * @return A value.
 */
- (long)byt_toLongWithLocation:(NSUInteger)loc swapByteOrder:(BOOL)swapByteOrder;
/**
 * Converts the receiver using given starting location to long long.
 *
 * @param loc A starting location of range.
 * @return A value.
 */
- (long long)byt_toLongLongWithLocation:(NSUInteger)loc swapByteOrder:(BOOL)swapByteOrder;
/**
 * Converts the receiver using given starting location to float.
 *
 * @param loc A starting location of range.
 * @return A value.
 */
- (float)byt_toFloatWithLocation:(NSUInteger)loc swapByteOrder:(BOOL)swapByteOrder;
/**
 * Converts the receiver using given starting location to double.
 *
 * @param loc A starting location of range.
 * @return A value.
 */
- (double)byt_toDoubleWithLocation:(NSUInteger)loc swapByteOrder:(BOOL)swapByteOrder;

@end

NS_ASSUME_NONNULL_END
