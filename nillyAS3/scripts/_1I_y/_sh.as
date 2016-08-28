package _1I_y
{
   import _1__8._01s;
   import flash.events.IEventDispatcher;
   import _1__8._1Q_O_;
   import _I_w._0S_m;
   import flash.events.EventDispatcher;
   
   public class _sh implements _01s
   {
       
      
      private const _0yi:String = _0S_m.create(_sh);
      
      private var _eventDispatcher:IEventDispatcher;
      
      public function _sh(param1:IEventDispatcher = null)
      {
         super();
         this._eventDispatcher = param1 || new EventDispatcher();
      }
      
      public function extend(param1:_1Q_O_) : void
      {
         param1._T_X_.map(IEventDispatcher)._1as(this._eventDispatcher);
      }
      
      public function toString() : String
      {
         return this._0yi;
      }
   }
}
