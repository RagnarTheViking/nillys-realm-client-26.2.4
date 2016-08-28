package _05L_
{
   public class ChatMessage
   {
       
      
      public var name:String;
      
      public var text:String;
      
      public var objectId:int = -1;
      
      public var numStars:int = -1;
      
      public var admin:Boolean = false;
      
      public var recipientName:String = "";
      
      public var isTell2Me:Boolean;
      
      public var isTell:Boolean;
      
      public var tokens:Object;
      
      public var nameColor:int = 1193046;
      
      public var textColor:int = 1193046;
      
      public function ChatMessage()
      {
         super();
      }
      
      public static function make(param1:String, param2:String, param3:int = -1, param4:int = -1, param5:String = "", param6:Boolean = false, param7:Object = null, param8:Boolean = false, param9:int = 1193046, param10:int = 1193046, param11:Boolean = false) : ChatMessage
      {
         var _loc12_:ChatMessage = new ChatMessage();
         _loc12_.name = param1;
         _loc12_.text = param2;
         _loc12_.objectId = param3;
         _loc12_.numStars = param4;
         _loc12_.admin = param11;
         _loc12_.recipientName = param5;
         _loc12_.isTell2Me = param6;
         _loc12_.isTell = param8;
         _loc12_.tokens = param7 == null?{}:param7;
         _loc12_.nameColor = param9;
         _loc12_.textColor = param10;
         return _loc12_;
      }
   }
}
