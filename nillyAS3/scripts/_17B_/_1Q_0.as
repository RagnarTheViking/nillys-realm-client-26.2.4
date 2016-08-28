package _17B_
{
   import _P_S_.Mediator;
   import _1F_z._0P_4;
   
   public class _1Q_0 extends Mediator
   {
       
      
      [Inject]
      public var view:_17B_._F_r;
      
      [Inject]
      public var model:_0P_4;
      
      public function _1Q_0()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.view.init(this.model._0T_T_());
      }
      
      override public function destroy() : void
      {
      }
   }
}
