package _wi
{
   import flash.events.Event;
   
   public class _0J_F_ extends Event
   {
      
      public static const _0uZ_:String = "postInstantiate";
      
      public static const _1y9:String = "preConstruct";
      
      public static const _D_O_:String = "postConstruct";
       
      
      public var _0D_t;
      
      public var _1L_O_:Class;
      
      public function _0J_F_(param1:String, param2:Object, param3:Class)
      {
         super(param1);
         this._0D_t = param2;
         this._1L_O_ = param3;
      }
      
      override public function clone() : Event
      {
         return new _0J_F_(type,this._0D_t,this._1L_O_);
      }
   }
}
