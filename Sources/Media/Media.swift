@_exported import Audio
@_exported import Remote
@_exported import Format

public enum MediaType: String, Codable {
 case video = "vide", audio = "soun", subtitle = "sbtl", odsm = "odsm", sdsm = "sdsm",
 text = "text"
}
