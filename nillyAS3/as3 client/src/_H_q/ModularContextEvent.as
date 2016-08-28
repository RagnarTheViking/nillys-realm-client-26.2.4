package _H_q
{
   import flash.events.Event;
   import _1__8._1Q_O_;
   
   public class ModularContextEvent extends Event
   {
      
      public static const _si:String = "contextAdd";
      
      public static const _d3:String = "contextRemove";
       
      
      private var _0S_Z_:_1Q_O_;
      
      public function ModularContextEvent(param1:String, param2:_1Q_O_)
      {
         super(param1,true,true);
         this._0S_Z_ = param2;
      }
      
      public function get context() : _1Q_O_
      {
         return this._0S_Z_;
      }
      
      override public function clone() : Event
      {
         return new ModularContextEvent(type,this.context);
      }
      
      override public function toString() : String
      {
         return formatToString("ModularContextEvent","context");
      }
   }
}
