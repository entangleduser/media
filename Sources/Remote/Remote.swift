@preconcurrency import MediaPlayer

public typealias RemoteControl = MPRemoteCommandCenter
public extension RemoteControl {
 static var shared: RemoteControl { .shared() }
 typealias CommandEvent = MPRemoteCommandEvent
 typealias CommandHandlerStatus = MPRemoteCommandHandlerStatus

 var onPlay: ((CommandEvent) -> CommandHandlerStatus)? {
  get { nil }
  set {
   if let newValue {
    playCommand.addTarget(handler: newValue)
   } else {
    playCommand.removeTarget(nil)
   }
  }
 }

 var onPause: ((CommandEvent) -> CommandHandlerStatus)? {
  get { nil }
  set {
   if let newValue {
    pauseCommand.addTarget(handler: newValue)
   } else {
    pauseCommand.removeTarget(nil)
   }
  }
 }

 var onTogglePlayPause: ((CommandEvent) -> CommandHandlerStatus)? {
  get { nil }
  set {
   if let newValue {
    togglePlayPauseCommand.addTarget(handler: newValue)
   } else {
    togglePlayPauseCommand.removeTarget(nil)
   }
  }
 }

 var onStop: ((CommandEvent) -> CommandHandlerStatus)? {
  get { nil }
  set {
   if let newValue {
    stopCommand.addTarget(handler: newValue)
   } else {
    stopCommand.removeTarget(nil)
   }
  }
 }

 var onNext: ((CommandEvent) -> CommandHandlerStatus)? {
  get { nil }
  set {
   if let newValue {
    nextTrackCommand.addTarget(handler: newValue)
   } else {
    nextTrackCommand.removeTarget(nil)
   }
  }
 }

 var onPrevious: ((CommandEvent) -> CommandHandlerStatus)? {
  get { nil }
  set {
   if let newValue {
    previousTrackCommand.addTarget(handler: newValue)
   } else {
    previousTrackCommand.removeTarget(nil)
   }
  }
 }

 var onChangeRepeatMode: ((CommandEvent) -> CommandHandlerStatus)? {
  get { nil }
  set {
   if let newValue {
    changeRepeatModeCommand.addTarget(handler: newValue)
   } else {
    changeRepeatModeCommand.removeTarget(nil)
   }
  }
 }
 
 var onChangeShuffleMode: ((CommandEvent) -> CommandHandlerStatus)? {
  get { nil }
  set {
   if let newValue {
    changeShuffleModeCommand.addTarget(handler: newValue)
   } else {
    changeShuffleModeCommand.removeTarget(nil)
   }
  }
 }

 var supportedPlaybackRates: [Double] {
  get {
   changePlaybackRateCommand.supportedPlaybackRates.map(\.doubleValue)
  }
  set { changePlaybackRateCommand.supportedPlaybackRates = newValue as [NSNumber] }
 }

 var onChangePlaybackRate: ((Double) -> CommandHandlerStatus)? {
  get { nil }
  set {
   if let newValue {
    changePlaybackRateCommand.addTarget { event in
     newValue(
      Double((event as! MPChangePlaybackRateCommandEvent).playbackRate)
     )
    }
   } else {
    changePlaybackRateCommand.removeTarget(nil)
   }
  }
 }

 var preferredSkipForwardInterval: Double? {
  get { skipForwardCommand.preferredIntervals.first?.doubleValue }
  set {
   if let newValue {
    skipForwardCommand.preferredIntervals = [newValue] as [NSNumber]
   } else {
    skipForwardCommand.preferredIntervals = []
   }
  }
 }
 
 var onSkipForward: ((Double) -> CommandHandlerStatus)? {
  get { nil }
  set {
   if let newValue {
    skipForwardCommand.addTarget { event in
     newValue((event as! MPSkipIntervalCommandEvent).interval)
    }
   } else {
    skipForwardCommand.removeTarget(nil)
   }
  }
 }

 var preferredSkipBackInterval: Double? {
  get { skipBackwardCommand.preferredIntervals.first?.doubleValue }
  set {
   if let newValue {
    skipBackwardCommand.preferredIntervals = [newValue] as [NSNumber]
   } else {
    skipBackwardCommand.preferredIntervals = []
   }
  }
 }
 
 var onSkipBackward: ((Double) -> CommandHandlerStatus)? {
  get { nil }
  set {
   if let newValue {
    skipBackwardCommand.addTarget { event in
     newValue((event as! MPSkipIntervalCommandEvent).interval)
    }
   } else {
    skipBackwardCommand.removeTarget(nil)
   }
  }
 }

 var onChangePlaybackPosition: ((Double) -> CommandHandlerStatus)? {
  get { nil }
  set {
   if let newValue {
    changePlaybackPositionCommand.addTarget { event in
     newValue((event as! MPChangePlaybackPositionCommandEvent).positionTime)
    }
   } else {
    changePlaybackPositionCommand.removeTarget(nil)
   }
  }
 }

 func disableAllCommands() {
  playCommand.removeTarget(nil)
  pauseCommand.removeTarget(nil)
  togglePlayPauseCommand.removeTarget(nil)
  stopCommand.removeTarget(nil)
  nextTrackCommand.removeTarget(nil)
  previousTrackCommand.removeTarget(nil)
  changeRepeatModeCommand.removeTarget(nil)
  changeShuffleModeCommand.removeTarget(nil)
  changePlaybackRateCommand.removeTarget(nil)
  skipForwardCommand.removeTarget(nil)
  skipBackwardCommand.removeTarget(nil)
  changePlaybackPositionCommand.removeTarget(nil)
 }
}
