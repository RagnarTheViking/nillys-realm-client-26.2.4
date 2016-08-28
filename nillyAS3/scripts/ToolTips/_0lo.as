package ToolTips
{
   import flash.display.Bitmap;
   import com.company.assembleegameclient.objects.GameObject;
   import flash.display.Sprite;
   import flash.geom.ColorTransform;
   import com.company.assembleegameclient.map.Map;
   import com.company.assembleegameclient.objects.Player;
   import flash.display.Graphics;
   import com.company.assembleegameclient.parameters.Parameters;
   import flash.utils.getTimer;
   import com.company.util.MoreColorUtil;
   import flash.display.BitmapData;
   import com.company.util.BitmapUtil;
   
   public class _0lo extends ToolTip
   {
       
      
      private var _0P_q:Bitmap;
      
      public var questObj:GameObject;
      
      public var bar:Sprite;
      
      public var hMeter:Sprite;
      
      public var dist:int;
      
      public var colorTransform:ColorTransform;
      
      public function _0lo(param1:GameObject)
      {
         super(6036765,1,16549442,1,false);
         this._0P_q = new Bitmap();
         this._0P_q.x = 0;
         this._0P_q.y = 0;
         var _loc2_:BitmapData = param1.getPortrait();
         _loc2_ = BitmapUtil._0P_V_(_loc2_,10,10,_loc2_.width - 20,_loc2_.height - 20);
         this._0P_q.bitmapData = _loc2_;
         addChild(this._0P_q);
         filters = [];
         this.questObj = param1;
         this.bar = new Sprite();
         this.bar.x = 0;
         this.bar.y = 25;
         this.hMeter = new Sprite();
         this.colorTransform = new ColorTransform(1,1,1,1);
         if(Parameters.data_.enhancedQuestToolTip == true)
         {
            this.bar.addChild(this.hMeter);
            addChild(this.bar);
         }
      }
      
      public function getDist(param1:Number, param2:Number, param3:Number, param4:Number) : Number
      {
         var _loc5_:* = param1 - param3;
         var _loc6_:* = param2 - param4;
         return Math.sqrt(_loc6_ * _loc6_ + _loc5_ * _loc5_);
      }
      
      public function updateDist() : void
      {
         var _loc1_:GameObject = null;
         var _loc2_:int = 0;
         var _loc3_:Map = this.questObj.map_;
         this.dist = int.MAX_VALUE;
         for each(_loc1_ in _loc3_.goDict_)
         {
            if(_loc1_ is Player)
            {
               _loc2_ = this.getDist(_loc1_.x_,_loc1_.y_,this.questObj.x_,this.questObj.y_);
               if(_loc2_ < this.dist)
               {
                  this.dist = _loc2_;
               }
            }
         }
      }
      
      public function green2red(param1:int) : int
      {
         if(param1 > 50)
         {
            return 65280 + 327680 * int(100 - param1);
         }
         return 16776960 - 1280 * int(50 - param1);
      }
      
      public function drawBar(param1:int, param2:int, param3:Number = 100, param4:Number = 3, param5:uint = 5526612, param6:uint = 65280) : *
      {
         var _loc7_:Number = param1 / param2;
         this.bar.graphics.clear();
         var _loc8_:Graphics = this.bar.graphics;
         _loc8_.lineStyle(0,5526612);
         _loc8_.beginFill(param5);
         _loc8_.lineTo(param3,0);
         _loc8_.lineTo(param3,param4);
         _loc8_.lineTo(0,param4);
         _loc8_.lineTo(0,0);
         _loc8_.endFill();
         param3 = param3 * _loc7_;
         this.hMeter.graphics.clear();
         var _loc9_:Graphics = this.hMeter.graphics;
         _loc9_.lineStyle(0,5526612);
         _loc9_.beginFill(this.green2red(_loc7_ * 100));
         _loc9_.lineTo(param3,0);
         _loc9_.lineTo(param3,param4);
         _loc9_.lineTo(0,param4);
         _loc9_.lineTo(0,0);
         _loc9_.endFill();
      }
      
      override public function draw() : void
      {
         var _loc1_:Number = NaN;
         if(Parameters.data_.enhancedQuestToolTip == true && this.questObj.map_ != null)
         {
            this.updateDist();
            this.drawBar(this.questObj.hp_,this.questObj.maxHp_,23);
            if(this.dist < 20)
            {
               _loc1_ = getTimer() % 1000;
               if(_loc1_ < 500)
               {
                  _loc1_ = _loc1_ / 500;
               }
               else
               {
                  _loc1_ = 2 - _loc1_ / 500;
               }
               this.colorTransform.alphaMultiplier = _loc1_;
               this.bar.transform.colorTransform = this.colorTransform;
            }
            else
            {
               this.bar.transform.colorTransform = MoreColorUtil.identity;
            }
         }
         super.draw();
      }
   }
}
