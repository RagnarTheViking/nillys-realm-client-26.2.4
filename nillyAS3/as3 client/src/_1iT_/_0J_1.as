package _1iT_
{
   import flash.events.Event;
   
   public class _0J_1 extends Event
   {
      
      public static const _sY_:String = "GUILDRESULTEVENT";
       
      
      public var success_:Boolean;
      
      public var _B_z:String;
      
      public var _1Y_e:Object;
      
      public function _0J_1(param1:Boolean, param2:String, param3:Object)
      {
         super(_sY_);
         this.success_ = param1;
         this._B_z = param2;
         this._1Y_e = param3;
      }
   }
}
