package _05g
{
   import _P_S_.Mediator;
   import _0S_w._rn;
   import _v4.Client;
   import _0hJ_._Z___;
   
   public class _1s6 extends Mediator
   {
       
      
      [Inject]
      public var view:_rn;
      
      [Inject]
      public var model:Client;
      
      [Inject]
      public var servers:_Z___;
      
      public function _1s6()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.view.initialize(this.model,this.servers._J_i());
      }
   }
}
