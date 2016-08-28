package _1__8
{
   import flash.events.Event;
   
   public class _4L_ extends Event
   {
      
      public static const ERROR:String = "error";
      
      public static const _0W_8:String = "preInitialize";
      
      public static const _1ji:String = "initialize";
      
      public static const _rx:String = "postInitialize";
      
      public static const _0M_e:String = "preSuspend";
      
      public static const _1T_E_:String = "suspend";
      
      public static const _0t1:String = "postSuspend";
      
      public static const _P_z:String = "preResume";
      
      public static const _0nh:String = "resume";
      
      public static const _0kH_:String = "postResume";
      
      public static const _1X_W_:String = "preDestroy";
      
      public static const _01I_:String = "destroy";
      
      public static const _1nG_:String = "postDestroy";
       
      
      public var error:Error;
      
      public function _4L_(param1:String)
      {
         super(param1);
      }
      
      override public function clone() : Event
      {
         var _loc1_:_4L_ = new _4L_(type);
         _loc1_.error = this.error;
         return _loc1_;
      }
   }
}
