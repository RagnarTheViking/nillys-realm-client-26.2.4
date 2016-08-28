package _0A_B_
{
   import _0E_n._jE_;
   import _0oY_._1O_a;
   import _zx._L_s;
   
   public class _0V_A_
   {
       
      
      [Inject]
      public var _H_u:_jE_;
      
      [Inject]
      public var view:_1O_a;
      
      [Inject]
      public var model:_L_s;
      
      public function _0V_A_()
      {
         super();
      }
      
      public function execute() : void
      {
         this.view._pI_(this.model._1pJ_());
         this._H_u._vj.addChild(this.view);
      }
   }
}
