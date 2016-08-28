package _0S_w
{
   import flash.events.Event;
   import com.company.util.IntPoint;
   
   class _2i extends Event
   {
      
      public static const TILES_EVENT:String = "TILES_EVENT";
       
      
      public var tiles_:Vector.<IntPoint>;
      
      function _2i(param1:Vector.<IntPoint>)
      {
         super(TILES_EVENT);
         this.tiles_ = param1;
      }
   }
}
