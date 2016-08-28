package _M_3
{
   import _1__8.IConfig;
   import _1__8._1Q_O_;
   import _wi.Injector;
   import _V_y.ISignalCommandMap;
   import _0f.IMediatorMap;
   import _0O_N_._1uf;
   import _0O_N_._gf;
   import _0O_N_._lo;
   import com.company.assembleegameclient.game.GameSprite;
   import _0U_q._0pQ_;
   import _f7.Signal;
   
   public class _0lw implements IConfig
   {
       
      
      [Inject]
      public var context:_1Q_O_;
      
      [Inject]
      public var _T_X_:Injector;
      
      [Inject]
      public var _1S_M_:ISignalCommandMap;
      
      [Inject]
      public var mediatorMap:IMediatorMap;
      
      public function _0lw()
      {
         super();
      }
      
      public function configure() : void
      {
         this._T_X_.map(_1uf).asSingleton();
         this._1S_M_.map(_gf).toCommand(_lo);
         this.mediatorMap.map(GameSprite).toMediator(_0pQ_);
         this.context._1za._1dl(this.init);
      }
      
      private function init() : void
      {
         Signal(this._T_X_.getInstance(_gf)).dispatch();
      }
   }
}
