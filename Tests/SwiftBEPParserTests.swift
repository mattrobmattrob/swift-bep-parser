import XCTest

@testable import SwiftBEPParser

final class SwiftBEPParserTests: XCTestCase {
  private enum InternalError: Error {
    case missingResourceBundle
  }

  /// Access file recorded via `--build_event_binary_file`.
  private func fixtureBuildEventFile(name: String, fileExtension: String = "bep") throws -> String {
    guard let fixtureBundlePath = Bundle(
      for: SwiftBEPParserTests.self
    ).path(forResource: "SwiftBEPParserTestsResources", ofType: "bundle"),
          let fixtureBundle = Bundle(path: fixtureBundlePath),
          let resourcePath = fixtureBundle.path(forResource: name, ofType: fileExtension) else {
      throw InternalError.missingResourceBundle
    }

    return resourcePath
  }

  func test_SuccessBEP() throws {
    XCTAssertNoThrow(try fixtureBuildEventFile(name: "macos_build_success"))
  }

  func test_FailureBEP() throws {
    XCTAssertNoThrow(try fixtureBuildEventFile(name: "macos_build_failure"))
  }
}
