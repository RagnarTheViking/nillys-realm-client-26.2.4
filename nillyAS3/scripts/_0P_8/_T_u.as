package _0P_8
{
   import _P_S_.Mediator;
   import _1R_o._Y_5;
   import _1T_4._q6;
   import _1T_4._1K_2;
   
   public class _T_u extends Mediator
   {
       
      
      [Inject]
      public var view:_Y_5;
      
      [Inject]
      public var showToolTip:_q6;
      
      [Inject]
      public var _0ee:_1K_2;
      
      public function _T_u()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.view._0A_A_(this.showToolTip);
         this.view._0hm(this._0ee);
      }
   }
}
