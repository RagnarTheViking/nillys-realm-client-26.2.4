package ToolTips
{
   import _1gF_.SimpleText;
   import com.company.assembleegameclient.ui._1vJ_;
   import com.company.assembleegameclient.objects.GameObject;
   import flash.display.Sprite;
   import com.company.assembleegameclient.objects.Player;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import _0bE_._1rj;
   import com.company.assembleegameclient.map.Map;
   import flash.display.Graphics;
   import com.company.assembleegameclient.parameters.Parameters;
   import _1xa._dU_;
   import _C_._1O_I_;
   import flash.filters.DropShadowFilter;
   
   public class QuestToolTip extends ToolTip
   {
       
      
      private var text_:SimpleText;
      
      public var _06O_:_1vJ_;
      
      public var questObj:GameObject;
      
      public var bar:Sprite;
      
      public var hMeter:Sprite;
      
      public var playerDistText:SimpleText;
      
      public var dist:int;
      
      public var closestPlayer:Player;
      
      public function QuestToolTip(param1:GameObject)
      {
         super(6036765,1,16549442,1,false);
         this.text_ = new SimpleText().setSize(22).setColor(16549442).setBold(true);
         this.text_.setStringBuilder(new _dU_().setParams(_1O_I_._0N_q));
         this.text_.filters = [new DropShadowFilter(0,0,0)];
         this.text_.x = 0;
         this.text_.y = 0;
         _01T_.push(this.text_.textChanged);
         addChild(this.text_);
         this._06O_ = new _1vJ_(11776947,true,param1);
         this._06O_.x = 0;
         this._06O_.y = 32;
         _01T_.push(this._06O_.txtChangedSignal);
         addChild(this._06O_);
         filters = [];
         this.questObj = param1;
         this.bar = new Sprite();
         this.bar.x = this._06O_.avatar.width - 7;
         this.bar.y = 56 + this._06O_.avatar.height - this._06O_.height;
         this.hMeter = new Sprite();
         this.bar.addChild(this.hMeter);
         this.playerDistText = new SimpleText().setSize(13).setColor(16549442).setBold(true);
         this.playerDistText.y = 5;
         this.bar.addChild(this.playerDistText);
         if(Parameters.data_.enhancedQuestToolTip == true)
         {
            addChild(this.bar);
            addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage_);
         }
         addEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage_);
      }
      
      public function onAddedToStage_(param1:Event) : *
      {
         removeEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage_);
         this.stage.addEventListener(MouseEvent.RIGHT_CLICK,this.onRightClick);
      }
      
      public function onRemovedFromStage_(param1:Event) : *
      {
         removeEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage_);
         this.stage.removeEventListener(MouseEvent.RIGHT_CLICK,this.onRightClick);
      }
      
      public function onRightClick(param1:MouseEvent) : void
      {
         var _loc2_:_1rj = null;
         var _loc3_:Map = null;
         if(param1.target is _1rj)
         {
            _loc2_ = param1.target as _1rj;
            if(_loc2_._1mG_ is QuestToolTip)
            {
               _loc3_ = this.questObj.map_;
               if(_loc3_ != null && _loc3_.allowTeleport() && _loc3_.player_ != this.closestPlayer)
               {
                  _loc3_.player_.teleport(this.closestPlayer);
               }
            }
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
                  this.closestPlayer = _loc1_ as Player;
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
         this.bar.graphics.clear();
         var _loc7_:Graphics = this.bar.graphics;
         _loc7_.lineStyle(0,5526612);
         _loc7_.beginFill(param5);
         _loc7_.lineTo(param3,0);
         _loc7_.lineTo(param3,param4);
         _loc7_.lineTo(0,param4);
         _loc7_.lineTo(0,0);
         _loc7_.endFill();
         var _loc8_:Number = param1 / param2;
         param3 = param3 * _loc8_;
         this.hMeter.graphics.clear();
         var _loc9_:Graphics = this.hMeter.graphics;
         _loc9_.lineStyle(0,5526612);
         _loc9_.beginFill(this.green2red(_loc8_ * 100));
         _loc9_.lineTo(param3,0);
         _loc9_.lineTo(param3,param4);
         _loc9_.lineTo(0,param4);
         _loc9_.lineTo(0,0);
         _loc9_.endFill();
      }
      
      override public function draw() : void
      {
         if(Parameters.data_.enhancedQuestToolTip == true && this.questObj.map_ != null)
         {
            this.updateDist();
            this.drawBar(this.questObj.hp_,this.questObj.maxHp_,this._06O_.width - this._06O_.avatar.width - 4);
            this.playerDistText.setStringBuilder(new _dU_().setParams("blank",{"data":this.dist}));
            this.playerDistText.x = this.bar.width / 2 - this.playerDistText.width / 2;
         }
         super.draw();
      }
   }
}
