// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: google/bytestream/bytestream.proto
//
// For information on using the generated types, please see the documentation:
//   https://github.com/apple/swift-protobuf/

// Copyright 2016 Google Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import Foundation
import SwiftProtobuf

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that you are building against the same version of the API
// that was used to generate this file.
fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
  struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
  typealias Version = _2
}

/// Request object for ByteStream.Read.
public struct Google_Bytestream_ReadRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// The name of the resource to read.
  public var resourceName: String = String()

  /// The offset for the first byte to return in the read, relative to the start
  /// of the resource.
  ///
  /// A `read_offset` that is negative or greater than the size of the resource
  /// will cause an `OUT_OF_RANGE` error.
  public var readOffset: Int64 = 0

  /// The maximum number of `data` bytes the server is allowed to return in the
  /// sum of all `ReadResponse` messages. A `read_limit` of zero indicates that
  /// there is no limit, and a negative `read_limit` will cause an error.
  ///
  /// If the stream returns fewer bytes than allowed by the `read_limit` and no
  /// error occurred, the stream includes all data from the `read_offset` to the
  /// end of the resource.
  public var readLimit: Int64 = 0

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

/// Response object for ByteStream.Read.
public struct Google_Bytestream_ReadResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// A portion of the data for the resource. The service **may** leave `data`
  /// empty for any given `ReadResponse`. This enables the service to inform the
  /// client that the request is still live while it is running an operation to
  /// generate more data.
  public var data: Data = SwiftProtobuf.Internal.emptyData

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

/// Request object for ByteStream.Write.
public struct Google_Bytestream_WriteRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// The name of the resource to write. This **must** be set on the first
  /// `WriteRequest` of each `Write()` action. If it is set on subsequent calls,
  /// it **must** match the value of the first request.
  public var resourceName: String = String()

  /// The offset from the beginning of the resource at which the data should be
  /// written. It is required on all `WriteRequest`s.
  ///
  /// In the first `WriteRequest` of a `Write()` action, it indicates
  /// the initial offset for the `Write()` call. The value **must** be equal to
  /// the `committed_size` that a call to `QueryWriteStatus()` would return.
  ///
  /// On subsequent calls, this value **must** be set and **must** be equal to
  /// the sum of the first `write_offset` and the sizes of all `data` bundles
  /// sent previously on this stream.
  ///
  /// An incorrect value will cause an error.
  public var writeOffset: Int64 = 0

  /// If `true`, this indicates that the write is complete. Sending any
  /// `WriteRequest`s subsequent to one in which `finish_write` is `true` will
  /// cause an error.
  public var finishWrite: Bool = false

  /// A portion of the data for the resource. The client **may** leave `data`
  /// empty for any given `WriteRequest`. This enables the client to inform the
  /// service that the request is still live while it is running an operation to
  /// generate more data.
  public var data: Data = SwiftProtobuf.Internal.emptyData

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

/// Response object for ByteStream.Write.
public struct Google_Bytestream_WriteResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// The number of bytes that have been processed for the given resource.
  public var committedSize: Int64 = 0

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

/// Request object for ByteStream.QueryWriteStatus.
public struct Google_Bytestream_QueryWriteStatusRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// The name of the resource whose write status is being requested.
  public var resourceName: String = String()

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

/// Response object for ByteStream.QueryWriteStatus.
public struct Google_Bytestream_QueryWriteStatusResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// The number of bytes that have been processed for the given resource.
  public var committedSize: Int64 = 0

  /// `complete` is `true` only if the client has sent a `WriteRequest` with
  /// `finish_write` set to true, and the server has processed that request.
  public var complete: Bool = false

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "google.bytestream"

