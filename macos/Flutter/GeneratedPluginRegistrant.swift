//
//  Generated file. Do not edit.
//

import FlutterMacOS
import Foundation

<<<<<<< HEAD
import video_player_avfoundation

func RegisterGeneratedPlugins(registry: FlutterPluginRegistry) {
  FVPVideoPlayerPlugin.register(with: registry.registrar(forPlugin: "FVPVideoPlayerPlugin"))
=======
import package_info_plus
import video_player_avfoundation
import wakelock_plus

func RegisterGeneratedPlugins(registry: FlutterPluginRegistry) {
  FPPPackageInfoPlusPlugin.register(with: registry.registrar(forPlugin: "FPPPackageInfoPlusPlugin"))
  FVPVideoPlayerPlugin.register(with: registry.registrar(forPlugin: "FVPVideoPlayerPlugin"))
  WakelockPlusMacosPlugin.register(with: registry.registrar(forPlugin: "WakelockPlusMacosPlugin"))
>>>>>>> 6615576e83356ebfc050190caaccd4ff4c26eb21
}
