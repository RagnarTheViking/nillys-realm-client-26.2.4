package _F_f
{
   import _1__8.IConfig;
   import _wi.Injector;
   import _V_y.ISignalCommandMap;
   import _0f.IMediatorMap;
   import _04e._05X_;
   import _1ud._J_U_;
   import _1ud._1D_q;
   import _1ud._1Q_Y_;
   import _1ud._jB_;
   import _1ud._08e;
   import _1ud._fv;
   import _1ud._0rV_;
   import _1ud._0H_T_;
   import com.company.assembleegameclient.game.GameSprite;
   import _w1._0fW_;
   import _w1.ZombifyDialog;
   import _w1._10r;
   
   public class _vu implements IConfig
   {
       
      
      [Inject]
      public var _T_X_:Injector;
      
      [Inject]
      public var _1S_M_:ISignalCommandMap;
      
      [Inject]
      public var mediatorMap:IMediatorMap;
      
      public function _vu()
      {
         super();
      }
      
      public function configure() : void
      {
         this._T_X_.map(_05X_).asSingleton();
         this._1S_M_.map(_J_U_).toCommand(_1D_q);
         this._1S_M_.map(_1Q_Y_).toCommand(_jB_);
         this._1S_M_.map(_08e).toCommand(_fv);
         this._1S_M_.map(_0rV_).toCommand(_0H_T_);
         this.mediatorMap.map(GameSprite).toMediator(_0fW_);
         this.mediatorMap.map(ZombifyDialog).toMediator(_10r);
      }
   }
}
