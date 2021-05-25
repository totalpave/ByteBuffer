//
//  BYTByteBuffer.m
//  ByteBuffer
//
//  Created by Masaki Ando on 2019/01/05.
//  Copyright (c) 2019 Hituzi Ando. All rights reserved.
//

#import "BYTByteBuffer.h"

#import "NSData+BYTExtension.h"

@interface BYTByteBuffer ()

@property (nonatomic) NSUInteger capacity;
@property (nonatomic) NSMutableData *buff;

@end

@implementation BYTByteBuffer {
    CFByteOrder _systemByteOrder;
    CFByteOrder _byteOrder;
}

+ (instancetype)allocateWithCapacity:(NSUInteger)capacity byteOrder:(CFByteOrder)byteOrder {
    if (byteOrder == CFByteOrderUnknown) {
        return [self allocateWithCapacity:capacity];
    }
    else {
        return [[BYTByteBuffer alloc] initWithCapacity:capacity byteOrder:byteOrder];
    }
}

+ (instancetype)allocateWithCapacity:(NSUInteger)capacity {
    return [self allocateWithCapacity:capacity byteOrder:[BYTByteBuffer _getSystemByteOrder]];
}

- (instancetype)initWithCapacity:(NSUInteger)capacity byteOrder:(CFByteOrder)byteOrder {
    self = [super init];
    self->_systemByteOrder = [BYTByteBuffer _getSystemByteOrder];

    if (self) {
        self->_byteOrder = byteOrder;
        _capacity = capacity;
        _limit = capacity;
        _position = 0;
        _buff = [NSMutableData dataWithCapacity:capacity];
        [_buff resetBytesInRange:NSMakeRange(0, capacity)];
    }

    return self;
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`-init` is invalid initializer. Please uses `+allocateWithCapacity:` instead."
                                 userInfo:nil];
}

#pragma mark - property

- (void)setByteOrder:(CFByteOrder)byteOrder {
    if (byteOrder == CFByteOrderUnknown) {
        self->_byteOrder = [BYTByteBuffer _getSystemByteOrder];
    }
    else {
        self->_byteOrder = byteOrder;
    }
}

- (CFByteOrder)getByteOrder {
    return self->_byteOrder;
}

- (void)setPosition:(NSUInteger)position {
    if (position > self.limit) {
        @throw [NSException exceptionWithName:NSRangeException
                                       reason:@"`position` must be less than or equal to `limit`."
                                     userInfo:nil];
    }

    _position = position;
}

- (void)setLimit:(NSUInteger)limit {
    if (limit > self.capacity) {
        @throw [NSException exceptionWithName:NSRangeException
                                       reason:@"`limit` must be less than or equal to `capacity`."
                                     userInfo:nil];
    }

    _limit = limit;
}

- (NSData *)buffer {
    return [self.buff copy];
}

- (NSInteger)remaining {
    return self.limit - self.position;
}

- (BOOL)hasRemaining {
    return self.remaining > 0;
}

#pragma mark - private method
+ (CFByteOrder)_getSystemByteOrder {
    CFByteOrder currentOrder = CFByteOrderGetCurrent();
    if (currentOrder == CFByteOrderUnknown) {
        int16_t number = 0x1; // Store the number 1 in a 2-byte int
        int8_t* numPtr = (int8_t*)&number; // cast the 2-byte int to 1-byte int
        // Look at the byte that the 1-byte int has. If it is 1, then we are in little endian, otherwise big endian.
        return numPtr[0] == 1 ? CFByteOrderBigEndian : CFByteOrderLittleEndian;
    }
    else {
        return currentOrder;
    }
}

- (instancetype)_putData:(NSData *)data swapByteOrder:(BOOL)swapByteOrder {
    if (swapByteOrder) {
        uint8_t bytes[data.length];
        uint8_t reversedBytes[data.length];
        [data getBytes:bytes length:data.length];
        for (int i = 0; i < data.length; ++i) {
            reversedBytes[i] = bytes[data.length - 1 - i];
        }
        data = [[NSData alloc] initWithBytes:reversedBytes length:data.length];
    }
    
    return [self putData:data];
}

