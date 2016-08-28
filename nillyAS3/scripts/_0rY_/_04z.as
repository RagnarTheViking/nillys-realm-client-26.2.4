package _0rY_
{
   import _1__8.IConfig;
   import _wi.Injector;
   import _V_y.ISignalCommandMap;
   import _S_U_._1yd;
   import _2l.ClientSettings;
   import _03U_._51;
   import _03U_._1__x;
   import _03U_._1U_N_;
   import _03U_._1p__;
   import _X_m._r4;
   import _1R_m._sc;
   import _1R_m._2G_;
   import _1R_m._1H_h;
   import _1R_m._1F_7;
   import _1R_m._0X_e;
   import _1R_m._0bT_;
   
   public class _04z implements IConfig
   {
       
      
      [Inject]
      public var _T_X_:Injector;
      
      [Inject]
      public var _1S_M_:ISignalCommandMap;
      
      [Inject]
      public var startup:_1yd;
      
      [Inject]
      public var _0rv:ClientSettings;
      
      public function _04z()
      {
         super();
      }
      
      public function configure() : void
      {
         this._T_X_.map(_51)._1as(new _1__x());
         this._T_X_.map(_1U_N_)._015(_1p__);
         this._T_X_.map(_r4);
         this.startup._1rF_(_r4,-999);
         this._1S_M_.map(_sc).toCommand(_2G_);
         this._1S_M_.map(_1H_h).toCommand(_1F_7);
         this._1S_M_.map(_0X_e).toCommand(_0bT_);
         this._1K_1();
      }
      
      private function _1K_1() : void
      {
         this._T_X_.getInstance(_0X_e).dispatch();
      }
   }
}
