// swift-tools-version: 5.5
import PackageDescription

let package = Package(
 name: "Media",
 products: [
  .library(name: "Media", targets: ["Media"]),
  .library(name: "AudioMedia", targets: ["Audio"]),
  .library(name: "MediaRemote", targets: ["Remote"]),
  .library(name: "MediaFormat", targets: ["Format"])
 ],
 targets: [
  .target(name: "Media", dependencies: ["Audio", "Remote", "Format"]),
  .target(name: "Audio"),
  .target(name: "Remote"),
  .target(name: "Format"),
  .testTarget(name: "MediaTests", dependencies: ["Media"])
 ]
)
