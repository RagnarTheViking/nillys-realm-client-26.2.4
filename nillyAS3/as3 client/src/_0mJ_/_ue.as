package _0mJ_
{
   import _P_S_.Mediator;
   import _0Z_d._0D_M_;
   import _0Z_d._ee;
   import _0Z_d._3g;
   import _0W_0._0z;
   import Packets.Server.MapInfo;
   
   public class _ue extends Mediator
   {
       
      
      [Inject]
      public var view:_0mJ_._0A_P_;
      
      [Inject]
      public var _0fu:_0D_M_;
      
      [Inject]
      public var _1kR_:_ee;
      
      [Inject]
      public var _E_7:_3g;
      
      [Inject]
      public var _0E_B_:_0z;
      
      public function _ue()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.view._15a(this._0E_B_.make());
         this._0fu.addOnce(this._gJ_);
         this._1kR_.add(this._C_l);
         this._E_7.add(this._1R_P_);
      }
      
      private function _gJ_(param1:MapInfo) : void
      {
         this.view._1io(param1._kF_,param1._16n);
      }
      
      override public function destroy() : void
      {
         this._1kR_.remove(this._C_l);
      }
      
      private function _C_l() : void
      {
         this.view.disable();
      }
      
      private function _1R_P_() : void
      {
         this.view._1C_m();
      }
   }
}
