import AVFAudio
import AudioToolbox

@_exported import class AVFoundation.AVAudioPlayer

public typealias AudioPlayerDelegate = AVAudioPlayerDelegate
open class AudioPlayer: AVAudioPlayer {

 override public init() {
  super.init()
 }

 private func checkFormat() throws {
  if #available(macOS 10.15, *) {
   if format.formatDescription.mediaSubType == .opus {
    // FIXME: opus format causes a floating point error
    throw AudioFormatError(.opus)
   }
  }
 }

 override public init(contentsOf url: URL) throws {
  try super.init(contentsOf: url)
  try checkFormat()
 }

 override public init(
  contentsOf url: URL, fileTypeHint utiString: String?
 ) throws {
  try super.init(contentsOf: url, fileTypeHint: utiString)
  try checkFormat()
 }
}


