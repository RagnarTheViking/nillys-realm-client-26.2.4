package com.company.assembleegameclient.ui
{
   import flash.display.Sprite;
   import _f7.Signal;
   import flash.utils.Timer;
   import com.company.assembleegameclient.objects.Player;
   import flash.events.TimerEvent;
   import flash.display.Bitmap;
   import _1gF_.SimpleText;
   import com.company.assembleegameclient.util.TextureRedrawer;
   import com.company.util.TextureLibrary;
   import flash.display.BitmapData;
   import _1xa._dU_;
   import _C_._1O_I_;
   import flash.filters.DropShadowFilter;
   import _05g._1S_m;
   import _1xa._1eo;
   
   public class BoostPanel extends Sprite
   {
       
      
      public const _0lF_:Signal = new Signal();
      
      private const SPACE:uint = 40;
      
      private var timer:Timer;
      
      private var player:Player;
      
      private var _1O_i:com.company.assembleegameclient.ui._I_5;
      
      private var _1bu:com.company.assembleegameclient.ui._I_5;
      
      private var _1M_S_:int;
      
      public function BoostPanel(param1:Player)
      {
         super();
         this.player = param1;
         this._1R___();
         this._Y_n();
         this._1__g();
      }
      
      private function _1__g() : void
      {
         this.timer = new Timer(1000);
         this.timer.addEventListener(TimerEvent.TIMER,this.update);
         this.timer.start();
      }
      
      private function update(param1:TimerEvent) : void
      {
         this._03B_(this._1O_i,this.player.lootTierTime_);
         this._03B_(this._1bu,this.player.dropRateTime_);
      }
      
      private function _03B_(param1:com.company.assembleegameclient.ui._I_5, param2:int) : void
      {
         if(param1)
         {
            if(param2)
            {
               param1.setTime(param2);
            }
            else
            {
               this._0t__();
               this._Y_n();
            }
         }
      }
      
      private function _1R___() : void
      {
         var _loc1_:Bitmap = null;
         var _loc2_:SimpleText = null;
         var _loc3_:BitmapData = TextureRedrawer.redraw(TextureLibrary.getBitmap("lofiInterfaceBig",22),20,true,0);
         _loc1_ = new Bitmap(_loc3_);
         _loc1_.x = -3;
         _loc1_.y = -1;
         addChild(_loc1_);
         _loc2_ = new SimpleText().setSize(16).setColor(65280);
         _loc2_.setBold(true);
         _loc2_.setStringBuilder(new _dU_().setParams(_1O_I_._1Z_5));
         _loc2_.setMultiLine(true);
         _loc2_.mouseEnabled = true;
         _loc2_.filters = [new DropShadowFilter(0,0,0)];
         _loc2_.x = 20;
         _loc2_.y = 4;
         addChild(_loc2_);
      }
      
      private function _0c0() : void
      {
         graphics.clear();
         graphics.lineStyle(2,16777215);
         graphics.beginFill(3355443);
         graphics.drawRoundRect(0,0,150,height + 5,10);
         this._0lF_.dispatch();
      }
      
      private function _Y_n() : void
      {
         this._1M_S_ = 25;
         var _loc1_:_1S_m = new _1S_m();
         this._0qg(_loc1_);
         this._S_X_(_loc1_);
         if(_loc1_.isEmpty())
         {
            this._0c0();
         }
         else
         {
            _loc1_.complete.addOnce(this._0c0);
         }
      }
      
      private function _S_X_(param1:_1S_m) : void
      {
         if(this.player.lootTierTime_)
         {
            this._1O_i = this._1rC_(new _dU_().setParams(_1O_I_._0O_2),this.player.lootTierTime_);
            this._0W_U_(param1,this._1O_i);
         }
      }
      
      private function _0qg(param1:_1S_m) : void
      {
         var _loc2_:String = null;
         if(this.player.dropRateTime_)
         {
            _loc2_ = "1.5x";
            this._1bu = this._1rC_(new _dU_().setParams(_1O_I_._1L_r,{"rate":_loc2_}),this.player.dropRateTime_);
            this._0W_U_(param1,this._1bu);
         }
      }
      
      private function _0W_U_(param1:_1S_m, param2:com.company.assembleegameclient.ui._I_5) : void
      {
         param1.push(param2.textChanged);
         addChild(param2);
         param2.y = this._1M_S_;
         param2.x = 10;
         this._1M_S_ = this._1M_S_ + this.SPACE;
      }
      
      private function _0t__() : void
      {
         if(this._1O_i && this._1O_i.parent)
         {
            removeChild(this._1O_i);
         }
         if(this._1bu && this._1bu.parent)
         {
            removeChild(this._1bu);
         }
         this._1O_i = null;
         this._1bu = null;
      }
      
      private function _1rC_(param1:_1eo, param2:int) : com.company.assembleegameclient.ui._I_5
      {
         var _loc3_:com.company.assembleegameclient.ui._I_5 = new com.company.assembleegameclient.ui._I_5();
         _loc3_._zZ_(param1);
         _loc3_.setTime(param2);
         return _loc3_;
      }
   }
}
