package _1__H_
{
   import _P_S_.Mediator;
   import _3b.DialogSignal;
   import _1F_z._07p;
   import _0l7._0G_y;
   import _wi.Injector;
   import _P_N_._0at;
   import _1F_z._1K_e;
   import Packets.PetYardCommand;
   import _1O_R_.ErrorDialog;
   
   public class _0gG_ extends Mediator
   {
       
      
      private const _L_m:String = "Pets.fuseError";
      
      [Inject]
      public var view:_1__H_._0vs;
      
      [Inject]
      public var _06Z_:DialogSignal;
      
      [Inject]
      public var _12P_:_07p;
      
      [Inject]
      public var _0Y_s:_0G_y;
      
      [Inject]
      public var _T_X_:Injector;
      
      public function _0gG_()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.view.init(this._12P_);
         this.view._0__W_.add(this._19);
         this.view._0T_P_.add(this._0Q_T_);
         this.view._I_G_.add(this._n3);
         this.view.closed.addOnce(this._qN_);
      }
      
      override public function destroy() : void
      {
         this.view._0__W_.remove(this._19);
         this.view._0T_P_.remove(this._0Q_T_);
         this.view._I_G_.remove(this._n3);
      }
      
      private function _19(param1:String) : void
      {
         this._12P_.caller = _1__H_._0vs;
         this._12P_.selected = param1;
         this._06Z_.dispatch(this._T_X_.getInstance(_0at));
      }
      
      private function _n3(param1:int) : void
      {
         var _loc2_:_1K_e = null;
         if(this._12P_._wo())
         {
            _loc2_ = new _1K_e(this._12P_._05k._0__5(),this._12P_._0Y_p._0__5(),PetYardCommand._1H_Y_);
            this._qN_();
            this._0Y_s.dispatch(_loc2_);
         }
         else
         {
            this._06Z_.dispatch(new ErrorDialog(this._L_m));
         }
      }
      
      private function _0Q_T_(param1:int) : void
      {
         var _loc2_:_1K_e = null;
         if(this._12P_._wo())
         {
            _loc2_ = new _1K_e(this._12P_._05k._0__5(),this._12P_._0Y_p._0__5(),PetYardCommand._0E_O_);
            this._qN_();
            this._0Y_s.dispatch(_loc2_);
         }
         else
         {
            this._06Z_.dispatch(new ErrorDialog(this._L_m));
         }
      }
      
      private function _qN_() : void
      {
         this._12P_.clear();
      }
   }
}
