package _ll
{
   import flash.utils.Dictionary;
   import flash.media.Sound;
   import com.company.assembleegameclient.parameters.Parameters;
   import flash.events.IOErrorEvent;
   import _2l.ClientSettings;
   import _0H_6.GameContext;
   import flash.net.URLRequest;
   import flash.media.SoundTransform;
   import flash.media.SoundChannel;
   import flash.events.Event;
   
   public class SFX
   {
      
      private static const _S_o:String = "{URLBASE}/sfx/{NAME}.mp3";
      
      private static var serverAddress:String;
      
      public static var sounds:Dictionary = new Dictionary();
      
      private static var soundChannels:Dictionary = new Dictionary(true);
       
      
      public function SFX()
      {
         super();
      }
      
      public static function load(param1:String, param2:Boolean = true) : Sound
      {
         if(!Parameters.data_.playSFX && param2 || !param2 && !Parameters.data_.playPewPew)
         {
            return null;
         }
         return sounds[param1] = sounds[param1] || getSfx(param1);
      }
      
      private static function getSfx(param1:String) : Sound
      {
         var _loc2_:Sound = new Sound();
         _loc2_.addEventListener(IOErrorEvent.IO_ERROR,onIOError);
         _loc2_.load(getSoundURLReq(param1));
         return _loc2_;
      }
      
      private static function setSoundServer() : String
      {
         var setup:ClientSettings = null;
         var base:String = "";
         try
         {
            setup = GameContext.getInjector().getInstance(ClientSettings);
            base = setup.HttpServerAddress(true);
         }
         catch(error:Error)
         {
            base = "localhost";
         }
         return base;
      }
      
      private static function getSoundURLReq(param1:String) : URLRequest
      {
         serverAddress = serverAddress || setSoundServer();
         var _loc2_:String = _S_o.replace("{URLBASE}",serverAddress).replace("{NAME}",param1);
         return new URLRequest(_loc2_);
      }
      
      public static function play(param1:String, param2:Number = 1, param3:Boolean = true) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:SoundTransform = null;
         var _loc6_:SoundChannel = null;
         var _loc7_:Sound = load(param1,param3);
         if(_loc7_ == null)
         {
            return;
         }
         try
         {
            _loc4_ = Parameters.data_.playSFX && param3 || !param3 && Parameters.data_.playPewPew?Number(param2):Number(0);
            _loc5_ = new SoundTransform(_loc4_);
            _loc6_ = _loc7_.play(0,0,_loc5_);
            _loc6_.addEventListener(Event.SOUND_COMPLETE,removeChannel,false,0,true);
            soundChannels[_loc6_] = param2;
            return;
         }
         catch(error:Error)
         {
            return;
         }
      }
      
      private static function removeChannel(param1:Event) : void
      {
         var _loc2_:SoundChannel = param1.target as SoundChannel;
         delete soundChannels[_loc2_];
      }
      
      public static function toggle() : void
      {
         var _loc1_:SoundChannel = null;
         var _loc2_:SoundTransform = null;
         for each(_loc1_ in soundChannels)
         {
            _loc2_ = _loc1_.soundTransform;
            _loc2_.volume = !!Parameters.data_.playSFX?Number(soundChannels[_loc1_]):Number(0);
            _loc1_.soundTransform = _loc2_;
         }
      }
      
      public static function onIOError(param1:IOErrorEvent) : void
      {
      }
   }
}
