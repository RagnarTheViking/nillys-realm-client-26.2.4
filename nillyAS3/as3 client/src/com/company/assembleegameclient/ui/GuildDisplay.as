package com.company.assembleegameclient.ui
{
   import flash.display.Sprite;
   import flash.display.Bitmap;
   import _1gF_.SimpleText;
   import com.company.util._mL_;
   import com.company.assembleegameclient.util.GuildUtil;
   import _1xa.SText;
   import flash.text.TextFieldAutoSize;
   import flash.filters.DropShadowFilter;
   
   public class GuildDisplay extends Sprite
   {
       
      
      private var name_:String;
      
      private var _1xi:int;
      
      private var _1kE_:Bitmap;
      
      private var guildName_:SimpleText;
      
      public function GuildDisplay(param1:String, param2:int, param3:int = 0)
      {
         super();
         this._1kE_ = new Bitmap(null);
         this._1kE_.y = -8;
         this._1kE_.x = -8;
         var _loc4_:int = param3 == 0?0:int(param3 - (this._1kE_.width - 16));
         this.guildName_ = new SimpleText().setSize(16).setColor(16777215).setTextWidth(_loc4_);
         this.guildName_.setAutoSize(TextFieldAutoSize.LEFT);
         this.guildName_.filters = [new DropShadowFilter(0,0,0)];
         this.guildName_.x = 24;
         this.guildName_.y = 2;
         this.draw(param1,param2);
      }
      
      public function draw(param1:String, param2:int) : void
      {
         if(this.name_ == param1 && param2 == param2)
         {
            return;
         }
         this.name_ = param1;
         this._1xi = param2;
         if(this.name_ == null || this.name_ == "")
         {
            _mL_._0g1(this,this._1kE_);
            _mL_._0g1(this,this.guildName_);
         }
         else
         {
            this._1kE_.bitmapData = GuildUtil._0mx(this._1xi,20);
            _mL_._1D_5(this,this._1kE_);
            this.guildName_.setStringBuilder(new SText(this.name_));
            _mL_._1D_5(this,this.guildName_);
         }
      }
   }
}
