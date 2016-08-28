package _W_Q_
{
   import flash.display.Sprite;
   import _f7.Signal;
   import com.company.assembleegameclient.ui.RankDisplay;
   import com.company.assembleegameclient.ui.GuildDisplay;
   import _0J_8._0C_M_;
   import flash.display.DisplayObject;
   import flash.display.Shape;
   import flash.events.MouseEvent;
   import ToolTips.RankToolTip;
   
   public class TitleBasicAccountInfo extends Sprite
   {
       
      
      public var tooltip:Signal;
      
      private var _1d1:Sprite;
      
      private var _0E_P_:Sprite;
      
      private var _X_O_:Sprite;
      
      private var guildName:String;
      
      private var guildRank:int;
      
      private var stars_:int;
      
      private var rank_:int;
      
      private var admin_:Boolean;
      
      private var rankDisplay:RankDisplay;
      
      private var guildDisplay:GuildDisplay;
      
      private var accountInfo:_0C_M_;
      
      public function TitleBasicAccountInfo()
      {
         super();
         this.tooltip = new Signal();
         this._1bs();
      }
      
      private function _1bs() : void
      {
         addChild(this._1d1 = new Sprite());
         addChild(this._0E_P_ = new Sprite());
         addChild(this._X_O_ = new Sprite());
      }
      
      private function _vo() : DisplayObject
      {
         var _loc1_:Shape = new Shape();
         _loc1_.graphics.beginFill(0,0.5);
         _loc1_.graphics.drawRect(0,0,800,35);
         return _loc1_;
      }
      
      public function drawGuild(param1:String, param2:int) : void
      {
         this.guildName = param1;
         this.guildRank = param2;
         this.initGuild();
      }
      
      private function initGuild() : void
      {
         this.guildDisplay = new GuildDisplay(this.guildName,this.guildRank);
         this.guildDisplay.x = 36 + this.rankDisplay.width + 6;
         this.guildDisplay.y = 6;
         while(this._0E_P_.numChildren > 0)
         {
            this._0E_P_.removeChildAt(0);
         }
         this._0E_P_.addChild(this.guildDisplay);
      }
      
      public function drawRank(param1:int, param2:int, param3:Boolean) : void
      {
         this.stars_ = param1;
         this.rank_ = param2;
         this.admin_ = param3;
         this.initRank();
      }
      
      private function initRank() : void
      {
         this.rankDisplay = new RankDisplay(this.stars_,true,false,this.rank_,this.admin_);
         this.rankDisplay.x = 36;
         this.rankDisplay.y = 4;
         this.rankDisplay.mouseEnabled = true;
         this.rankDisplay.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver);
         this.rankDisplay.addEventListener(MouseEvent.ROLL_OUT,this.onRollOut);
         while(this._1d1.numChildren > 0)
         {
            this._1d1.removeChildAt(0);
         }
         this._1d1.addChild(this.rankDisplay);
      }
      
      public function _0V_T_(param1:_0C_M_) : void
      {
         var _loc2_:DisplayObject = null;
         this.accountInfo = param1;
         _loc2_ = param1 as DisplayObject;
         stage;
         _loc2_.x = 800 - 10;
         _loc2_.y = 2;
         while(this._X_O_.numChildren > 0)
         {
            this._X_O_.removeChildAt(0);
         }
         this._X_O_.addChild(_loc2_);
      }
      
      protected function onMouseOver(param1:MouseEvent) : void
      {
         this.tooltip.dispatch(new RankToolTip(this.stars_));
      }
      
      protected function onRollOut(param1:MouseEvent) : void
      {
         this.tooltip.dispatch(null);
      }
   }
}