#pragma mark - public method

- (instancetype)putInteger:(NSInteger)i {
    return [self _putData:[NSData byt_dataWithInteger:i] swapByteOrder:self->_systemByteOrder != self->_byteOrder];
}

- (instancetype)putUInteger:(NSUInteger)i {
    return [self _putData:[NSData byt_dataWithUInteger:i] swapByteOrder:self->_systemByteOrder != self->_byteOrder];
}

- (instancetype)putShort:(short)s {
    return [self _putData:[NSData byt_dataWithShort:s] swapByteOrder:self->_systemByteOrder != self->_byteOrder];
}

- (instancetype)putInt8:(int8_t)i {
    return [self putData:[NSData byt_dataWithInt8:i]];
}

- (instancetype)putUInt8:(uint8_t)i {
    return [self putData:[NSData byt_dataWithUInt8:i]];
}

- (instancetype)putInt16:(int16_t)i {
    return [self _putData:[NSData byt_dataWithInt16:i] swapByteOrder:self->_systemByteOrder != self->_byteOrder];
}

- (instancetype)putUInt16:(uint16_t)i {
    return [self _putData:[NSData byt_dataWithUInt16:i] swapByteOrder:self->_systemByteOrder != self->_byteOrder];
}

- (instancetype)putInt32:(int32_t)i {
    return [self _putData:[NSData byt_dataWithInt32:i] swapByteOrder:self->_systemByteOrder != self->_byteOrder];
}

- (instancetype)putUInt32:(uint32_t)i {
    return [self _putData:[NSData byt_dataWithUInt32:i] swapByteOrder:self->_systemByteOrder != self->_byteOrder];
}

- (instancetype)putInt64:(int64_t)i {
    return [self _putData:[NSData byt_dataWithInt64:i] swapByteOrder:self->_systemByteOrder != self->_byteOrder];
}

- (instancetype)putUInt64:(uint64_t)i {
    return [self _putData:[NSData byt_dataWithUInt64:i] swapByteOrder:self->_systemByteOrder != self->_byteOrder];
}

- (instancetype)putInt:(int)i {
    return [self _putData:[NSData byt_dataWithInt:i] swapByteOrder:self->_systemByteOrder != self->_byteOrder];
}

- (instancetype)putUInt:(unsigned int)i {
    return [self _putData:[NSData byt_dataWithUInt:i] swapByteOrder:self->_systemByteOrder != self->_byteOrder];
}

- (instancetype)putLong:(long)l {
    return [self _putData:[NSData byt_dataWithLong:l] swapByteOrder:self->_systemByteOrder != self->_byteOrder];
}

- (instancetype)putLongLong:(long long)ll {
    return [self _putData:[NSData byt_dataWithLongLong:ll] swapByteOrder:self->_systemByteOrder != self->_byteOrder];
}

- (instancetype)putFloat:(float)f {
    return [self _putData:[NSData byt_dataWithFloat:f] swapByteOrder:self->_systemByteOrder != self->_byteOrder];
}

- (instancetype)putDouble:(double)d {
    return [self _putData:[NSData byt_dataWithDouble:d] swapByteOrder:self->_systemByteOrder != self->_byteOrder];
}

- (instancetype)putUTF8String:(NSString *)string {
    return [self putData:[string dataUsingEncoding:NSUTF8StringEncoding]];
}

- (instancetype)putData:(NSData *)data {
    if (self.position + data.length > self.limit) {
        @throw [NSException exceptionWithName:NSRangeException
                                       reason:@"Overflow."
                                     userInfo:nil];
    }

    [self.buff replaceBytesInRange:NSMakeRange(self.position, data.length) withBytes:data.bytes];
    self.position += data.length;

    return self;
}

- (NSInteger)getInteger {
    if (self.position >= self.limit) {
        @throw [NSException exceptionWithName:NSRangeException
                                       reason:@"Overflow."
                                     userInfo:nil];
    }
    NSInteger value = [self.buff byt_toIntegerWithLocation:self.position swapByteOrder: self->_systemByteOrder != self->_byteOrder];
    self.position += sizeof(value);

    return value;
}

