package _1I_2
{
   import flash.events.Event;
   import flash.display.DisplayObjectContainer;
   import _1J_2._1O_N_;
   
   public class _I_7 extends Event
   {
      
      public static const _0S_k:String = "containerAdd";
      
      public static const _1G_X_:String = "containerRemove";
      
      public static const _1f7:String = "handlerAdd";
      
      public static const _1pq:String = "handlerRemove";
       
      
      private var _O_a:DisplayObjectContainer;
      
      private var _handler:_1O_N_;
      
      public function _I_7(param1:String, param2:DisplayObjectContainer = null, param3:_1O_N_ = null)
      {
         super(param1);
         this._O_a = param2;
         this._handler = param3;
      }
      
      public function get container() : DisplayObjectContainer
      {
         return this._O_a;
      }
      
      public function get handler() : _1O_N_
      {
         return this._handler;
      }
      
      override public function clone() : Event
      {
         return new _I_7(type,this._O_a,this._handler);
      }
   }
}
