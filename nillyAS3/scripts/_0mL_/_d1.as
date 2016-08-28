package _0mL_
{
   import _P_S_.Mediator;
   import _0bE_._1Y_;
   import _0E_n._jE_;
   
   public class _d1 extends Mediator
   {
       
      
      [Inject]
      public var view:_1Y_;
      
      [Inject]
      public var _H_u:_jE_;
      
      public function _d1()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.view._pn = this._H_u.top;
      }
   }
}
