package _1xk
{
   import _1__8.IConfig;
   import _1__8._1Q_O_;
   import _wi.Injector;
   import _0f.IMediatorMap;
   import _V_y.ISignalCommandMap;
   import _0E_T_._1zi;
   import _A_4._1r;
   import _1to._0I_;
   import _0fP_._1E_3;
   import _A_4.CharacterSkinListItem;
   import _A_4._1dm;
   import _A_4._zp;
   import _A_4._ay;
   import _A_4._P_8;
   import _A_4._1T___;
   import _A_4.ClassDetailView;
   import _A_4._D_c;
   import _m2._xU_;
   import _1to._0M_0;
   import _m2._W_O_;
   import _1to._uQ_;
   import _1to._0dA_;
   import _1to._0tW_;
   import _1T_4._Q_G_;
   import _1to._0hd;
   import _1to._08r;
   import _1to._P_H_;
   import _1u0._12c;
   import kabam.rotmg.assets.EmbeddedData;
   
   public class _uW_ implements IConfig
   {
       
      
      [Inject]
      public var context:_1Q_O_;
      
      [Inject]
      public var _T_X_:Injector;
      
      [Inject]
      public var mediatorMap:IMediatorMap;
      
      [Inject]
      public var _1S_M_:ISignalCommandMap;
      
      public function _uW_()
      {
         super();
      }
      
      public function configure() : void
      {
         this._T_X_.map(_1zi).asSingleton();
         this._T_X_.map(_1r).asSingleton();
         this._T_X_.map(_0I_).asSingleton();
         this._T_X_.map(_1E_3);
         this.mediatorMap.map(CharacterSkinListItem).toMediator(_1dm);
         this.mediatorMap.map(_zp).toMediator(_ay);
         this.mediatorMap.map(_P_8).toMediator(_1T___);
         this.mediatorMap.map(ClassDetailView).toMediator(_D_c);
         this._1S_M_.map(_xU_).toCommand(_0M_0);
         this._1S_M_.map(_W_O_).toCommand(_uQ_);
         this._1S_M_.map(_0dA_).toCommand(_0tW_);
         this._1S_M_.map(_Q_G_).toCommand(_0hd);
         this._1S_M_.map(_08r).toCommand(_P_H_)._1qt(_12c);
         this.context._1za._1dl(this.init);
      }
      
      private function init() : void
      {
         var _loc1_:XML = XML(new EmbeddedData.PlayersCXML());
         var _loc2_:_0dA_ = this._T_X_.getInstance(_0dA_);
         _loc2_.dispatch(_loc1_);
      }
   }
}
