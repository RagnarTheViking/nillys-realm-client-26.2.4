package _w8
{
   import _1__8.IConfig;
   import _1__8._1Q_O_;
   import _wi.Injector;
   import _0f.IMediatorMap;
   import _V_y.ISignalCommandMap;
   import _S_U_._1yd;
   import _1E_7._00G_;
   import _1E_7._7p;
   import _1E_7._0zq;
   import _1C_p.News;
   import _0H_A_._0T_c;
   import _bv._1gT_;
   import _bv._V_b;
   import _bv._aN_;
   import _bv._00a;
   import _1S_e.NewsDisplay;
   import _bv._0na;
   import _bv.AnnounceDisplay;
   import _bv._nx;
   
   public class _zK_ implements IConfig
   {
       
      
      [Inject]
      public var context:_1Q_O_;
      
      [Inject]
      public var _T_X_:Injector;
      
      [Inject]
      public var mediatorMap:IMediatorMap;
      
      [Inject]
      public var _1S_M_:ISignalCommandMap;
      
      [Inject]
      public var _0F_m:_1yd;
      
      public function _zK_()
      {
         super();
      }
      
      public function configure() : void
      {
         this._T_X_.map(_00G_).asSingleton();
         this._T_X_.map(_7p).asSingleton();
         this._T_X_.map(_0zq).asSingleton();
         this._T_X_.map(News).asSingleton();
         this._T_X_.map(_0T_c).asSingleton();
         this.mediatorMap.map(_1gT_).toMediator(_V_b);
         this.mediatorMap.map(_aN_).toMediator(_00a);
         this.mediatorMap.map(NewsDisplay).toMediator(_0na);
         this.mediatorMap.map(AnnounceDisplay).toMediator(_nx);
         this._0F_m._1rF_(_0T_c);
      }
   }
}
