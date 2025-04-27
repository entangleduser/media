import Format
import typealias Foundation.FourCharCode

public enum AudioFormat: FourCharCode, Codable, Format {
 case opus = 1_869_641_075, flac = 1_718_378_851, aac = 1_633_772_320,
      mp3 = 778_924_083,
      appleLossless = 1_634_492_771, linearPCM = 1_819_304_813
 public var name: String {
  switch self {
  default: "\(self)"
  }
 }
}

public typealias AudioFormatError = FormatError<AudioFormat>

extension AudioFormatError {
 init(_ format: AudioFormat) {
  self.init(format)
 }
}
