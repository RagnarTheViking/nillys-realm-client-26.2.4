package _R_o
{
   import _P_S_.Mediator;
   import _0sm._17m;
   import _0sm._bK_;
   import _0sm._0sX_;
   import _0sm._S___;
   import _0sm._L_N_;
   import _1cV_._g9;
   import flash.system.System;
   
   public final class _0xm extends Mediator
   {
       
      
      [Inject]
      public var log:_17m;
      
      [Inject]
      public var _M_b:_bK_;
      
      [Inject]
      public var _0S_N_:_0sX_;
      
      [Inject]
      public var clear:_S___;
      
      [Inject]
      public var copy:_L_N_;
      
      [Inject]
      public var view:_R_o._01Y_;
      
      public function _0xm()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.log.add(this._0mW_);
         this._M_b.add(this._1Y_z);
         this._0S_N_.add(this._1Q_L_);
         this.clear.add(this._10G_);
         this.copy.add(this._1pQ_);
      }
      
      override public function destroy() : void
      {
         this.log.remove(this._0mW_);
         this._M_b.remove(this._1Y_z);
         this._0S_N_.remove(this._1Q_L_);
         this.clear.remove(this._10G_);
         this.copy.remove(this._1pQ_);
      }
      
      private function _0mW_(param1:String) : void
      {
         this.view.log(param1);
      }
      
      private function _1Y_z(param1:_g9) : void
      {
         this.view._M_b(param1);
      }
      
      private function _1Q_L_(param1:String) : void
      {
         this.view._0S_N_(param1);
      }
      
      private function _10G_() : void
      {
         this.view.clear();
      }
      
      private function _1pQ_() : void
      {
         System.setClipboard(this.view._1g8());
      }
   }
}
