package com.company.assembleegameclient.ui
{
   import flash.display.Sprite;
   import com.company.assembleegameclient.game.GameSpriteBase;
   import com.company.ui._0H_R_;
   import _1gF_.SimpleText;
   import _C_._1O_I_;
   import _1xa._dU_;
   import flash.events.MouseEvent;
   import flash.events.Event;
   import _7m._0wb;
   import flash.filters.DropShadowFilter;
   import _1pm._1Y_F_;
   
   public class TradeInventory extends Sprite
   {
      
      private static const _0tn:Array = [0,0,0,0];
      
      private static const _19h:Array = [[1,0,0,1],_0tn,_0tn,[0,1,1,0],[1,0,0,0],_0tn,_0tn,[0,1,0,0],[0,0,0,1],_0tn,_0tn,[0,0,1,0]];
      
      public static const _1cc:int = 0;
      
      public static const _p4:int = 1;
      
      public static const _0B_C_:int = 2;
      
      public static const _wz:int = 3;
       
      
      public var gs_:GameSpriteBase;
      
      public var _7N_:String;
      
      private var _nr:int;
      
      private var nameText_:_0H_R_;
      
      private var taglineText_:SimpleText;
      
      public var _Z_H_:Vector.<com.company.assembleegameclient.ui._1o2>;
      
      public function TradeInventory(param1:GameSpriteBase, param2:String, param3:Vector.<_0wb>, param4:Boolean)
      {
         var _loc5_:_0wb = null;
         var _loc6_:com.company.assembleegameclient.ui._1o2 = null;
         var _loc7_:int = 0;
         this._Z_H_ = new Vector.<com.company.assembleegameclient.ui._1o2>();
         super();
         this.gs_ = param1;
         this._7N_ = param2;
         this.nameText_ = new _0H_R_(20,11776947,false,0,0);
         this.nameText_.setBold(true);
         this.nameText_.x = 0;
         this.nameText_.y = 0;
         this.nameText_.text = this._7N_;
         this.nameText_.updateMetrics();
         this.nameText_.filters = [new DropShadowFilter(0,0,0)];
         addChild(this.nameText_);
         this.taglineText_ = new SimpleText().setSize(12).setColor(11776947);
         this.taglineText_.x = 0;
         this.taglineText_.y = 22;
         this.taglineText_.filters = [new DropShadowFilter(0,0,0)];
         addChild(this.taglineText_);
         while(_loc7_ < _1Y_F_._J_p + _1Y_F_._16J_)
         {
            _loc5_ = param3[_loc7_];
            _loc6_ = new com.company.assembleegameclient.ui._1o2(_loc5_.item_,_loc5_._3e,_loc5_.included_,_loc5_._1fS_,_loc7_ - 3,_19h[_loc7_],_loc7_);
            _loc6_._1ib(this.gs_.map.player_);
            _loc6_.x = int(_loc7_ % 4) * (Slot.WIDTH + 4);
            _loc6_.y = int(_loc7_ / 4) * (Slot.HEIGHT + 4) + 46;
            if(param4 && _loc5_._3e)
            {
               _loc6_.addEventListener(MouseEvent.MOUSE_DOWN,this._138);
            }
            this._Z_H_.push(_loc6_);
            addChild(_loc6_);
            _loc7_++;
         }
      }
      
      public function _D_o() : Vector.<Boolean>
      {
         var _loc2_:int = 0;
         var _loc1_:Vector.<Boolean> = new Vector.<Boolean>();
         while(_loc2_ < this._Z_H_.length)
         {
            _loc1_.push(this._Z_H_[_loc2_].included_);
            _loc2_++;
         }
         return _loc1_;
      }
      
      public function _0G_w(param1:Vector.<Boolean>) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this._Z_H_.length)
         {
            this._Z_H_[_loc2_].setIncluded(param1[_loc2_]);
            _loc2_++;
         }
      }
      
      public function _0i3(param1:Vector.<Boolean>) : Boolean
      {
         var _loc2_:int = 0;
         while(_loc2_ < this._Z_H_.length)
         {
            if(param1[_loc2_] != this._Z_H_[_loc2_].included_)
            {
               return false;
            }
            _loc2_++;
         }
         return true;
      }
      
      public function _0A_K_() : int
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         while(_loc2_ < this._Z_H_.length)
         {
            if(this._Z_H_[_loc2_].included_)
            {
               _loc1_++;
            }
            _loc2_++;
         }
         return _loc1_;
      }
      
      public function _qW_() : int
      {
         var _loc1_:int = 0;
         var _loc2_:int = 4;
         while(_loc2_ < this._Z_H_.length)
         {
            if(this._Z_H_[_loc2_].isEmpty())
            {
               _loc1_++;
            }
            _loc2_++;
         }
         return _loc1_;
      }
      
      public function _0E_Q_(param1:int) : void
      {
         var _loc2_:* = "";
         switch(param1)
         {
            case _1cc:
               this.nameText_.setColor(11776947);
               this.taglineText_.setColor(11776947);
               _loc2_ = _1O_I_._1K_G_;
               break;
            case _p4:
               this.nameText_.setColor(16711680);
               this.taglineText_.setColor(16711680);
               _loc2_ = _1O_I_._1R_t;
               break;
            case _0B_C_:
               this.nameText_.setColor(9022300);
               this.taglineText_.setColor(9022300);
               _loc2_ = _1O_I_._1E_t;
               break;
            case _wz:
               this.nameText_.setColor(11776947);
               this.taglineText_.setColor(11776947);
               _loc2_ = _1O_I_._0kd;
         }
         this.taglineText_.setStringBuilder(new _dU_().setParams(_loc2_));
      }
      
      private function _138(param1:MouseEvent) : void
      {
         var _loc2_:com.company.assembleegameclient.ui._1o2 = param1.currentTarget as com.company.assembleegameclient.ui._1o2;
         _loc2_.setIncluded(!_loc2_.included_);
         dispatchEvent(new Event(Event.CHANGE));
      }
   }
}
