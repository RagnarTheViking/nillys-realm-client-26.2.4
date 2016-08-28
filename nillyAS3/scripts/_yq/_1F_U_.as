package _yq
{
   import _1__8.IConfig;
   import _wi.Injector;
   import _0f.IMediatorMap;
   import _2l.ClientSettings;
   import _C_._0C_J_;
   import _1gF_._1n;
   import _wk._zN_;
   import com.company.ui._0H_R_;
   import _1gF_._L_h;
   import _1gF_._0ke;
   import _C_._Q_E_;
   import _0rY_._19o;
   import _C_._1eM_;
   
   public class _1F_U_ implements IConfig
   {
       
      
      [Inject]
      public var _T_X_:Injector;
      
      [Inject]
      public var mediatorMap:IMediatorMap;
      
      [Inject]
      public var _0rv:ClientSettings;
      
      public function _1F_U_()
      {
         super();
      }
      
      public function configure() : void
      {
         this._T_X_.map(_0C_J_).asSingleton();
         this._0X_2();
         this.mediatorMap.map(_1n).toMediator(_zN_);
         this.mediatorMap.map(_0H_R_).toMediator(_L_h);
         this._T_X_.map(_0ke);
      }
      
      private function _0X_2() : void
      {
         if(this._0rv._17w())
         {
            this._T_X_.map(_Q_E_)._0L_2(_19o);
         }
         else
         {
            this._T_X_.map(_Q_E_)._015(_1eM_);
         }
      }
   }
}
