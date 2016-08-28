package _0ph
{
   import flash.events.IEventDispatcher;
   
   public class _1mm
   {
       
      
      private var _0gL_:IEventDispatcher;
      
      private var _0yo:String;
      
      private var _0U_R_:Function;
      
      private var _0tw:Class;
      
      private var _callback:Function;
      
      private var _1dF_:Boolean;
      
      public function _1mm(param1:IEventDispatcher, param2:String, param3:Function, param4:Class, param5:Function, param6:Boolean)
      {
         super();
         this._0gL_ = param1;
         this._0yo = param2;
         this._0U_R_ = param3;
         this._0tw = param4;
         this._callback = param5;
         this._1dF_ = param6;
      }
      
      public function get dispatcher() : IEventDispatcher
      {
         return this._0gL_;
      }
      
      public function get eventString() : String
      {
         return this._0yo;
      }
      
      public function get listener() : Function
      {
         return this._0U_R_;
      }
      
      public function get eventClass() : Class
      {
         return this._0tw;
      }
      
      public function get callback() : Function
      {
         return this._callback;
      }
      
      public function get useCapture() : Boolean
      {
         return this._1dF_;
      }
   }
}
