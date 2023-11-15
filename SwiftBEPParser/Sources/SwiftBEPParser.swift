import Foundation

import BuildEventProtocol_build_event_stream_proto
import SwiftProtobuf

/// Parse Build Event Protocol (BEP) information.
public struct SwiftBEPParser {
  public enum Errors: Error {
    case inputStreamInvalid
  }

  /// Parse the output from `--build_event_binary_file` into a list of build
  /// events.  The `path` item should contain the binary protobuf information.
  static func parse(_ path: URL) throws -> [BuildEventStream_BuildEvent] {
    guard let stream = InputStream(url: path) else {
      throw Errors.inputStreamInvalid
    }
    stream.open()
    defer {
      stream.close()
    }

    var messages: [BuildEventStream_BuildEvent] = []

    do {
      while stream.hasBytesAvailable {
        let message = try BinaryDelimited.parse(
          messageType: BuildEventStream_BuildEvent.self,
          from: stream
        )
        messages.append(message)
      }
    } catch BinaryDelimited.Error.truncated {
      // TODO: Be smarter about detecting in loop above when the BEP stream has ended.
    }

    return messages
  }
}