- (NSUInteger)getUInteger {
    if (self.position >= self.limit) {
        @throw [NSException exceptionWithName:NSRangeException
                                       reason:@"Overflow."
                                     userInfo:nil];
    }

    NSUInteger value = [self.buff byt_toUIntegerWithLocation:self.position swapByteOrder: self->_systemByteOrder != self->_byteOrder];
    self.position += sizeof(value);

    return value;
}

- (short)getShort {
    if (self.position >= self.limit) {
        @throw [NSException exceptionWithName:NSRangeException
                                       reason:@"Overflow."
                                     userInfo:nil];
    }

    short value = [self.buff byt_toShortWithLocation:self.position swapByteOrder: self->_systemByteOrder != self->_byteOrder];
    self.position += sizeof(value);

    return value;
}

- (int8_t)getInt8 {
    if (self.position >= self.limit) {
        @throw [NSException exceptionWithName:NSRangeException
                                       reason:@"Overflow."
                                     userInfo:nil];
    }

    int8_t value = [self.buff byt_toInt8WithLocation:self.position];
    self.position += sizeof(value);

    return value;
}

- (uint8_t)getUInt8 {
    if (self.position >= self.limit) {
        @throw [NSException exceptionWithName:NSRangeException
                                       reason:@"Overflow."
                                     userInfo:nil];
    }

    uint8_t value = [self.buff byt_toUInt8WithLocation:self.position];
    self.position += sizeof(value);

    return value;
}

- (int16_t)getInt16 {
    if (self.position >= self.limit) {
        @throw [NSException exceptionWithName:NSRangeException
                                       reason:@"Overflow."
                                     userInfo:nil];
    }

    int16_t value = [self.buff byt_toInt16WithLocation:self.position swapByteOrder: self->_systemByteOrder != self->_byteOrder];
    self.position += sizeof(value);

    return value;
}

- (uint16_t)getUInt16 {
    if (self.position >= self.limit) {
        @throw [NSException exceptionWithName:NSRangeException
                                       reason:@"Overflow."
                                     userInfo:nil];
    }

    uint16_t value = [self.buff byt_toUInt16WithLocation:self.position swapByteOrder: self->_systemByteOrder != self->_byteOrder];
    self.position += sizeof(value);

    return value;
}

- (int32_t)getInt32 {
    if (self.position >= self.limit) {
        @throw [NSException exceptionWithName:NSRangeException
                                       reason:@"Overflow."
                                     userInfo:nil];
    }

    int32_t value = [self.buff byt_toInt32WithLocation:self.position swapByteOrder: self->_systemByteOrder != self->_byteOrder];
    self.position += sizeof(value);

    return value;
}

- (uint32_t)getUInt32 {
    if (self.position >= self.limit) {
        @throw [NSException exceptionWithName:NSRangeException
                                       reason:@"Overflow."
                                     userInfo:nil];
    }

    uint32_t value = [self.buff byt_toUInt32WithLocation:self.position swapByteOrder: self->_systemByteOrder != self->_byteOrder];
    self.position += sizeof(value);

    return value;
}

- (int64_t)getInt64 {
    if (self.position >= self.limit) {
        @throw [NSException exceptionWithName:NSRangeException
                                       reason:@"Overflow."
                                     userInfo:nil];
    }

    int64_t value = [self.buff byt_toInt64WithLocation:self.position swapByteOrder: self->_systemByteOrder != self->_byteOrder];
    self.position += sizeof(value);

    return value;
}

- (uint64_t)getUInt64 {
    if (self.position >= self.limit) {
        @throw [NSException exceptionWithName:NSRangeException
                                       reason:@"Overflow."
                                     userInfo:nil];
    }

    uint64_t value = [self.buff byt_toUInt64WithLocation:self.position swapByteOrder: self->_systemByteOrder != self->_byteOrder];
    self.position += sizeof(value);

    return value;
}

