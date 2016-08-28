package _1gF_
{
   import _P_S_.Mediator;
   import com.company.ui._0H_R_;
   import _C_._0C_J_;
   
   public class _L_h extends Mediator
   {
       
      
      [Inject]
      public var view:_0H_R_;
      
      [Inject]
      public var model:_0C_J_;
      
      public function _L_h()
      {
         super();
      }
      
      override public function initialize() : void
      {
         var _loc1_:String = this.model._7X_().getName();
         this.view._J_(_loc1_);
      }
   }
}
