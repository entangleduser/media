import protocol Foundation.LocalizedError
public protocol Format {
 var name: String { get }
}

public struct FormatError<A: Format>: LocalizedError {
 public let format: A
 public var errorDescription: String? {
  "Invalid format: \(format.name)"
 }
 public init(_ format: A) { self.format = format }
}


