package _E_o
{
   import _P_S_.Mediator;
   import _1O_n._zL_;
   import _v4._f0;
   import _v4.Client;
   import _ge._I_I_;
   import _S_b._O_e;
   import _S_b._1K_S_;
   import _1T_4._q6;
   import _1F_z._07p;
   import _1H_T_._12U_;
   import ToolTips.ToolTip;
   import _1H_T_._S_A_;
   import _18._15m;
   import _4Z_._6z;
   import _0wX_._L_I_;
   import _F_0.TinkerView;
   import com.company.assembleegameclient.util._P_K_;
   import Market.ui.MarketInventorySlot;
   import Market.ui.MarketCreateOfferScreen;
   import com.company.assembleegameclient.map.Map;
   import Packets.PacketManagerBase;
   import _1pm._0P_M_;
   import com.company.assembleegameclient.objects.OneWayContainer;
   import com.company.assembleegameclient.objects.Container;
   import com.company.assembleegameclient.objects.ObjectLibrary;
   import _1H_T_._0U_J_;
   import _1O_n._1S_u;
   import _1O_n._u0;
   import com.company.assembleegameclient.parameters.Parameters;
   import com.company.assembleegameclient.objects.GameObject;
   import com.company.assembleegameclient.objects.Player;
   
   public class _1D_C_ extends Mediator
   {
       
      
      [Inject]
      public var view:_zL_;
      
      [Inject]
      public var _0X_p:_f0;
      
      [Inject]
      public var _0U_H_:Client;
      
      [Inject]
      public var _B_s:_I_I_;
      
      [Inject]
      public var _1tf:_O_e;
      
      [Inject]
      public var _fS_:_1K_S_;
      
      [Inject]
      public var showToolTip:_q6;
      
      [Inject]
      public var _12P_:_07p;
      
      public function _1D_C_()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.view.addEventListener(_12U_.ITEM_MOVE,this._1hB_);
         this.view.addEventListener(_12U_.ITEM_SHIFT_CLICK,this._1hF_);
         this.view.addEventListener(_12U_.ITEM_DOUBLE_CLICK,this._C_K_);
         this.view.addEventListener(_12U_.ITEM_CTRL_CLICK,this._1N_C_);
         this.view._1am.add(this._1V_0);
      }
      
      private function _1V_0(param1:ToolTip) : void
      {
         this.showToolTip.dispatch(param1);
      }
      
      override public function destroy() : void
      {
         super.destroy();
      }
      
      private function _1hB_(param1:_12U_) : void
      {
         var _loc2_:_S_A_ = null;
         var _loc3_:_15m = null;
         var _loc4_:int = 0;
         var _loc5_:_6z = null;
         var _loc6_:_L_I_ = null;
         var _loc7_:TinkerView = null;
         var _loc8_:int = 0;
         var _loc9_:_S_A_ = param1.tile;
         var _loc10_:* = _P_K_._0Z_w(_loc9_._1v(),_15m,_S_A_,_6z,MarketInventorySlot,MarketCreateOfferScreen,TinkerView,Map);
         if(_loc9_.getItemId() == _I_I_._1__7 || _loc9_.getItemId() == _I_I_._11C_ && !Boolean(_loc10_ as _6z))
         {
            this._0uM_(param1);
            return;
         }
         if(_loc10_ is _S_A_)
         {
            _loc2_ = _loc10_ as _S_A_;
            if(this._rf(_loc9_,_loc2_))
            {
               this._0C_8(_loc9_,_loc2_);
            }
         }
         else if(_loc10_ is _15m)
         {
            _loc3_ = _loc10_ as _15m;
            _loc4_ = _loc9_._0E_6.curPlayer.nextAvailableInventorySlot();
            if(_loc4_ != -1)
            {
               PacketManagerBase.instance.invSwap(this.view.curPlayer,_loc9_._0E_6.owner,_loc9_.slotId,_loc9_._1lh.itemId,this.view.curPlayer,_loc4_,_0P_M_._F_p);
               _loc9_.setItem(_0P_M_._F_p);
               _loc9_._1K_w(this.view.curPlayer);
            }
         }
         else if(_loc10_ is _6z || _loc10_ is TinkerView)
         {
            if(_loc10_ is _L_I_)
            {
               _loc6_ = _loc10_ as _L_I_;
               _loc5_ = _loc10_ as _6z;
            }
            else if(_loc10_ is TinkerView)
            {
               _loc7_ = _loc10_ as TinkerView;
               _loc5_ = _loc7_._t3() as _6z;
            }
            else
            {
               _loc5_ = _loc10_ as _6z;
            }
            if(!_loc5_._J_q && !(_loc6_ != null && !_loc6_._1td))
            {
               this._12P_._0E_K_ = _loc9_.slotId;
               this._12P_._1sB_ = _loc9_._0E_6.owner.objectId_;
               _loc8_ = _loc9_.getItemId();
               _loc5_.setItem(_loc8_,_loc9_.slotId,_loc9_._0E_6.owner.objectId_,this._W_K_(_loc9_));
               _loc9_.setItem(_0P_M_._F_p);
               _loc9_.blockingItemUpdates = true;
               _loc9_._1K_w(this.view.curPlayer);
               _loc5_._0al(_loc8_);
            }
         }
         else if(_loc10_ is MarketInventorySlot || _loc10_ is MarketCreateOfferScreen)
         {
            if(_loc10_ is MarketCreateOfferScreen)
            {
               _loc9_._U_m();
               return;
            }
            this._12P_._0E_K_ = _loc9_.slotId;
            this._12P_._1sB_ = _loc9_._0E_6.owner.objectId_;
            _loc8_ = _loc9_.getItemId();
            (_loc10_ as MarketInventorySlot).setItem(_loc8_,_loc9_.slotId,_loc9_._0E_6.owner.objectId_,this._W_K_(_loc9_));
            _loc9_.setItem(_0P_M_._F_p);
            _loc9_.blockingItemUpdates = true;
            _loc9_._1K_w(this.view.curPlayer);
         }
         else if(_loc10_ is Map || this._1tf._14O_.map.mouseX < 300)
         {
            this._046(_loc9_);
         }
         _loc9_._U_m();
      }
      
      private function _W_K_(param1:_S_A_) : Function
      {
         var itemSlot:_S_A_ = param1;
         return function():void
         {
            itemSlot.blockingItemUpdates = false;
         };
      }
      
      private function _0uM_(param1:_12U_) : void
      {
         var _loc2_:_S_A_ = param1.tile;
         var _loc3_:* = _P_K_._0Z_w(_loc2_._1v(),_15m,Map);
         if(_loc3_ is _15m)
         {
            this._1nq(_loc2_);
         }
         else if(_loc3_ is Map || this._1tf._14O_.map.mouseX < 300)
         {
            this._046(_loc2_);
         }
         _loc2_._U_m();
      }
      
      private function _1nq(param1:_S_A_) : void
      {
         if(!PacketManagerBase.instance || !this.view._M___ || !param1 || this._B_s._3l(param1.getItemId())._eI_ <= this._1tf._14O_.map.player_.getPotionCount(param1.getItemId()))
         {
            return;
         }
         PacketManagerBase.instance.invSwapPotion(this.view.curPlayer,this.view.owner,param1.slotId,param1._1lh.itemId,this.view.curPlayer,_I_I_._Y_H_(param1.getItemId()),_0P_M_._F_p);
         param1.setItem(_0P_M_._F_p);
         param1._1K_w(this.view.curPlayer);
      }
      
      private function _rf(param1:_S_A_, param2:_S_A_) : Boolean
      {
         if(!param1.canHoldItem(param2.getItemId()))
         {
            return false;
         }
         if(!param2.canHoldItem(param1.getItemId()))
         {
            return false;
         }
         if(_zL_(param2.parent).owner is OneWayContainer)
         {
            return false;
         }
         if(param1.blockingItemUpdates || param2.blockingItemUpdates)
         {
            return false;
         }
         return true;
      }
      
      private function _046(param1:_S_A_) : void
      {
         var _loc2_:Container = null;
         var _loc3_:Vector.<int> = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:Boolean = ObjectLibrary._0N_6(param1._1lh.itemId);
         var _loc7_:Container = this.view.owner as Container;
         if(this.view.owner == this.view.curPlayer || _loc7_ && _loc7_.ownerId_ == this.view.curPlayer.accountId_ && !_loc6_)
         {
            _loc2_ = this._0X_p._0c8 as Container;
            if(_loc2_)
            {
               _loc3_ = _loc2_.inventory_;
               _loc4_ = _loc3_.length;
               _loc5_ = 0;
               while(_loc5_ < _loc4_)
               {
                  if(_loc3_[_loc5_] < 0)
                  {
                     break;
                  }
                  _loc5_++;
               }
               if(_loc5_ < _loc4_)
               {
                  this._tS_(param1,_loc2_,_loc5_);
               }
               else
               {
                  PacketManagerBase.instance.invDrop(this.view.owner,param1.slotId,param1.getItemId());
               }
            }
            else
            {
               PacketManagerBase.instance.invDrop(this.view.owner,param1.slotId,param1.getItemId());
            }
         }
         param1.setItem(-1);
      }
      
      private function _0C_8(param1:_0U_J_, param2:_0U_J_) : Boolean
      {
         if(!PacketManagerBase.instance || !this.view._M___ || !param1 || !param2)
         {
            return false;
         }
         PacketManagerBase.instance.invSwap(this.view.curPlayer,this.view.owner,param1.slotId,param1._1lh.itemId,param2._0E_6.owner,param2.slotId,param2._1lh.itemId);
         var _loc3_:int = param1.getItemId();
         param1.setItem(param2.getItemId());
         param2.setItem(_loc3_);
         param1._1K_w(this.view.curPlayer);
         param2._1K_w(this.view.curPlayer);
         return true;
      }
      
      private function _tS_(param1:_0U_J_, param2:Container, param3:int) : void
      {
         if(!PacketManagerBase.instance || !this.view._M___ || !param1 || !param2)
         {
            return;
         }
         PacketManagerBase.instance.invSwap(this.view.curPlayer,this.view.owner,param1.slotId,param1._1lh.itemId,param2,param3,-1);
         param1.setItem(_0P_M_._F_p);
      }
      
      private function _1hF_(param1:_12U_) : void
      {
         var _loc2_:_S_A_ = param1.tile;
         if(_loc2_._0E_6 is _1S_u || _loc2_._0E_6 is _u0)
         {
            PacketManagerBase.instance.useItem_new(_loc2_._0E_6.owner,_loc2_.slotId);
         }
      }
      
      private function _1N_C_(param1:_12U_) : void
      {
         var _loc2_:_S_A_ = null;
         var _loc3_:int = 0;
         if(Parameters.data_.inventorySwap)
         {
            _loc2_ = param1.tile;
            if(_loc2_._0E_6 is _1S_u)
            {
               _loc3_ = _loc2_._0E_6.curPlayer.swapInventoryIndex(this._fS_._1F_0);
               if(_loc3_ != -1)
               {
                  PacketManagerBase.instance.invSwap(this.view.curPlayer,_loc2_._0E_6.owner,_loc2_.slotId,_loc2_._1lh.itemId,this.view.curPlayer,_loc3_,_0P_M_._F_p);
                  _loc2_.setItem(_0P_M_._F_p);
                  _loc2_._1K_w(this.view.curPlayer);
               }
            }
         }
      }
      
      private function _C_K_(param1:_12U_) : void
      {
         var _loc2_:_S_A_ = param1.tile;
         if(this._B_y(_loc2_))
         {
            this._1nq(_loc2_);
         }
         else if(_loc2_._0E_6 is _u0)
         {
            this._G_G_(_loc2_);
         }
         else
         {
            this._oi(_loc2_);
         }
         this.view._0nI_();
      }
      
      private function _B_y(param1:_S_A_) : Boolean
      {
         return param1.getItemId() == _I_I_._1__7 || param1.getItemId() == _I_I_._11C_;
      }
      
      private function _05W_(param1:_S_A_) : void
      {
         var _loc2_:int = this.view.curPlayer.nextAvailableInventorySlot();
         if(_loc2_ != -1)
         {
            PacketManagerBase.instance.invSwap(this.view.curPlayer,this.view.owner,param1.slotId,param1._1lh.itemId,this.view.curPlayer,_loc2_,_0P_M_._F_p);
         }
      }
      
      private function _G_G_(param1:_S_A_) : void
      {
         var _loc2_:GameObject = param1._0E_6.owner;
         var _loc3_:Player = this.view.curPlayer;
         var _loc4_:int = this.view.curPlayer.nextAvailableInventorySlot();
         if(_loc4_ != -1)
         {
            PacketManagerBase.instance.invSwap(_loc3_,this.view.owner,param1.slotId,param1._1lh.itemId,this.view.curPlayer,_loc4_,_0P_M_._F_p);
         }
         else
         {
            PacketManagerBase.instance.useItem_new(_loc2_,param1.slotId);
         }
      }
      
      private function _oi(param1:_S_A_) : void
      {
         var _loc2_:GameObject = param1._0E_6.owner;
         var _loc3_:Player = this.view.curPlayer;
         var _loc4_:int = ObjectLibrary._bc(param1.getItemId(),_loc3_);
         if(_loc4_ != -1)
         {
            PacketManagerBase.instance.invSwap(_loc3_,_loc2_,param1.slotId,param1.getItemId(),_loc3_,_loc4_,_loc3_.inventory_[_loc4_]);
         }
         else
         {
            PacketManagerBase.instance.useItem_new(_loc2_,param1.slotId);
         }
      }
   }
}
