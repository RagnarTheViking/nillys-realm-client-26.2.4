package _1U_P_
{
   import _P_S_.Mediator;
   import _wi.Injector;
   import _3b.CloseDialogsSignal;
   import _1lY_._1du;
   import _04h._160;
   import _04h._11o;
   import _na._xP_;
   
   public class _D_9 extends Mediator
   {
       
      
      [Inject]
      public var _T_X_:Injector;
      
      [Inject]
      public var view:_1U_P_.ArenaLeaderboard;
      
      [Inject]
      public var closeDialogs:CloseDialogsSignal;
      
      [Inject]
      public var _Y_L_:_1du;
      
      [Inject]
      public var _hj:_160;
      
      public function _D_9()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this._Y_L_.add(this._eJ_);
         this.view._1mn.add(this._1S_d);
         this.view.close.add(this._fH_);
         this.view.init();
      }
      
      override public function destroy() : void
      {
         this._hj._I_E_();
         this._Y_L_.remove(this._eJ_);
         this.view.destroy();
      }
      
      private function _fH_() : void
      {
         this.closeDialogs.dispatch();
      }
      
      private function _1S_d(param1:_11o) : void
      {
         var _loc2_:_xP_ = null;
         if(param1._19W_())
         {
            this.view._0S_K_(param1._0kz());
         }
         else
         {
            _loc2_ = this._T_X_.getInstance(_xP_);
            _loc2_.filter = param1;
            _loc2_.start();
         }
      }
      
      private function _eJ_() : void
      {
         this.view._os();
      }
   }
}
