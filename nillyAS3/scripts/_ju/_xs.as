package _ju
{
   import _P_S_.Mediator;
   import _S_b._O_e;
   import _K_r._1V_v;
   import _ge._I_I_;
   import _0jo._1D_h;
   import _1F_z._07p;
   import com.company.assembleegameclient.objects.Player;
   import _S_b._1gV_;
   import flash.display.DisplayObject;
   import _1H_T_._S_A_;
   import com.company.assembleegameclient.util._P_K_;
   import com.company.assembleegameclient.map.Map;
   import _4Z_._6z;
   import com.company.assembleegameclient.parameters.Parameters;
   import Packets.PacketManagerBase;
   import _1pm._0P_M_;
   import _ge._0g0;
   
   public class _xs extends Mediator
   {
       
      
      [Inject]
      public var view:_ju._0j1;
      
      [Inject]
      public var _1tf:_O_e;
      
      [Inject]
      public var _E_:_1V_v;
      
      [Inject]
      public var _B_s:_I_I_;
      
      [Inject]
      public var _Y_h:_1D_h;
      
      [Inject]
      public var _12P_:_07p;
      
      private var _0G_H_:Boolean = false;
      
      public function _xs()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this._E_.addOnce(this._0C_l);
         this.view._1N_O_.add(this._1oM_);
         this.view._0N_u.add(this._1pg);
         this._E_.add(this.update);
      }
      
      override public function destroy() : void
      {
         this.view._1N_O_.remove(this._1oM_);
         this.view._0N_u.remove(this._1pg);
         this._E_.remove(this.update);
      }
      
      private function _0C_l(param1:Player) : void
      {
         var _loc2_:_1gV_ = this._B_s._0I___[this.view.position];
         var _loc3_:int = param1.getPotionCount(_loc2_.objectId);
         this.view._do(_loc3_,_loc2_._3v(_loc3_),_loc2_.available,_loc2_.objectId);
      }
      
      private function update(param1:Player) : void
      {
         var _loc2_:_1gV_ = null;
         var _loc3_:int = 0;
         if((this.view.objectType == _I_I_._1__7 || this.view.objectType == _I_I_._11C_) && !this._0G_H_)
         {
            _loc2_ = this._B_s._3l(this.view.objectType);
            _loc3_ = param1.getPotionCount(_loc2_.objectId);
            this.view._do(_loc3_,_loc2_._3v(_loc3_),_loc2_.available);
         }
      }
      
      private function _1oM_(param1:DisplayObject) : void
      {
         var _loc2_:_S_A_ = null;
         var _loc3_:Player = this._1tf._14O_.map.player_;
         var _loc4_:* = _P_K_._0Z_w(param1,_S_A_,Map,_6z);
         if(_loc4_ is Map || Parameters.hwAccel() && _loc4_ == null)
         {
            PacketManagerBase.instance.invDrop(_loc3_,_I_I_._Y_H_(this.view.objectType),this.view.objectType);
         }
         else if(_loc4_ is _S_A_)
         {
            _loc2_ = _loc4_ as _S_A_;
            if(_loc2_.getItemId() == _0P_M_._F_p && _loc2_._0E_6.owner != _loc3_)
            {
               PacketManagerBase.instance.invSwapPotion(_loc3_,_loc3_,_I_I_._Y_H_(this.view.objectType),this.view.objectType,_loc2_._0E_6.owner,_loc2_.slotId,_0P_M_._F_p);
            }
         }
      }
      
      private function _1pg() : void
      {
         var _loc1_:_0g0 = null;
         var _loc2_:_1gV_ = this._B_s._0I___[this.view.position];
         if(_loc2_.available)
         {
            _loc1_ = new _0g0(_loc2_.objectId,_0g0._eC_);
            this._Y_h.dispatch(_loc1_);
         }
      }
   }
}
