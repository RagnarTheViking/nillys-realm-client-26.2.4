package _G_Z_
{
   import _0H_w._6;
   import _0H_w._1P_e;
   
   public class _J_x
   {
       
      
      [Inject]
      public var analytics:_6;
      
      [Inject]
      public var _W_d:_1P_e;
      
      public function _J_x()
      {
         super();
      }
      
      public function execute() : void
      {
         this.analytics.trackEvent(this._W_d.category,this._W_d._19E_,this._W_d.label,this._W_d.value);
      }
   }
}
