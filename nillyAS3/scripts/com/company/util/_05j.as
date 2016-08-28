package com.company.util
{
   import flash.system.Capabilities;
   
   public class _05j
   {
       
      
      public function _05j()
      {
         super();
      }
      
      public static function _Y_P_() : String
      {
         return _0B_J_("avHardwareDisable") + _0B_J_("hasAccessibility") + _0B_J_("hasAudio") + _0B_J_("hasAudioEncoder") + _0B_J_("hasEmbeddedVideo") + _0B_J_("hasIME") + _0B_J_("hasMP3") + _0B_J_("hasPrinting") + _0B_J_("hasScreenBroadcast") + _0B_J_("hasScreenPlayback") + _0B_J_("hasStreamingAudio") + _0B_J_("hasStreamingVideo") + _0B_J_("hasTLS") + _0B_J_("hasVideoEncoder") + _0B_J_("isDebugger") + _0B_J_("language") + _0B_J_("localFileReadDisable") + _0B_J_("manufacturer") + _0B_J_("os") + _0B_J_("pixelAspectRatio") + _0B_J_("playerType") + _0B_J_("screenColor") + _0B_J_("screenDPI") + _0B_J_("screenResolutionX") + _0B_J_("screenResolutionY") + _0B_J_("version");
      }
      
      private static function _0B_J_(param1:String) : String
      {
         return param1 + ": " + Capabilities[param1] + "\n";
      }
   }
}
