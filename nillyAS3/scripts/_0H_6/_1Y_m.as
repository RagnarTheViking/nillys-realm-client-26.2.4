package _0H_6
{
   import _1__8.IConfig;
   import _1__8._1Q_O_;
   import _2l.ClientSettings;
   import flash.display.DisplayObjectContainer;
   import _wi.Injector;
   import _V_y.ISignalCommandMap;
   import _0f.IMediatorMap;
   import _S_U_._1yd;
   import _0E_n._jE_;
   import _1T_4._1X_b;
   import _1T_4._1aw;
   import _0H_w._E_h;
   import _v4.Client;
   import _v4._f0;
   import _v4._1K_N_;
   import _1I_S_._19G_;
   import _G_Z_._0S_5;
   import _G_Z_._rG_;
   import _1T_4._1yM_;
   import _G_Z_._J_x;
   import _1T_4._0V_s;
   import _G_Z_._0N_Y_;
   import _1T_4._kc;
   import _G_Z_._0gJ_;
   import _1T_4._1U_z;
   import _G_Z_._1vA_;
   import _1T_4._0mO_;
   import _G_Z_._I_b;
   import _1T_4._Q_G_;
   import _G_Z_._1F_y;
   import _G_Z_._0Y_7;
   import _m2._W_O_;
   import _G_Z_._S_j;
   import _G_Z_._0hn;
   import _ki._yx;
   import _ki._0gb;
   import _0pN_._114;
   import _0H_w.PurchaseCharacterClassTask;
   import _0H_w._1N_c;
   import _0H_w._6;
   import _1T_4._0es;
   import _1T_4._1S_b;
   import _1T_4._Z_c;
   import _1T_4._q6;
   import _1T_4._1K_2;
   import _1T_4._1pn;
   import _1T_4._ws;
   import _1T_4._0tI_;
   import _0E_n._1X_U_;
   import _0E_n._1qG_;
   import _1R_o._Y_5;
   import _0P_8._T_u;
   
   public class _1Y_m implements IConfig
   {
       
      
      [Inject]
      public var context:_1Q_O_;
      
      [Inject]
      public var setup:ClientSettings;
      
      [Inject]
      public var _0ki:DisplayObjectContainer;
      
      [Inject]
      public var _T_X_:Injector;
      
      [Inject]
      public var _1S_M_:ISignalCommandMap;
      
      [Inject]
      public var mediatorMap:IMediatorMap;
      
      [Inject]
      public var startup:_1yd;
      
      private var _H_u:_jE_;
      
      public function _1Y_m()
      {
         super();
      }
      
      public function configure() : void
      {
         this._0h4();
         this._0k();
         this._0ab();
         this._0V_q();
         this._6g();
         this.startup._T_y(_1X_b,-1000);
         this.startup._T_y(_1aw,-999);
         this.startup._1rF_(_E_h);
         this.context._1za._1dl(this.init);
      }
      
      private function _0h4() : void
      {
         this._T_X_.map(Client).asSingleton();
         this._T_X_.map(_f0).asSingleton();
         this._T_X_.map(_1K_N_).asSingleton();
         this._T_X_.map(_19G_).asSingleton();
      }
      
      private function _0k() : void
      {
         this._1S_M_.map(_1X_b).toCommand(_0S_5);
         this._1S_M_.map(_1aw).toCommand(_rG_);
         this._1S_M_.map(_1yM_).toCommand(_J_x);
         this._1S_M_.map(_0V_s).toCommand(_0N_Y_);
         this._1S_M_.map(_kc).toCommand(_0gJ_);
         this._1S_M_.map(_1U_z).toCommand(_1vA_);
         this._1S_M_.map(_0mO_).toCommand(_I_b);
         this._1S_M_.map(_Q_G_).toCommand(_1F_y);
         this._1S_M_.map(_Q_G_).toCommand(_0Y_7);
         this._1S_M_.map(_W_O_).toCommand(_S_j);
         this._1S_M_.map(_W_O_).toCommand(_0hn);
      }
      
      private function _0ab() : void
      {
         this._T_X_.map(_yx)._015(_0gb);
         this._T_X_.map(_114).asSingleton();
         this._T_X_.map(PurchaseCharacterClassTask);
         this._T_X_.map(_1N_c);
         this._T_X_.map(_6).asSingleton();
         this._T_X_.map(_E_h);
      }
      
      private function _0V_q() : void
      {
         this._T_X_.map(_0es).asSingleton();
         this._T_X_.map(_1S_b).asSingleton();
         this._T_X_.map(_Z_c).asSingleton();
         this._T_X_.map(_q6).asSingleton();
         this._T_X_.map(_1K_2).asSingleton();
         this._T_X_.map(_1pn).asSingleton();
         this._T_X_.map(_ws).asSingleton();
         this._T_X_.map(_0tI_).asSingleton();
      }
      
      private function _6g() : void
      {
         this.mediatorMap.map(_1X_U_).toMediator(_1qG_);
         this.mediatorMap.map(_Y_5).toMediator(_T_u);
      }
      
      private function init() : void
      {
         this.mediatorMap._0M_D_(this._0ki);
         this._H_u = new _jE_();
         this._T_X_.map(_jE_)._1as(this._H_u);
         this._0ki.addChild(this._H_u);
      }
   }
}
