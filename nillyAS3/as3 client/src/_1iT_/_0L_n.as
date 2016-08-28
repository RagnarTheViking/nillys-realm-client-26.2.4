package _1iT_
{
   import flash.events.Event;
   import Packets.Server.NameResult;
   
   public class _0L_n extends Event
   {
      
      public static const NAMERESULTEVENT:String = "NAMERESULTEVENT";
       
      
      public var _0Q_Z_:NameResult;
      
      public function _0L_n(param1:NameResult)
      {
         super(NAMERESULTEVENT);
         this._0Q_Z_ = param1;
      }
   }
}
