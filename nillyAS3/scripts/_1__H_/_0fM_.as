package _1__H_
{
   import _P_S_.Mediator;
   import _1F_z._0P_4;
   import _1F_z._07p;
   import _3b.DialogSignal;
   import _0l7._1ba;
   import _0l7._0G_y;
   import _wi.Injector;
   import _1F_z._1Z_D_;
   import _P_N_._0at;
   import _7m.ObjectSlot;
   import _1F_z._1Y_x;
   import Packets.PetYardCommand;
   
   public class _0fM_ extends Mediator
   {
       
      
      [Inject]
      public var view:_1__H_._1O_8;
      
      [Inject]
      public var _0xI_:_0P_4;
      
      [Inject]
      public var _12P_:_07p;
      
      [Inject]
      public var _06Z_:DialogSignal;
      
      [Inject]
      public var _0F_C_:_1ba;
      
      [Inject]
      public var _0Y_s:_0G_y;
      
      [Inject]
      public var _T_X_:Injector;
      
      public function _0fM_()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.view.init();
         var _loc1_:_1Z_D_ = !!this._12P_._05k?this._12P_._05k:this._0xI_._0T_T_();
         this.view._1Q_5(!!_loc1_?_loc1_._0qB_:null,!!_loc1_?int(_loc1_._0he()):0);
         this.view._0__W_.add(this._19);
         this.view.closed.add(this._qN_);
         this.view._0T_P_.add(this._0Q_T_);
         this.view._I_G_.add(this._n3);
         this._0F_C_.add(this._z5);
      }
      
      private function _z5() : void
      {
         this.view._kC_();
      }
      
      override public function destroy() : void
      {
         this.view._0__W_.remove(this._19);
         this.view._0T_P_.remove(this._0Q_T_);
         this.view._I_G_.remove(this._n3);
      }
      
      private function _qN_() : void
      {
         this._12P_.clear();
         this.view.closed.remove(this._qN_);
      }
      
      private function _19() : void
      {
         this._12P_.caller = _1__H_._1O_8;
         this._06Z_.dispatch(this._T_X_.getInstance(_0at));
      }
      
      private function _0Q_T_(param1:int) : void
      {
         var _loc2_:ObjectSlot = null;
         _loc2_ = new ObjectSlot();
         _loc2_.objectId_ = this._12P_._1sB_;
         _loc2_.objectType_ = this._12P_._0hj;
         _loc2_.slotId = this._12P_._0E_K_;
         var _loc3_:_1Y_x = new _1Y_x(this._12P_._05k._0__5(),_loc2_,PetYardCommand._0E_O_);
         this._0Y_s.dispatch(_loc3_);
      }
      
      private function _n3(param1:int) : void
      {
         var _loc2_:ObjectSlot = new ObjectSlot();
         _loc2_.objectId_ = this._12P_._1sB_;
         _loc2_.objectType_ = this._12P_._0hj;
         _loc2_.slotId = this._12P_._0E_K_;
         var _loc3_:_1Y_x = new _1Y_x(this._12P_._05k._0__5(),_loc2_,PetYardCommand._1H_Y_);
         this._0Y_s.dispatch(_loc3_);
      }
   }
}
