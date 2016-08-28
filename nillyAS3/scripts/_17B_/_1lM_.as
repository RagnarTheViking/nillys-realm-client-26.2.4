package _17B_
{
   import _P_S_.Mediator;
   import _1F_z._0P_4;
   import _3b.DialogSignal;
   import _1F_z._07p;
   
   public class _1lM_ extends Mediator
   {
       
      
      [Inject]
      public var view:_17B_.PetFeeder;
      
      [Inject]
      public var _0xI_:_0P_4;
      
      [Inject]
      public var _06Z_:DialogSignal;
      
      [Inject]
      public var _12P_:_07p;
      
      public function _1lM_()
      {
         super();
      }
      
      override public function initialize() : void
      {
         if(!this._12P_._05k)
         {
            this._12P_._05k = this._0xI_._0T_T_();
         }
         this.view.initialize(this._12P_);
         this.view._0__W_.addOnce(this._0__W_);
      }
      
      private function _0__W_() : void
      {
         this._12P_.selected = _07p.LEFT;
      }
   }
}