- (int)getInt {
    if (self.position >= self.limit) {
        @throw [NSException exceptionWithName:NSRangeException
                                       reason:@"Overflow."
                                     userInfo:nil];
    }

    int value = [self.buff byt_toIntWithLocation:self.position swapByteOrder: self->_systemByteOrder != self->_byteOrder];
    self.position += sizeof(value);

    return value;
}

- (unsigned int)getUInt {
    if (self.position >= self.limit) {
        @throw [NSException exceptionWithName:NSRangeException
                                       reason:@"Overflow."
                                     userInfo:nil];
    }

    unsigned int value = [self.buff byt_toUIntWithLocation:self.position swapByteOrder: self->_systemByteOrder != self->_byteOrder];
    self.position += sizeof(value);

    return value;
}

- (long)getLong {
    if (self.position >= self.limit) {
        @throw [NSException exceptionWithName:NSRangeException
                                       reason:@"Overflow."
                                     userInfo:nil];
    }

    long value = [self.buff byt_toLongWithLocation:self.position swapByteOrder: self->_systemByteOrder != self->_byteOrder];
    self.position += sizeof(value);

    return value;
}

- (long long)getLongLong {
    if (self.position >= self.limit) {
        @throw [NSException exceptionWithName:NSRangeException
                                       reason:@"Overflow."
                                     userInfo:nil];
    }

    long long value = [self.buff byt_toLongLongWithLocation:self.position swapByteOrder: self->_systemByteOrder != self->_byteOrder];
    self.position += sizeof(value);

    return value;
}

- (float)getFloat {
    if (self.position >= self.limit) {
        @throw [NSException exceptionWithName:NSRangeException
                                       reason:@"Overflow."
                                     userInfo:nil];
    }

    float value = [self.buff byt_toFloatWithLocation:self.position swapByteOrder: self->_systemByteOrder != self->_byteOrder];
    self.position += sizeof(value);

    return value;
}

- (double)getDouble {
    if (self.position >= self.limit) {
        @throw [NSException exceptionWithName:NSRangeException
                                       reason:@"Overflow."
                                     userInfo:nil];
    }

    double value = [self.buff byt_toDoubleWithLocation:self.position swapByteOrder: self->_systemByteOrder != self->_byteOrder];
    self.position += sizeof(value);

    return value;
}

- (NSString*)getUTF8StringWithLength:(NSUInteger)length {
    // All necessary validation is done in getDataWithLength.
    NSData *data = [self getDataWithLength:length];
    // Don't increase the position because getDataWithLength manages the position
    const char *datas = [data bytes];
    return [[NSString alloc] initWithUTF8String:datas];
}

- (NSData *)getDataWithLength:(NSUInteger)length {
    if (length == 0) {
        @throw [NSException exceptionWithName:NSInvalidArgumentException
                                        reason:@"Length must be greater than 0."
                                     userInfo:nil];
    }
    
    if (self.position >= self.limit) {
        @throw [NSException exceptionWithName:NSRangeException
                                       reason:@"Overflow."
                                     userInfo:nil];
    }

    NSData *data = [self.buff subdataWithRange:NSMakeRange(self.position, length)];
    self.position += length;

    return data;
}

- (NSData *)getData {
    if (self.position >= self.limit) {
        @throw [NSException exceptionWithName:NSRangeException
                                       reason:@"Overflow."
                                     userInfo:nil];
    }

    NSData *data = [self.buff subdataWithRange:NSMakeRange(self.position, 1)];
    self.position++;

    return data;
}

- (instancetype)flip {
    self.limit = self.position;
    self.position = 0;

    return self;
}

- (instancetype)rewind {
    self.position = 0;

    return self;
}

- (instancetype)clear {
    self.position = 0;
    self.limit = self.capacity;

    return self;
}

- (instancetype)compact {
    NSData *data = [self.buff subdataWithRange:NSMakeRange(self.position, self.buff.length - self.position)];
    [self.buff replaceBytesInRange:NSMakeRange(0, data.length) withBytes:data.bytes];
    self.position = self.limit - self.position;
    self.limit = self.capacity;

    return self;
}

@end
