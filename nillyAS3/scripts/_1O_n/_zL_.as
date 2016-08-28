package _1O_n
{
   import _0Z_1.Panel;
   import _f7.Signal;
   import com.company.assembleegameclient.objects.GameObject;
   import ToolTips.ToolTip;
   import _1H_T_._0U_J_;
   import com.company.assembleegameclient.objects.Player;
   import flash.events.MouseEvent;
   import ToolTips.EquipmentToolTip;
   import _1H_T_._1Z_h;
   import _1pm._0P_M_;
   import _C_._1O_I_;
   import ToolTips._0bd;
   import _0qE_._016;
   import com.company.assembleegameclient.objects.Container;
   
   public class _zL_ extends Panel
   {
      
      private static const _0tn:Array = [0,0,0,0];
      
      private static const _H_E_:Object = {
         "1":[[1,0,0,1],_0tn,_0tn,[0,1,1,0]],
         "2":[[1,0,0,0],_0tn,_0tn,[0,1,0,0],[0,0,0,1],_0tn,_0tn,[0,0,1,0]],
         "3":[[1,0,0,1],_0tn,_0tn,[0,1,1,0],[1,0,0,0],_0tn,_0tn,[0,1,0,0],[0,0,0,1],_0tn,_0tn,[0,0,1,0]]
      };
       
      
      private const padding:uint = 4;
      
      private const _9v:uint = 4;
      
      public const _1am:Signal = new Signal(ToolTip);
      
      public var owner:GameObject;
      
      private var tooltip:ToolTip;
      
      private var _cs:_0U_J_;
      
      public var curPlayer:Player;
      
      protected var _0I_K_:int;
      
      public var _M___:Boolean;
      
      public function _zL_(param1:GameObject, param2:Player, param3:int)
      {
         super(null);
         this.owner = param1;
         this.curPlayer = param2;
         this._0I_K_ = param3;
         var _loc4_:Container = param1 as Container;
         if(param1 == param2 || _loc4_)
         {
            this._M___ = true;
         }
      }
      
      public function hideTooltip() : void
      {
         if(this.tooltip)
         {
            this.tooltip._1gr();
            this.tooltip = null;
            this._cs = null;
         }
      }
      
      public function _0nI_() : void
      {
         if(!stage || !this.tooltip || !this.tooltip.stage)
         {
            return;
         }
         if(this._cs)
         {
            this.tooltip._1gr();
            this.tooltip = null;
            this._1Z_o(this._cs);
         }
      }
      
      private function _aH_(param1:MouseEvent) : void
      {
         if(!stage)
         {
            return;
         }
         var _loc2_:_0U_J_ = param1.currentTarget as _0U_J_;
         this._1Z_o(_loc2_);
         this._cs = _loc2_;
      }
      
      private function _1Z_o(param1:_0U_J_) : void
      {
         var _loc2_:String = null;
         if(param1._1lh.itemId > 0)
         {
            this.tooltip = new EquipmentToolTip(param1._1lh.itemId,this.curPlayer,!!this.owner?int(this.owner.objectType_):-1,this._1r8());
         }
         else
         {
            if(param1 is _1Z_h)
            {
               _loc2_ = _0P_M_._iw((param1 as _1Z_h).itemType);
            }
            else
            {
               _loc2_ = _1O_I_._0xV_;
            }
            this.tooltip = new _0bd(3552822,10197915,null,_1O_I_._0yt,200,{"itemType":_1O_I_._0A_J_(_loc2_)});
         }
         this.tooltip._0Z_3(param1);
         this._1am.dispatch(this.tooltip);
      }
      
      private function _1r8() : String
      {
         if(this.owner == this.curPlayer)
         {
            return _016.CURRENT_PLAYER;
         }
         if(this.owner is Player)
         {
            return _016.OTHER_PLAYER;
         }
         return _016.NPC;
      }
      
      protected function _0gI_(param1:_0U_J_, param2:uint, param3:uint) : void
      {
         param1._1W_A_(_H_E_[param2][param3]);
         param1.addEventListener(MouseEvent.ROLL_OVER,this._aH_);
         param1.x = int(param3 % this._9v) * (_0U_J_.WIDTH + this.padding);
         param1.y = int(param3 / this._9v) * (_0U_J_.HEIGHT + this.padding);
         addChild(param1);
      }
      
      public function setItems(param1:Vector.<int>, param2:int = 0) : void
      {
      }
      
      public function _wh(param1:Boolean) : void
      {
         mouseEnabled = param1;
      }
      
      override public function draw() : void
      {
         this.setItems(this.owner.inventory_,this._0I_K_);
      }
   }
}
