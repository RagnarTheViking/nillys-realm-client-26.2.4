package _1uA_
{
   import _1__8.IConfig;
   import _1__8._1Q_O_;
   import _2l.ClientSettings;
   import _wi.Injector;
   import _aW_._K_Y_;
   import _0rQ_._Z_W_;
   import _0rQ_.AppEngineRequestStats;
   import _0rQ_._0H_t;
   import _aW_.IWebRequest;
   import _0rQ_._F_a;
   import _0rQ_._1Q_r;
   
   public class _0pa implements IConfig
   {
       
      
      private const _vO_:Boolean = true;
      
      [Inject]
      public var context:_1Q_O_;
      
      [Inject]
      public var setup:ClientSettings;
      
      [Inject]
      public var _T_X_:Injector;
      
      public function _0pa()
      {
         super();
      }
      
      public function configure() : void
      {
         this._08U_();
         if(this.setup._1S_x())
         {
            this._1xs();
         }
         else if(this._vO_)
         {
            this._1J_w();
         }
         else
         {
            this._kB_();
         }
      }
      
      private function _08U_() : void
      {
         this._T_X_.map(_K_Y_)._0L_2(_Z_W_);
      }
      
      private function _1xs() : void
      {
         this._T_X_.map(AppEngineRequestStats).asSingleton();
         this._T_X_.map(_0H_t);
         this._T_X_.map(IWebRequest)._0L_2(_F_a);
      }
      
      private function _1J_w() : void
      {
         this._T_X_.map(_0H_t);
         this._T_X_.map(IWebRequest)._0L_2(_1Q_r);
      }
      
      private function _kB_() : void
      {
         this._T_X_.map(IWebRequest)._0L_2(_0H_t);
      }
   }
}
