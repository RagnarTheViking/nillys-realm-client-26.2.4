package _1ka
{
   import _1__8.IConfig;
   import flash.display.DisplayObjectContainer;
   import _wi.Injector;
   import _V_y.ISignalCommandMap;
   import _0f.IMediatorMap;
   import _1__8._1Q_O_;
   import flash.display.LoaderInfo;
   import _1__8._19A_;
   import _1T_4._34;
   import _m2._1N_l;
   import _0R_R_._105;
   import _0R_R_._1uC_;
   import _1T_4._0zP_;
   import _1V_8._1ks;
   import _0J_8.MoneyFrame;
   import Frames._K_I_;
   import _K_r._1O_7;
   import _4u._0f6;
   import _1u0._12c;
   import _m2._c;
   import _xc._0ur;
   import _m2._0o9;
   import _xc._ys;
   import _y0._0O_8;
   import _1R_9._case;
   import _1N_W_._0W_j;
   import _0y._0X_B_;
   
   public class _rb implements IConfig
   {
       
      
      [Inject]
      public var root:DisplayObjectContainer;
      
      [Inject]
      public var _T_X_:Injector;
      
      [Inject]
      public var _1S_M_:ISignalCommandMap;
      
      [Inject]
      public var mediatorMap:IMediatorMap;
      
      [Inject]
      public var context:_1Q_O_;
      
      [Inject]
      public var info:LoaderInfo;
      
      [Inject]
      public var _0G_2:_19A_;
      
      public function _rb()
      {
         super();
      }
      
      public function configure() : void
      {
         this._Z_I_();
         this._s4();
         this.context._1za._1dl(this.init);
      }
      
      private function _Z_I_() : void
      {
         this._T_X_.map(_34).asSingleton();
         this._T_X_.map(_1N_l).asSingleton();
         this._T_X_.map(_105);
         this._T_X_.map(_1uC_);
         this._T_X_.map(_0zP_).asSingleton();
         this._T_X_.map(_1ks).asSingleton();
         this.mediatorMap.map(MoneyFrame).toMediator(_K_I_);
         this._1S_M_.map(_1O_7).toCommand(_0f6)._1qt(_12c);
         this._1S_M_.map(_c).toCommand(_0ur);
         this._1S_M_.map(_0o9).toCommand(_ys);
      }
      
      private function _s4() : void
      {
         if(this._zv())
         {
            this.context.configure(_0O_8);
         }
         else if(this._1A_K_())
         {
            this.context.configure(_case);
         }
         else if(this._1jW_())
         {
            this.context.configure(_0W_j);
         }
         else
         {
            this.context.configure(_0X_B_);
         }
      }
      
      private function _zv() : Boolean
      {
         return this.info.parameters.kongregate_api_path != null;
      }
      
      private function _1A_K_() : Boolean
      {
         return this.info.parameters.steam_api_path != null;
      }
      
      private function _1jW_() : Boolean
      {
         return this.info.parameters.kabam_signed_request != null;
      }
      
      private function init() : void
      {
         this._0G_2.info("isKongregate {0}",[this._zv()]);
         this._0G_2.info("isSteam {0}",[this._1A_K_()]);
         this._0G_2.info("isKabam {0}",[this._1jW_()]);
      }
   }
}
