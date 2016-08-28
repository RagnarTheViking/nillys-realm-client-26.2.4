package _05g
{
   import _P_S_.Mediator;
   import _K_r._1C_w;
   import _K_r._1x1;
   import _0jo._1Y_r;
   import _S_b._0jn;
   
   public class _0pv extends Mediator
   {
       
      
      [Inject]
      public var view:_05g._L_D_;
      
      [Inject]
      public var _1A_N_:_1C_w;
      
      [Inject]
      public var _0nL_:_1x1;
      
      [Inject]
      public var _0R_S_:_1Y_r;
      
      public function _0pv()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this._1A_N_.add(this._T_1);
         this._0nL_.add(this._1aI_);
         this._0R_S_.add(this._1u1);
      }
      
      override public function destroy() : void
      {
         this._1A_N_.remove(this._T_1);
         this._0nL_.remove(this._1aI_);
         this._0R_S_.remove(this._1u1);
      }
      
      private function _T_1(param1:_0jn) : void
      {
         this.view._1A_N_(param1);
      }
      
      private function _1aI_(param1:_0jn) : void
      {
         this.view._0nL_(param1);
      }
      
      private function _1u1() : void
      {
         this.view.parent.removeChild(this.view);
      }
   }
}
