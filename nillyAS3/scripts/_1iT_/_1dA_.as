package _1iT_
{
   import flash.events.Event;
   import flash.display.BitmapData;
   import com.company.assembleegameclient.objects.Player;
   
   public class _1dA_ extends Event
   {
      
      public static const DEATH:String = "DEATH";
       
      
      public var background_:BitmapData;
      
      public var player_:Player;
      
      public var accountId_:int;
      
      public var charId_:int;
      
      public function _1dA_(param1:BitmapData, param2:int, param3:int)
      {
         super(DEATH);
         this.background_ = param1;
         this.accountId_ = param2;
         this.charId_ = param3;
      }
   }
}
