package _0H_N_
{
   import flash.events.EventDispatcher;
   import flash.display.LoaderInfo;
   import flash.events.Event;
   
   public class _146 extends EventDispatcher implements _0q2
   {
       
      
      private var _0jN_:LoaderInfo;
      
      public function _146()
      {
         super();
      }
      
      override public function toString() : String
      {
         return this._0jN_.toString();
      }
      
      override public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         this._0jN_.addEventListener(param1,param2,param3,param4,param5);
      }
      
      override public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         this._0jN_.removeEventListener(param1,param2,param3);
      }
      
      override public function dispatchEvent(param1:Event) : Boolean
      {
         return this._0jN_.dispatchEvent(param1);
      }
      
      override public function hasEventListener(param1:String) : Boolean
      {
         return this._0jN_.hasEventListener(param1);
      }
      
      override public function willTrigger(param1:String) : Boolean
      {
         return this._0jN_.willTrigger(param1);
      }
      
      public function set loaderInfo(param1:LoaderInfo) : void
      {
         this._0jN_ = param1;
      }
   }
}
