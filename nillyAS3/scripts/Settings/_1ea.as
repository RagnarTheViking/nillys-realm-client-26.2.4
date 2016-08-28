package Settings
{
   import _1__8.IConfig;
   import _wi.Injector;
   import flash.display.DisplayObjectContainer;
   import _14k._1dB_;
   import flash.display.LoaderInfo;
   import _12g._mJ_;
   import _2l.ClientSettings;
   import _2l._0gv;
   import _12g._1T_d;
   import _14k._1E_K_;
   import _0gX_._gw;
   import _0gX_._P_G_;
   import _0gX_._k6;
   import _0gX_._ft;
   import _0gX_.ProductionSettings;
   import _0gX_._oD_;
   
   public class _1ea implements IConfig
   {
       
      
      [Inject]
      public var _T_X_:Injector;
      
      [Inject]
      public var root:DisplayObjectContainer;
      
      [Inject]
      public var data:_1dB_;
      
      [Inject]
      public var loaderInfo:LoaderInfo;
      
      [Inject]
      public var _1xY_:_mJ_;
      
      public function _1ea()
      {
         super();
      }
      
      public function configure() : void
      {
         var _loc1_:ClientSettings = this._0dg();
         this._T_X_.map(_0gv)._1as(_loc1_);
         this._T_X_.map(ClientSettings)._1as(_loc1_);
         this._T_X_.map(_1T_d).asSingleton();
      }
      
      private function _0dg() : ClientSettings
      {
         var _loc1_:_1E_K_ = this.data._1hs();
         switch(_loc1_)
         {
            case _1E_K_._1us:
               return new _gw();
            case _1E_K_._1ml:
               return this._kD_();
            case _1E_K_._1hd:
               return new _P_G_();
            case _1E_K_._04W_:
               return new _k6();
            case _1E_K_.TESTING2:
               return new _ft();
            default:
               return new ProductionSettings();
         }
      }
      
      private function _kD_() : _oD_
      {
         return new _oD_().setAddress(this.data._1P_Z_());
      }
   }
}
