package _tZ_
{
   import flash.events.Event;
   
   public class _1V_7 extends Event
   {
      
      public static const SET_RANK:String = "SET_RANK";
      
      public static const REMOVE_MEMBER:String = "REMOVE_MEMBER";
       
      
      public var name_:String;
      
      public var _1xi:int;
      
      public function _1V_7(param1:String, param2:String, param3:int = -1)
      {
         super(param1,true);
         this.name_ = param2;
         this._1xi = param3;
      }
   }
}
