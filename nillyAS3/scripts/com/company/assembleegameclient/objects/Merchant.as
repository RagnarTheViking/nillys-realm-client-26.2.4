package com.company.assembleegameclient.objects
{
   import flash.geom.Matrix;
   import flash.display.BitmapData;
   import _0jo._rJ_;
   import _03U_._1U_N_;
   import flash.geom.ColorTransform;
   import com.company.assembleegameclient.map.Map;
   import com.company.util.IntPoint;
   import _ge._1bc;
   import _1xa._dU_;
   import _T_J_.GTween;
   import _1__I_._bY_;
   import ToolTips.ToolTip;
   import ToolTips.EquipmentToolTip;
   import _0qE_._016;
   import com.company.ui._0H_R_;
   import com.company.assembleegameclient.map.View;
   import _0H_6.GameContext;
   
   public class Merchant extends SellableObject implements _1kF_
   {
      
      private static const _extends:int = 0;
      
      private static const _0hV_:int = 1;
      
      private static const _14F_:int = 2;
      
      private static const _0C_S_:int = 3;
      
      private static const _u9:int = 4;
      
      private static const T:Number = 1;
      
      private static const _1A_f:Matrix = function():Matrix
      {
         var _loc1_:* = new Matrix();
         _loc1_.translate(10,5);
         return _loc1_;
      }();
       
      
      public var _0bw:int = -1;
      
      public var merchantRemainingCount:int = -1;
      
      public var merchantRemainingMinute:int = -1;
      
      public var merchantDiscount:int = 0;
      
      public var merchandiseTexture_:BitmapData = null;
      
      public var merchantRemainingTime:int = 0;
      
      public var alpha_:Number = 1;
      
      private var addSpeechBalloon:_rJ_;
      
      private var _iB_:_1U_N_;
      
      private var _1A_P_:Boolean = true;
      
      private var _15x:int = 0;
      
      private var _Y_6:ColorTransform;
      
      public function Merchant(param1:XML)
      {
         this._Y_6 = new ColorTransform(1,1,1,1);
         this.addSpeechBalloon = GameContext.getInjector().getInstance(_rJ_);
         this._iB_ = GameContext.getInjector().getInstance(_1U_N_);
         super(param1);
         _1kM_ = true;
      }
      
      override public function setPrice(param1:int) : void
      {
         super.setPrice(param1);
         this.merchantRemainingTime = 0;
      }
      
      override public function setRankReq(param1:int) : void
      {
         super.setRankReq(param1);
         this.merchantRemainingTime = 0;
      }
      
      override public function addTo(param1:Map, param2:Number, param3:Number) : Boolean
      {
         if(!super.addTo(param1,param2,param3))
         {
            return false;
         }
         param1.merchLookup_[new IntPoint(x_,y_)] = this;
         return true;
      }
      
      override public function removeFromMap() : void
      {
         var _loc1_:IntPoint = new IntPoint(x_,y_);
         if(map_.merchLookup_[_loc1_] == this)
         {
            map_.merchLookup_[_loc1_] = null;
         }
         super.removeFromMap();
      }
      
      public function _J_h(param1:int) : _1bc
      {
         var _loc2_:_dU_ = null;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         switch(param1)
         {
            case _0hV_:
               _loc2_ = new _dU_().setParams("Merchant.new");
               _loc3_ = 15132390;
               _loc4_ = 16777215;
               _loc5_ = 5931045;
               break;
            case _14F_:
               if(this.merchantRemainingMinute == 0)
               {
                  _loc2_ = new _dU_().setParams("Merchant.goingSoon");
               }
               else if(this.merchantRemainingMinute == 1)
               {
                  _loc2_ = new _dU_().setParams("Merchant.goingInOneMinute");
               }
               else
               {
                  _loc2_ = new _dU_().setParams("Merchant.goingInNMinutes",{"minutes":this.merchantRemainingMinute});
               }
               _loc3_ = 5973542;
               _loc4_ = 16549442;
               _loc5_ = 16549442;
               break;
            case _0C_S_:
               _loc2_ = new _dU_().setParams("Merchant.limitedStock",{"count":this.merchantRemainingCount});
               _loc3_ = 5973542;
               _loc4_ = 16549442;
               _loc5_ = 16549442;
               break;
            case _u9:
               _loc2_ = new _dU_().setParams("Merchant.discount",{"discount":this.merchantDiscount});
               _loc3_ = 6324275;
               _loc4_ = 16777103;
               _loc5_ = 16777103;
               break;
            default:
               return null;
         }
         _loc2_._0L_b(this._iB_);
         return new _1bc(this,_loc2_.getString(),_loc3_,1,_loc4_,1,_loc5_,6,true,false);
      }
      
      override public function update(param1:int, param2:int) : Boolean
      {
         var _loc3_:GTween = null;
         super.update(param1,param2);
         if(this._1A_P_)
         {
            if(this.merchantRemainingMinute == 2147483647)
            {
               _loc3_ = new GTween(this,0.5 * T,{"size_":150},{"ease":_bY_._0O_C_});
               _loc3_._Y_I_ = new GTween(this,0.5 * T,{"size_":100},{"ease":_bY_._11O_});
               _loc3_._Y_I_.paused = true;
            }
            this._1A_P_ = false;
         }
         this.merchantRemainingTime = this.merchantRemainingTime - param2;
         if(this.merchantRemainingTime > 0)
         {
            return true;
         }
         this.merchantRemainingTime = 5000;
         var _loc4_:Vector.<int> = new Vector.<int>();
         if(this.merchantRemainingMinute == 2147483647)
         {
            _loc4_.push(_0hV_);
         }
         else if(this.merchantRemainingMinute >= 0 && this.merchantRemainingMinute <= 5)
         {
            _loc4_.push(_14F_);
         }
         if(this.merchantRemainingCount >= 1 && this.merchantRemainingCount <= 2)
         {
            _loc4_.push(_0C_S_);
         }
         if(this.merchantDiscount > 0)
         {
            _loc4_.push(_u9);
         }
         if(_loc4_.length == 0)
         {
            return true;
         }
         this._15x = ++this._15x % _loc4_.length;
         var _loc5_:int = _loc4_[this._15x];
         this.addSpeechBalloon.dispatch(this._J_h(_loc5_));
         return true;
      }
      
      override public function soldObjectName() : String
      {
         return ObjectLibrary._O_S_[this._0bw];
      }
      
      override public function soldObjectInternalName() : String
      {
         var _loc1_:XML = ObjectLibrary.XmlData[this._0bw];
         return _loc1_.@id.toString();
      }
      
      override public function getTooltip() : ToolTip
      {
         return new EquipmentToolTip(this._0bw,map_.player_,-1,_016.NPC);
      }
      
      override public function getIcon() : BitmapData
      {
         var _loc1_:_0H_R_ = null;
         var _loc2_:BitmapData = ObjectLibrary.getRedrawnTextureFromType(this._0bw,80,true);
         var _loc3_:XML = ObjectLibrary.XmlData[this._0bw];
         if(_loc3_.hasOwnProperty("Doses"))
         {
            _loc2_ = _loc2_.clone();
            _loc1_ = new _0H_R_(12,16777215,false,0,0);
            _loc1_.text = String(_loc3_.Doses);
            _loc1_.updateMetrics();
            _loc2_.draw(_loc1_,_1A_f);
         }
         return _loc2_;
      }
      
      public function getTex1Id(param1:int) : int
      {
         var _loc2_:XML = ObjectLibrary.XmlData[this._0bw];
         if(_loc2_ == null)
         {
            return param1;
         }
         if(_loc2_.Activate == "Dye" && _loc2_.hasOwnProperty("Tex1"))
         {
            return int(_loc2_.Tex1);
         }
         return param1;
      }
      
      public function getTex2Id(param1:int) : int
      {
         var _loc2_:XML = ObjectLibrary.XmlData[this._0bw];
         if(_loc2_ == null)
         {
            return param1;
         }
         if(_loc2_.Activate == "Dye" && _loc2_.hasOwnProperty("Tex2"))
         {
            return int(_loc2_.Tex2);
         }
         return param1;
      }
      
      override protected function getTexture(param1:View, param2:int) : BitmapData
      {
         if(this.alpha_ == 1 && size_ == 100)
         {
            return this.merchandiseTexture_;
         }
         var _loc3_:BitmapData = ObjectLibrary.getRedrawnTextureFromType(this._0bw,size_,false,false);
         if(this.alpha_ != 1)
         {
            this._Y_6.alphaMultiplier = this.alpha_;
            _loc3_.colorTransform(_loc3_.rect,this._Y_6);
         }
         return _loc3_;
      }
      
      public function setMerchandiseType(param1:int) : void
      {
         this._0bw = param1;
         this.merchandiseTexture_ = ObjectLibrary.getRedrawnTextureFromType(this._0bw,100,false);
      }
   }
}
