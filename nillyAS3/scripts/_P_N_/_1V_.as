package _P_N_
{
   import _P_S_.Mediator;
   import _1F_z._0P_4;
   import _17B_._0o;
   import _1F_z._07p;
   import _3b.DialogSignalNoDim;
   import _1F_z._1Z_D_;
   
   public class _1V_ extends Mediator
   {
       
      
      [Inject]
      public var view:_P_N_.PetPicker;
      
      [Inject]
      public var model:_0P_4;
      
      [Inject]
      public var _3q:_0o;
      
      [Inject]
      public var _12P_:_07p;
      
      [Inject]
      public var _06Z_:DialogSignalNoDim;
      
      public function _1V_()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.view._fb(this.model._0lX_());
         var _loc1_:_1Z_D_ = this._12P_.selected == _07p.LEFT?this._12P_._0Y_p:this._12P_._05k;
         if(_loc1_)
         {
            this.view._1Y_7(_loc1_);
         }
         this._12P_._0Y_p && this.view._04P_(this._12P_._0Y_p);
         this._12P_._05k && this.view._04P_(this._12P_._05k);
         this.view._132.addOnce(this._bF_);
      }
      
      private function _bF_(param1:_1Z_D_) : void
      {
         if(this._12P_.selected == _07p.LEFT)
         {
            this._12P_._05k = param1;
         }
         else
         {
            this._12P_._0Y_p = param1;
         }
         this._06Z_.dispatch(new this._12P_.caller());
      }
   }
}