extension Google_Bytestream_ReadRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".ReadRequest"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "resource_name"),
    2: .standard(proto: "read_offset"),
    3: .standard(proto: "read_limit"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.resourceName)
      case 2: try decoder.decodeSingularInt64Field(value: &self.readOffset)
      case 3: try decoder.decodeSingularInt64Field(value: &self.readLimit)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.resourceName.isEmpty {
      try visitor.visitSingularStringField(value: self.resourceName, fieldNumber: 1)
    }
    if self.readOffset != 0 {
      try visitor.visitSingularInt64Field(value: self.readOffset, fieldNumber: 2)
    }
    if self.readLimit != 0 {
      try visitor.visitSingularInt64Field(value: self.readLimit, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Google_Bytestream_ReadRequest, rhs: Google_Bytestream_ReadRequest) -> Bool {
    if lhs.resourceName != rhs.resourceName {return false}
    if lhs.readOffset != rhs.readOffset {return false}
    if lhs.readLimit != rhs.readLimit {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Google_Bytestream_ReadResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".ReadResponse"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    10: .same(proto: "data"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 10: try decoder.decodeSingularBytesField(value: &self.data)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.data.isEmpty {
      try visitor.visitSingularBytesField(value: self.data, fieldNumber: 10)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Google_Bytestream_ReadResponse, rhs: Google_Bytestream_ReadResponse) -> Bool {
    if lhs.data != rhs.data {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Google_Bytestream_WriteRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".WriteRequest"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "resource_name"),
    2: .standard(proto: "write_offset"),
    3: .standard(proto: "finish_write"),
    10: .same(proto: "data"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.resourceName)
      case 2: try decoder.decodeSingularInt64Field(value: &self.writeOffset)
      case 3: try decoder.decodeSingularBoolField(value: &self.finishWrite)
      case 10: try decoder.decodeSingularBytesField(value: &self.data)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.resourceName.isEmpty {
      try visitor.visitSingularStringField(value: self.resourceName, fieldNumber: 1)
    }
    if self.writeOffset != 0 {
      try visitor.visitSingularInt64Field(value: self.writeOffset, fieldNumber: 2)
    }
    if self.finishWrite != false {
      try visitor.visitSingularBoolField(value: self.finishWrite, fieldNumber: 3)
    }
    if !self.data.isEmpty {
      try visitor.visitSingularBytesField(value: self.data, fieldNumber: 10)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Google_Bytestream_WriteRequest, rhs: Google_Bytestream_WriteRequest) -> Bool {
    if lhs.resourceName != rhs.resourceName {return false}
    if lhs.writeOffset != rhs.writeOffset {return false}
    if lhs.finishWrite != rhs.finishWrite {return false}
    if lhs.data != rhs.data {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Google_Bytestream_WriteResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".WriteResponse"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "committed_size"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularInt64Field(value: &self.committedSize)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.committedSize != 0 {
      try visitor.visitSingularInt64Field(value: self.committedSize, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Google_Bytestream_WriteResponse, rhs: Google_Bytestream_WriteResponse) -> Bool {
    if lhs.committedSize != rhs.committedSize {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Google_Bytestream_QueryWriteStatusRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".QueryWriteStatusRequest"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "resource_name"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.resourceName)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.resourceName.isEmpty {
      try visitor.visitSingularStringField(value: self.resourceName, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Google_Bytestream_QueryWriteStatusRequest, rhs: Google_Bytestream_QueryWriteStatusRequest) -> Bool {
    if lhs.resourceName != rhs.resourceName {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Google_Bytestream_QueryWriteStatusResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".QueryWriteStatusResponse"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "committed_size"),
    2: .same(proto: "complete"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularInt64Field(value: &self.committedSize)
      case 2: try decoder.decodeSingularBoolField(value: &self.complete)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.committedSize != 0 {
      try visitor.visitSingularInt64Field(value: self.committedSize, fieldNumber: 1)
    }
    if self.complete != false {
      try visitor.visitSingularBoolField(value: self.complete, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Google_Bytestream_QueryWriteStatusResponse, rhs: Google_Bytestream_QueryWriteStatusResponse) -> Bool {
    if lhs.committedSize != rhs.committedSize {return false}
    if lhs.complete != rhs.complete {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
