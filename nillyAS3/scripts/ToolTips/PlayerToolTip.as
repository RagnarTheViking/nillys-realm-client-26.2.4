package ToolTips
{
   import com.company.assembleegameclient.objects.Player;
   import com.company.assembleegameclient.ui._1vJ_;
   import com.company.assembleegameclient.ui.RankDisplay;
   import com.company.assembleegameclient.ui.GuildDisplay;
   import com.company.assembleegameclient.ui.StatusBar;
   import _1gF_.SimpleText;
   import _1O_n._0E_l;
   import _C_._1O_I_;
   import flash.text.TextFieldAutoSize;
   import _1xa._dU_;
   import flash.filters.DropShadowFilter;
   
   public class PlayerToolTip extends ToolTip
   {
       
      
      public var player_:Player;
      
      private var _R_G_:_1vJ_;
      
      private var rank:RankDisplay;
      
      private var guild:GuildDisplay;
      
      private var hpBar:StatusBar;
      
      private var mpBar:StatusBar;
      
      private var click2Open:SimpleText;
      
      private var inventory:_0E_l;
      
      public function PlayerToolTip(param1:Player)
      {
         var _loc2_:int = 0;
         super(3552822,0.5,16777215,1);
         this.player_ = param1;
         this._R_G_ = new _1vJ_(11776947,true,this.player_,true);
         addChild(this._R_G_);
         _loc2_ = 34;
         this.rank = new RankDisplay(this.player_.numStars_,false,true,this.player_.rank_,this.player_.admin_);
         this.rank.x = 6;
         this.rank.y = _loc2_;
         addChild(this.rank);
         _loc2_ = _loc2_ + 30;
         if(param1.guildName_ != null && param1.guildName_ != "")
         {
            this.guild = new GuildDisplay(this.player_.guildName_,this.player_.guildRank_,136);
            this.guild.x = 6;
            this.guild.y = _loc2_ - 2;
            addChild(this.guild);
            _loc2_ = _loc2_ + 30;
         }
         this.hpBar = new StatusBar(176,16,14693428,5526612,_1O_I_._0t9);
         this.hpBar.x = 6;
         this.hpBar.y = _loc2_;
         addChild(this.hpBar);
         _loc2_ = _loc2_ + 24;
         this.mpBar = new StatusBar(176,16,6325472,5526612,_1O_I_._F_u);
         this.mpBar.x = 6;
         this.mpBar.y = _loc2_;
         addChild(this.mpBar);
         _loc2_ = _loc2_ + 24;
         this.inventory = new _0E_l(null,this.player_._01e,this.player_);
         this.inventory.x = 8;
         this.inventory.y = _loc2_;
         addChild(this.inventory);
         _loc2_ = _loc2_ + 52;
         this.click2Open = new SimpleText().setSize(12).setColor(11776947);
         this.click2Open.setAutoSize(TextFieldAutoSize.CENTER);
         this.click2Open.setStringBuilder(new _dU_().setParams(_1O_I_._x3));
         this.click2Open.filters = [new DropShadowFilter(0,0,0)];
         this.click2Open.x = width / 2;
         this.click2Open.y = _loc2_;
         _01T_.push(this.click2Open.textChanged);
         addChild(this.click2Open);
      }
      
      override public function draw() : void
      {
         this.hpBar.draw(this.player_.hp_,this.player_.maxHp_,this.player_.hpBonus_,this.player_._1S_q);
         this.mpBar.draw(this.player_.mp_,this.player_.maxMp_,this.player_.mpBonus_,this.player_._z2);
         this.inventory.setItems(this.player_.inventory_);
         this.rank.draw(this.player_.numStars_,this.player_.rank_,this.player_.admin_);
         super.draw();
      }
   }
}
