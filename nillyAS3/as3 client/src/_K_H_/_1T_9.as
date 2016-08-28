package _K_H_
{
   import _4u._0dl;
   import _0R_R_._1D_F_;
   import _0pN_._114;
   import _Z_U_._117;
   import _0pn._co;
   
   public class _1T_9
   {
       
      
      [Inject]
      public var data:_0dl;
      
      [Inject]
      public var _0pM_:_1D_F_;
      
      [Inject]
      public var _0rU_:_114;
      
      [Inject]
      public var model:_117;
      
      [Inject]
      public var init:_co;
      
      public function _1T_9()
      {
         super();
      }
      
      public function execute() : void
      {
         this._0rU_.add(this._0pM_);
         this._0pM_.start();
         this.model._07M_();
         this.init.dispatch();
      }
   }
}
