package _P_N_
{
   import _P_S_.Mediator;
   import _3b.DialogSignalNoDim;
   import _1F_z._07p;
   
   public class _0__V_ extends Mediator
   {
       
      
      [Inject]
      public var view:_P_N_._0at;
      
      [Inject]
      public var _06Z_:DialogSignalNoDim;
      
      [Inject]
      public var _12P_:_07p;
      
      public function _0__V_()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.view._1D_r.clicked.addOnce(this._qN_);
      }
      
      private function _qN_() : void
      {
         this._06Z_.dispatch(new this._12P_.caller());
      }
   }
}
