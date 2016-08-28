package _1O_1
{
   import _1__8.IConfig;
   import _wi.Injector;
   import _0f.IMediatorMap;
   import _V_y.ISignalCommandMap;
   import _1kz.ICommandCenter;
   import _na._xP_;
   import _na._1J_1;
   import _04h._1Q_v;
   import _04h._1L_l;
   import _1lY_._1du;
   import _04h._160;
   import _1lY_._1m;
   import _1lY_._0R_K_;
   import _1lY_._0D_i;
   import _1lY_._0uy;
   import _0jo._1Y_r;
   import _1lY_._qs;
   import _1U_P_.ContinueOrQuitDialog;
   import _1U_P_._1i9;
   import _1U_P_._eO_;
   import _1U_P_._0aj;
   import _1U_P_.ArenaQueryPanel;
   import _1U_P_._0vV_;
   import _1U_P_.ArenaLeaderboard;
   import _1U_P_._D_9;
   import _1U_P_.ArenaLeaderboardListItem;
   import _1U_P_._m1;
   import _1U_P_._18w;
   import _1U_P_._10;
   import _1U_P_._02M_;
   import _1U_P_._0T_5;
   import _1U_P_.BattleSummaryDialog;
   import _1U_P_._dz;
   import _1U_P_._08Q_;
   import _1U_P_._e1;
   
   public class _else_ implements IConfig
   {
       
      
      [Inject]
      public var _T_X_:Injector;
      
      [Inject]
      public var mediatorMap:IMediatorMap;
      
      [Inject]
      public var _1S_M_:ISignalCommandMap;
      
      [Inject]
      public var commandCenter:ICommandCenter;
      
      public function _else_()
      {
         super();
      }
      
      public function configure() : void
      {
         this._T_X_.map(_xP_);
         this._T_X_.map(_1J_1);
         this._T_X_.map(_1Q_v).asSingleton();
         this._T_X_.map(_1L_l).asSingleton();
         this._T_X_.map(_1du).asSingleton();
         this._T_X_.map(_160).asSingleton();
         this._1S_M_.map(_1m).toCommand(_0R_K_);
         this._1S_M_.map(_0D_i).toCommand(_0uy);
         this._1S_M_.map(_1Y_r).toCommand(_qs);
         this.mediatorMap.map(ContinueOrQuitDialog).toMediator(_1i9);
         this.mediatorMap.map(_eO_).toMediator(_0aj);
         this.mediatorMap.map(ArenaQueryPanel).toMediator(_0vV_);
         this.mediatorMap.map(ArenaLeaderboard).toMediator(_D_9);
         this.mediatorMap.map(ArenaLeaderboardListItem).toMediator(_m1);
         this.mediatorMap.map(_18w).toMediator(_10);
         this.mediatorMap.map(_02M_).toMediator(_0T_5);
         this.mediatorMap.map(BattleSummaryDialog).toMediator(_dz);
         this.mediatorMap.map(_08Q_).toMediator(_e1);
      }
   }
}
