package com.company.assembleegameclient.ui
{
   import _1R_o._Y_5;
   import _1R_o._0xf;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import ToolTips.PlayerToolTip;
   import com.company.assembleegameclient.objects.Player;
   import flash.display.Sprite;
   import com.company.assembleegameclient.objects.GameObject;
   import flash.geom.ColorTransform;
   import com.company.util.MoreColorUtil;
   import _1T_4._q6;
   import _1T_4._1K_2;
   
   public class _1E_f extends _1vJ_ implements _Y_5
   {
       
      
      public const _18D_:_0xf = new _0xf();
      
      private var enabled:Boolean = true;
      
      private var _1z8:Boolean = false;
      
      public function _1E_f(param1:uint, param2:Boolean, param3:GameObject)
      {
         super(param1,param2,param3);
         var _loc4_:Player = param3 as Player;
         if(_loc4_)
         {
            this._1z8 = _loc4_.starred_;
         }
         addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
         addEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
      }
      
      private function onAddedToStage(param1:Event) : void
      {
         addEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver);
         this._18D_._bD_(this);
      }
      
      private function onRemovedFromStage(param1:Event) : void
      {
         removeEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver);
         removeEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
         removeEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
      }
      
      private function onMouseOver(param1:MouseEvent) : void
      {
         this._18D_.tooltip = !!this.enabled?new PlayerToolTip(Player(go)):null;
      }
      
      public function setEnabled(param1:Boolean) : void
      {
         if(this.enabled != param1 && Player(go) != null)
         {
            this.enabled = param1;
            this._18D_.tooltip = !!this.enabled?new PlayerToolTip(Player(go)):null;
            if(!this.enabled)
            {
               this._18D_._23().dispatch(this._18D_.tooltip);
            }
         }
      }
      
      override public function draw(param1:GameObject, param2:ColorTransform = null) : void
      {
         var _loc3_:Player = param1 as Player;
         if(_loc3_ && this._1z8 != _loc3_.starred_)
         {
            transform.colorTransform = param2 || MoreColorUtil.identity;
            this._1z8 = _loc3_.starred_;
         }
         super.draw(param1,param2);
      }
      
      public function _0A_A_(param1:_q6) : void
      {
         this._18D_._0A_A_(param1);
      }
      
      public function _23() : _q6
      {
         return this._18D_._23();
      }
      
      public function _0hm(param1:_1K_2) : void
      {
         this._18D_._0hm(param1);
      }
      
      public function _fn() : _1K_2
      {
         return this._18D_._fn();
      }
   }
}
