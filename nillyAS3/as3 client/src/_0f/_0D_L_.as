package _0f
{
   import flash.events.Event;
   
   public class _0D_L_ extends Event
   {
      
      public static const _0xW_:String = "mediatorCreate";
      
      public static const _0V_K_:String = "mediatorRemove";
       
      
      private var _8C_:Object;
      
      private var _08z:Object;
      
      private var _0I_r:_0f._1F_b;
      
      private var _factory:_0f._1iK_;
      
      public function _0D_L_(param1:String, param2:Object, param3:Object, param4:_0f._1F_b, param5:_0f._1iK_)
      {
         super(param1);
         this._8C_ = param2;
         this._08z = param3;
         this._0I_r = param4;
         this._factory = param5;
      }
      
      public function get mediator() : Object
      {
         return this._8C_;
      }
      
      public function get view() : Object
      {
         return this._08z;
      }
      
      public function get mapping() : _0f._1F_b
      {
         return this._0I_r;
      }
      
      public function get factory() : _0f._1iK_
      {
         return this._factory;
      }
      
      override public function clone() : Event
      {
         return new _0D_L_(type,this._8C_,this._08z,this._0I_r,this._factory);
      }
   }
}
