package Packets.Server
{
   import _wi.Injector;
   import Packets._mz;
   import _1F_z._1Z_D_;
   import _1F_z._0P_4;
   import _0l7._1nt;
   
   public class _0ca
   {
       
      
      [Inject]
      public var _T_X_:Injector;
      
      private var _0jW_:_mz;
      
      private var message:Packets.Server._0Y_g;
      
      private var _aQ_:_1Z_D_;
      
      private var _0qx:_1Z_D_;
      
      public function _0ca()
      {
         super();
      }
      
      public function _0sA_(param1:Packets.Server._0Y_g) : void
      {
         this.message = param1;
         this._0jW_ = new _mz();
         this._1G_2();
         this._K_N_(param1);
         this._et();
      }
      
      private function _1G_2() : void
      {
         var _loc1_:_0P_4 = this._T_X_.getInstance(_0P_4);
         this._aQ_ = _loc1_._0oU_(this.message._13R_);
         this._aQ_._S_E_(this.message._1lF_);
         this._0jW_._aQ_ = this._aQ_;
      }
      
      private function _K_N_(param1:Packets.Server._0Y_g) : void
      {
         this._0qx = _1Z_D_.clone(this._aQ_);
         this._0qx._S_E_(param1._re);
         this._0jW_._0qx = this._0qx;
      }
      
      private function _et() : void
      {
         var _loc1_:_1nt = this._T_X_.getInstance(_1nt);
         _loc1_.dispatch(this._0jW_);
      }
   }
}
