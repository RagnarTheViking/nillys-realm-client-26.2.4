package _18
{
   import _P_S_.Mediator;
   import _S_b._O_e;
   import _S_b._1K_S_;
   import _K_r._1V_v;
   import _K_r._15w;
   import _0l7._15g;
   import kabam.rotmg.assets.services._157;
   import _05g._0O_3;
   import _1F_z._0P_4;
   import com.company.assembleegameclient.objects.Player;
   import _17B_._F_r;
   
   public class _0V_U_ extends Mediator
   {
       
      
      [Inject]
      public var view:_18._15m;
      
      [Inject]
      public var _1tf:_O_e;
      
      [Inject]
      public var _fS_:_1K_S_;
      
      [Inject]
      public var _E_:_1V_v;
      
      [Inject]
      public var _A_f:_15w;
      
      [Inject]
      public var _ak:_15g;
      
      [Inject]
      public var _101:_157;
      
      [Inject]
      public var _01C_:_18._0as;
      
      [Inject]
      public var _M_I_:_0O_3;
      
      [Inject]
      public var _ot:_18._0A_6;
      
      [Inject]
      public var _06I_:_0P_4;
      
      private var _Q_j:Boolean = true;
      
      public function _0V_U_()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.view._0sT_.add(this._04t);
         this._E_.addOnce(this._0zM_);
         this._01C_.add(this._1A_7);
         this._M_I_.add(this._0Z_R_);
         this._ot.add(this._1gZ_);
         this._ak.add(this._1qm);
      }
      
      private function _1A_7(param1:_0I_h) : void
      {
         this._Q_j = false;
         this._1qs();
         this._0zM_(this._1tf._14O_.map.player_);
      }
      
      private function _0Z_R_() : void
      {
         this._Q_j = true;
         this._1qs();
         this._0zM_(this._1tf._14O_.map.player_);
         this.view._8j(1);
      }
      
      private function _1gZ_() : void
      {
         var _loc1_:int = this.view._1xt + 1;
         _loc1_ = _loc1_ % this.view._0L_B_.length;
         this.view._8j(_loc1_);
      }
      
      override public function destroy() : void
      {
         this.view._0sT_.remove(this._04t);
         this._A_f.remove(this._P_A_);
      }
      
      private function _0zM_(param1:Player) : void
      {
         if(!param1)
         {
            return;
         }
         this.view._09W_(this._101._1Y_K_(_0M_3._04c),new _09V_(param1));
         if(this._Q_j)
         {
            this.view._09W_(this._101._1Y_K_(_0M_3._0o1),new _56(this.view.HEIGHT));
         }
         if(param1.hasBackpack_)
         {
            this.view._09W_(this._101._1Y_K_(_0M_3._nK_),new _1o0(param1));
         }
         else
         {
            this._A_f.add(this._P_A_);
         }
         if(this._06I_._0T_T_())
         {
            this.view._09W_(this._101._1Y_K_(_0M_3._00f),new _F_r());
         }
      }
      
      private function _1qs() : void
      {
         this.view._1qs();
      }
      
      private function _04t(param1:String) : void
      {
         this._fS_._1F_0 = param1;
      }
      
      private function _P_A_(param1:Boolean) : void
      {
         var _loc2_:Player = null;
         if(param1)
         {
            _loc2_ = this._1tf._14O_.map.player_;
            this.view._09W_(this._101._1Y_K_(_0M_3._nK_),new _1o0(_loc2_));
            this._A_f.remove(this._P_A_);
         }
      }
      
      private function _1qm() : void
      {
         this._1qs();
         this._0zM_(this._1tf._14O_.map.player_);
      }
   }
}
