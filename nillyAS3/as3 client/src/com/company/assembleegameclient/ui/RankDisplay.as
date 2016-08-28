package com.company.assembleegameclient.ui
{
   import flash.display.Sprite;
   import _1gF_.SimpleText;
   import _05g._1S_m;
   import _1xa.SText;
   import flash.filters.DropShadowFilter;
   import com.company.assembleegameclient.util.Star;
   import _1xa._dU_;
   import _C_._1O_I_;
   
   public class RankDisplay extends Sprite
   {
       
      
      public var background:Sprite = null;
      
      public var large:Boolean;
      
      public var stars_:int = -1;
      
      public var rank_:int = 0;
      
      public var admin_:Boolean = false;
      
      private var _1N_Q_:SimpleText = null;
      
      private var _01T_:_1S_m;
      
      private var icon:Sprite;
      
      public function RankDisplay(param1:int, param2:Boolean, param3:Boolean, param4:int, param5:Boolean)
      {
         this._01T_ = new _1S_m();
         super();
         this.large = param2;
         if(param3)
         {
            this._1N_Q_ = this.makeText();
            this._1N_Q_.setStringBuilder(new _dU_().setParams(_1O_I_._0h2));
            this._1N_Q_.filters = [new DropShadowFilter(0,0,0)];
            this._1N_Q_.textChanged.addOnce(this.position);
            addChild(this._1N_Q_);
         }
         mouseEnabled = false;
         mouseChildren = false;
         this.draw(param1,param4,param5);
      }
      
      public function makeText() : SimpleText
      {
         var _loc1_:int = !!this.large?18:16;
         var _loc2_:SimpleText = new SimpleText();
         _loc2_.setSize(_loc1_).setColor(11776947);
         _loc2_.setBold(this.large);
         return _loc2_;
      }
      
      public function draw(param1:int, param2:int, param3:Boolean) : void
      {
         var text:SimpleText = null;
         var onTextChanged:Function = null;
         var stars:int = param1;
         var rank:int = param2;
         var admin:Boolean = param3;
         onTextChanged = function():void
         {
            text.y = text.height;
            icon.x = text.width + 2;
            icon.y = text.y - icon.height;
            var _loc1_:int = icon.x + icon.width;
            background.graphics.clear();
            background.graphics.beginFill(0,0.4);
            var _loc2_:Number = icon.height + 8;
            background.graphics.drawRoundRect(-2,icon.y - 3,_loc1_ + 6,_loc2_,12,12);
            background.graphics.endFill();
            position();
         };
         if(stars == this.stars_ && rank == this.rank_)
         {
            return;
         }
         this.stars_ = stars;
         this.rank_ = rank;
         this.admin_ = admin;
         if(this.background != null && contains(this.background))
         {
            removeChild(this.background);
         }
         if(this.stars_ < 0)
         {
            return;
         }
         this.background = new Sprite();
         text = this.makeText();
         text.setVerticalAlign(SimpleText.BOTTOM);
         var rankText:* = this.stars_.toString();
         if(this.rank_ > 0)
         {
            rankText = rankText + ("-" + this.rank_.toString());
         }
         text.setStringBuilder(new SText(rankText));
         text.filters = [new DropShadowFilter(0,0,0,1,4,4,2)];
         this.background.addChild(text);
         this.icon = !!this.large?Star.getLargeRankIcon(this.stars_,this.admin_):Star.getRankIcon(this.stars_,this.admin_);
         this.background.addChild(this.icon);
         text.textChanged.addOnce(onTextChanged);
         addChild(this.background);
         if(this._1N_Q_ != null)
         {
            this._rK_();
         }
      }
      
      private function _rK_() : void
      {
         if(this._01T_.isEmpty())
         {
            this.position();
         }
         else
         {
            this._01T_.complete.addOnce(this.position);
         }
      }
      
      private function position() : void
      {
         if(this._1N_Q_)
         {
            this.background.x = this._1N_Q_.width;
            this._1N_Q_.y = this.icon.y - 3;
         }
      }
   }
}
