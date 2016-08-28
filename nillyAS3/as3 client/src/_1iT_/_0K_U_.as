package _1iT_
{
   import flash.events.Event;
   import _0hJ_.Server;
   import flash.utils.ByteArray;
   
   public class _0K_U_ extends Event
   {
      
      public static const RECONNECT:String = "RECONNECT_EVENT";
       
      
      public var server_:Server;
      
      public var gameId_:int;
      
      public var _S_a:Boolean;
      
      public var charId_:int;
      
      public var keyTime_:int;
      
      public var key_:ByteArray;
      
      public var isFromArena_:Boolean;
      
      public function _0K_U_(param1:Server, param2:int, param3:Boolean, param4:int, param5:int, param6:ByteArray, param7:Boolean)
      {
         super(RECONNECT);
         this.server_ = param1;
         this.gameId_ = param2;
         this._S_a = param3;
         this.charId_ = param4;
         this.keyTime_ = param5;
         this.key_ = param6;
         this.isFromArena_ = param7;
      }
      
      override public function clone() : Event
      {
         return new _0K_U_(this.server_,this.gameId_,this._S_a,this.charId_,this.keyTime_,this.key_,this.isFromArena_);
      }
      
      override public function toString() : String
      {
         return formatToString(RECONNECT,"server_","gameId_","charId_","keyTime_","key_","isFromArena_");
      }
   }
}
