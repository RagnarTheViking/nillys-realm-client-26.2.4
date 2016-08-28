package _0hx
{
   import _P_S_.Mediator;
   import _04m._kN_;
   import _04e._05X_;
   import _06s._F_d;
   import _0C_u._tD_;
   import _0C_u._tx;
   import _0C_u._0a0;
   import _1T_4._0V_s;
   import _04m.Timespan;
   import _04m._0dn;
   
   public class _ms extends Mediator
   {
       
      
      [Inject]
      public var view:_0hx._Q_p;
      
      [Inject]
      public var model:_kN_;
      
      [Inject]
      public var _0pS_:_05X_;
      
      [Inject]
      public var _:_F_d;
      
      [Inject]
      public var _0V_3:_tD_;
      
      [Inject]
      public var update:_tx;
      
      [Inject]
      public var exit:_0a0;
      
      [Inject]
      public var _S_s:_0V_s;
      
      public function _ms()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this._S_s.dispatch("/legendsScreen");
         this.view.close.add(this._fH_);
         this.view._Z_X_.add(this._0xt);
         this.view._070.add(this._0ro);
         this.update.add(this._0fs);
         this._0xt(this.model._1pG_());
      }
      
      private function _fH_() : void
      {
         this.exit.dispatch();
      }
      
      override public function destroy() : void
      {
         this.view.close.remove(this._fH_);
         this.view._Z_X_.remove(this._0xt);
         this.view._070.remove(this._0ro);
         this.update.remove(this._0fs);
         this._0pS_._I_V_();
         this.model.clear();
      }
      
      private function _0xt(param1:Timespan) : void
      {
         this.model._05P_(param1);
         if(this.model._1X_E_())
         {
            this._0fs();
         }
         else
         {
            this._15e();
         }
      }
      
      private function _15e() : void
      {
         this.view.clear();
         this.view._mj();
         this._0V_3.dispatch(this.model._1pG_());
      }
      
      private function _0fs(param1:Timespan = null) : void
      {
         param1 = param1 || this.model._1pG_();
         this.view._gN_();
         this.view._1tH_(param1,this.model._wb());
      }
      
      private function _0ro(param1:_0dn) : void
      {
         this._.dispatch(param1);
      }
   }
}
