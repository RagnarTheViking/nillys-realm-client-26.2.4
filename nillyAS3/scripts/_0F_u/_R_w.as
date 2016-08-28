package _0F_u
{
   import _1__8.IConfig;
   import _wi.Injector;
   import _0f.IMediatorMap;
   import _V_y.ISignalCommandMap;
   import _S_U_._1yd;
   import _1y1._al;
   import _0pn._gF_;
   import _1y1._I_Y_;
   import _0C_j.PackageButton;
   import _0C_j._1cy;
   import _0C_j.PackageOfferDialog;
   import _0C_j._0O_g;
   import _0C_j._ze;
   import _0C_j._0V_z;
   import _4g._0zQ_;
   import _4g._1vC_;
   import _0pn._q0;
   import _0pn._1A_M_;
   import _0pn._0bY_;
   import _0pn._05b;
   import _0pn._1vl;
   import _0pn._17T_;
   import _0pn._1I_8;
   import _0pn._co;
   import _0pn._0P_t;
   import _0pn._1R_l;
   import _0pn._0Y_Q_;
   
   public class _R_w implements IConfig
   {
       
      
      [Inject]
      public var _T_X_:Injector;
      
      [Inject]
      public var mediatorMap:IMediatorMap;
      
      [Inject]
      public var _1S_M_:ISignalCommandMap;
      
      [Inject]
      public var _0p9:_1yd;
      
      public function _R_w()
      {
         super();
      }
      
      public function configure() : void
      {
         this._T_X_.map(_al).asSingleton();
         this._T_X_.map(_gF_).asSingleton();
         this._T_X_.map(_I_Y_);
         this.mediatorMap.map(PackageButton).toMediator(_1cy);
         this.mediatorMap.map(PackageOfferDialog).toMediator(_0O_g);
         this.mediatorMap.map(_ze).toMediator(_0V_z);
         this.mediatorMap.map(_0zQ_).toMediator(_1vC_);
         this._1S_M_.map(_q0).toCommand(_1A_M_)._1qt(_0x7,_0bY_);
         this._1S_M_.map(_05b).toCommand(_1vl);
         this._1S_M_.map(_17T_).toCommand(_1I_8);
         this._1S_M_.map(_co).toCommand(_0P_t);
         this._1S_M_.map(_1R_l).toCommand(_0Y_Q_);
         this._0p9._1rF_(_I_Y_);
      }
   }
}
