package _pX_
{
   import _0O_c._H_0;
   import _0R_R_._1Q_g;
   import _0pN_._114;
   import _3b.CloseDialogsSignal;
   import _1T_4._34;
   import _m2._1N_l;
   import _1T_4._1yM_;
   import _1T_4._kc;
   import _1T_4._1U_z;
   import _v4._1K_N_;
   import _1y1._I_Y_;
   import _0pN_._1my;
   import _0pN_._M_Y_;
   import _0pN_._eg;
   import flash.display.Sprite;
   import com.company.assembleegameclient.game.GameSprite;
   import _W_Q_.CharacterSelectionAndNewsScreen;
   import _0H_w._1P_e;
   
   public class _1E_v
   {
       
      
      [Inject]
      public var data:_H_0;
      
      [Inject]
      public var _1rB_:_1Q_g;
      
      [Inject]
      public var _0rU_:_114;
      
      [Inject]
      public var closeDialogs:CloseDialogsSignal;
      
      [Inject]
      public var _0F_n:_34;
      
      [Inject]
      public var _1h5:_1N_l;
      
      [Inject]
      public var _S_s:_1yM_;
      
      [Inject]
      public var _11v:_kc;
      
      [Inject]
      public var _0rh:_1U_z;
      
      [Inject]
      public var _1h:_1K_N_;
      
      [Inject]
      public var _0v9:_I_Y_;
      
      private var _0W_e:_1my;
      
      public function _1E_v()
      {
         super();
      }
      
      public function execute() : void
      {
         this._0W_e = new _1my(this._0rh,this._4V_());
         var _loc1_:_M_Y_ = new _M_Y_(this._1rB_,this._1R_g(),this._0l1());
         this._0rU_.add(_loc1_);
         _loc1_.start();
      }
      
      private function _1R_g() : _eg
      {
         var _loc1_:_eg = new _eg();
         _loc1_.add(new _1my(this.closeDialogs));
         _loc1_.add(new _1my(this._S_s,this._0ad()));
         _loc1_.add(new _1my(this._1h5));
         _loc1_.add(new _1my(this._11v));
         _loc1_.add(this._0v9);
         _loc1_.add(this._0W_e);
         return _loc1_;
      }
      
      private function _0l1() : _eg
      {
         var _loc1_:_eg = new _eg();
         _loc1_.add(new _1my(this._0F_n,this._1rB_));
         _loc1_.add(this._0W_e);
         return _loc1_;
      }
      
      private function _4V_() : Sprite
      {
         var _loc1_:Class = this._1h._1Z_z();
         if(_loc1_ == null || _loc1_ == GameSprite)
         {
            _loc1_ = CharacterSelectionAndNewsScreen;
         }
         return new _loc1_();
      }
      
      private function _0ad() : _1P_e
      {
         var _loc1_:_1P_e = new _1P_e();
         _loc1_.category = "account";
         _loc1_._19E_ = "signedIn";
         return _loc1_;
      }
   }
}
