package _156
{
   import _P_S_.Mediator;
   import flash.display.DisplayObjectContainer;
   import _130._R_5;
   import _1__8._19A_;
   import flash.display.LoaderInfo;
   import flash.events.IEventDispatcher;
   import flash.events.ErrorEvent;
   
   public class _W_y extends Mediator
   {
       
      
      private const _0nC_:String = "uncaughtErrorEvents";
      
      private const _0j0:String = "uncaughtError";
      
      [Inject]
      public var _0ki:DisplayObjectContainer;
      
      [Inject]
      public var error:_R_5;
      
      [Inject]
      public var _0G_2:_19A_;
      
      private var loaderInfo:LoaderInfo;
      
      public function _W_y()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.loaderInfo = this._0ki.loaderInfo;
         if(this._0yp())
         {
            this._1T_Q_();
         }
      }
      
      override public function destroy() : void
      {
         if(this._0yp())
         {
            this._0E_i();
         }
      }
      
      private function _0yp() : Boolean
      {
         return this.loaderInfo.hasOwnProperty(this._0nC_);
      }
      
      private function _1T_Q_() : void
      {
         var _loc1_:IEventDispatcher = IEventDispatcher(this.loaderInfo[this._0nC_]);
         _loc1_.addEventListener(this._0j0,this._1L_p);
      }
      
      private function _0E_i() : void
      {
         var _loc1_:IEventDispatcher = IEventDispatcher(this.loaderInfo[this._0nC_]);
         _loc1_.removeEventListener(this._0j0,this._1L_p);
      }
      
      private function _1L_p(param1:ErrorEvent) : void
      {
         this.error.dispatch(param1);
      }
   }
}
