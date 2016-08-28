package com.company.assembleegameclient.ui
{
   import flash.display.Sprite;
   import com.company.assembleegameclient.game.GameSpriteBase;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import Packets.Server.TradeStart;
   import _C_._1O_I_;
   
   public class _1uM_ extends Sprite
   {
      
      public static const WIDTH:int = 200;
      
      public static const HEIGHT:int = 400;
       
      
      public var gs_:GameSpriteBase;
      
      private var _c4:com.company.assembleegameclient.ui.TradeInventory;
      
      private var _04D_:com.company.assembleegameclient.ui.TradeInventory;
      
      private var _0yG_:com.company.assembleegameclient.ui.Button;
      
      private var _047:com.company.assembleegameclient.ui._0U_h;
      
      public function _1uM_(param1:GameSpriteBase, param2:TradeStart)
      {
         super();
         this.gs_ = param1;
         var _loc3_:String = this.gs_.map.player_.name_;
         this._c4 = new com.company.assembleegameclient.ui.TradeInventory(param1,_loc3_,param2.myItems_,true);
         this._c4.x = 14;
         this._c4.y = 0;
         this._c4.addEventListener(Event.CHANGE,this._jP_);
         addChild(this._c4);
         this._04D_ = new com.company.assembleegameclient.ui.TradeInventory(param1,param2.yourName_,param2.yourItems_,false);
         this._04D_.x = 14;
         this._04D_.y = 174;
         addChild(this._04D_);
         this._0yG_ = new com.company.assembleegameclient.ui.Button(16,_1O_I_._Q_C_,80);
         this._0yG_.addEventListener(MouseEvent.CLICK,this._0aF_);
         this._0yG_.textChanged.addOnce(this._0y2);
         addChild(this._0yG_);
         this._047 = new com.company.assembleegameclient.ui._0U_h(16,80);
         this._047.x = 3 * WIDTH / 4 - this._047._0yD_ / 2;
         this._047.addEventListener(MouseEvent.CLICK,this._1cX_);
         addChild(this._047);
         this._1__J_();
         addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
         addEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
      }
      
      private function _0y2() : void
      {
         this._0yG_.x = WIDTH / 4 - this._0yG_._0yD_ / 2;
         this._0yG_.y = HEIGHT - this._0yG_.height - 10;
         this._047.y = this._0yG_.y;
      }
      
      public function _X_x(param1:Vector.<Boolean>) : void
      {
         this._04D_._0G_w(param1);
         this._1__J_();
      }
      
      public function _qX_(param1:Vector.<Boolean>, param2:Vector.<Boolean>) : void
      {
         if(this._c4._0i3(param1) && this._04D_._0i3(param2))
         {
            this._04D_._0E_Q_(com.company.assembleegameclient.ui.TradeInventory._0B_C_);
         }
      }
      
      private function onAddedToStage(param1:Event) : void
      {
         stage.addEventListener(Event.ACTIVATE,this._53);
      }
      
      private function onRemovedFromStage(param1:Event) : void
      {
         stage.removeEventListener(Event.ACTIVATE,this._53);
      }
      
      private function _53(param1:Event) : void
      {
         this._047.reset();
      }
      
      private function _jP_(param1:Event) : void
      {
         this.gs_.gsc_.changeTrade(this._c4._D_o());
         this._1__J_();
      }
      
      private function _0aF_(param1:MouseEvent) : void
      {
         this.gs_.gsc_.cancelTrade();
         dispatchEvent(new Event(Event.CANCEL));
      }
      
      private function _1cX_(param1:MouseEvent) : void
      {
         this.gs_.gsc_.acceptTrade(this._c4._D_o(),this._04D_._D_o());
         this._c4._0E_Q_(com.company.assembleegameclient.ui.TradeInventory._0B_C_);
      }
      
      public function _1__J_() : void
      {
         var _loc1_:int = this._c4._0A_K_();
         var _loc2_:int = this._c4._qW_();
         var _loc3_:int = this._04D_._0A_K_();
         var _loc4_:int = this._04D_._qW_();
         var _loc5_:Boolean = true;
         if(_loc3_ - _loc1_ - _loc2_ > 0)
         {
            this._c4._0E_Q_(com.company.assembleegameclient.ui.TradeInventory._p4);
            _loc5_ = false;
         }
         else
         {
            this._c4._0E_Q_(com.company.assembleegameclient.ui.TradeInventory._1cc);
         }
         if(_loc1_ - _loc3_ - _loc4_ > 0)
         {
            this._04D_._0E_Q_(com.company.assembleegameclient.ui.TradeInventory._p4);
            _loc5_ = false;
         }
         else
         {
            this._04D_._0E_Q_(com.company.assembleegameclient.ui.TradeInventory._wz);
         }
         if(_loc5_)
         {
            this._047.reset();
         }
         else
         {
            this._047.disable();
         }
      }
   }
}
