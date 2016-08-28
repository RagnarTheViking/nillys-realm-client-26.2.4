package _P_S_
{
   import _0f.IMediator;
   import _0J_Q_._09O_;
   import flash.events.IEventDispatcher;
   import flash.events.Event;
   
   public class Mediator implements IMediator
   {
       
      
      [Inject]
      public var _9S_:_09O_;
      
      [Inject]
      public var _0W_a:IEventDispatcher;
      
      private var _wc:Object;
      
      public function Mediator()
      {
         super();
      }
      
      public function set viewComponent(param1:Object) : void
      {
         this._wc = param1;
      }
      
      public function initialize() : void
      {
      }
      
      public function destroy() : void
      {
         this._9S_._0tB_();
      }
      
      protected function _1hQ_(param1:String, param2:Function, param3:Class = null) : void
      {
         this._9S_._0J_e(IEventDispatcher(this._wc),param1,param2,param3);
      }
      
      protected function _0lc(param1:String, param2:Function, param3:Class = null) : void
      {
         this._9S_._0J_e(this._0W_a,param1,param2,param3);
      }
      
      protected function _1y7(param1:String, param2:Function, param3:Class = null) : void
      {
         this._9S_._1W_Y_(IEventDispatcher(this._wc),param1,param2,param3);
      }
      
      protected function _09f(param1:String, param2:Function, param3:Class = null) : void
      {
         this._9S_._1W_Y_(this._0W_a,param1,param2,param3);
      }
      
      protected function dispatch(param1:Event) : void
      {
         if(this._0W_a.hasEventListener(param1.type))
         {
            this._0W_a.dispatchEvent(param1);
         }
      }
   }
}
