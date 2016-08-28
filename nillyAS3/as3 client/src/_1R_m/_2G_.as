package _1R_m
{
   import _1T_4._kc;
   import _1T_4._1U_z;
   import _3b.CloseDialogsSignal;
   import _v4._1K_N_;
   import _05g.TitleView;
   
   public class _2G_
   {
       
      
      [Inject]
      public var _11v:_kc;
      
      [Inject]
      public var _kU_:_1U_z;
      
      [Inject]
      public var closeDialogs:CloseDialogsSignal;
      
      [Inject]
      public var _1o7:_1K_N_;
      
      public function _2G_()
      {
         super();
      }
      
      public function execute() : void
      {
         var _loc1_:Class = this._1o7._1Z_z() || TitleView;
         this._11v.dispatch();
         this.closeDialogs.dispatch();
         this._kU_.dispatch(new _loc1_());
      }
   }
}
