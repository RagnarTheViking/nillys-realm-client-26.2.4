package _1__H_
{
   import _P_S_.Mediator;
   import _1F_z._0P_4;
   import _0l7._0G_y;
   import _4u.Account;
   import _3b.DialogSignal;
   import _3b.CloseDialogsSignal;
   import _1F_z._0B_P_;
   import _1F_z._1r__;
   import _1F_z._0f1;
   
   public class _0__7 extends Mediator
   {
       
      
      [Inject]
      public var view:_1__H_.YardUpgraderView;
      
      [Inject]
      public var _06I_:_0P_4;
      
      [Inject]
      public var _0Y_s:_0G_y;
      
      [Inject]
      public var account:Account;
      
      [Inject]
      public var _06Z_:DialogSignal;
      
      [Inject]
      public var _0dR_:CloseDialogsSignal;
      
      public function _0__7()
      {
         super();
      }
      
      override public function initialize() : void
      {
         var _loc1_:_0B_P_ = new _0B_P_();
         var _loc2_:int = this._06I_._0f__();
         var _loc3_:int = _loc2_ < _1r__._99._V_B_?int(_1r__._162(_loc2_ + 1)._V_B_):int(_1r__._99._V_B_);
         _loc1_._0E_L_ = _1r__._162(_loc2_).value;
         _loc1_._14Z_ = _1r__._162(_loc3_).value;
         _loc1_._pd = this._06I_._1O_K_();
         _loc1_._X_e = this._06I_._0P_S_();
         this.view.init(_loc1_);
         this.view._I_G_.add(this._n3);
         this.view._0T_P_.add(this._0Q_T_);
      }
      
      private function _0Q_T_(param1:int) : void
      {
         this._14U_(0);
      }
      
      private function _n3(param1:int) : void
      {
         this._14U_(1);
      }
      
      private function _14U_(param1:uint) : void
      {
         var _loc2_:int = this._06I_._0tS_();
         var _loc3_:_0f1 = new _0f1(_loc2_,param1);
         this._0dR_.dispatch();
         this._0Y_s.dispatch(_loc3_);
      }
   }
}
