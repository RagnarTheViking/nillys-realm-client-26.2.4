package _tZ_
{
   import flash.display.Sprite;
   import _aW_.IWebRequest;
   import _1gF_.SimpleText;
   import com.company.ui._0H_R_;
   import flash.display.Bitmap;
   import flash.display.Shape;
   import com.company.assembleegameclient.ui.ScrollBar;
   import flash.display.Graphics;
   import flash.filters.DropShadowFilter;
   import com.company.assembleegameclient.util.GuildUtil;
   import _1xa._dU_;
   import _C_._1O_I_;
   import flash.text.TextFieldAutoSize;
   import flash.events.Event;
   import _0H_6.GameContext;
   import _4u.Account;
   import com.company.util._l5;
   
   public class GuildPlayerList extends Sprite
   {
       
      
      private var rosterSize:int;
      
      private var offset:int;
      
      private var playerName:String;
      
      private var playerRank:int;
      
      private var webRequest:IWebRequest;
      
      private var loadingText:SimpleText;
      
      private var guildName:_0H_R_;
      
      private var guildFame:_0H_R_;
      
      private var guildFameIcon:Bitmap;
      
      private var separator:Shape;
      
      private var listContainer:Sprite;
      
      private var memberEntryList:Sprite;
      
      private var openSlotsText:SimpleText;
      
      private var scrollBar:ScrollBar;
      
      public function GuildPlayerList(param1:int, param2:int, param3:String = "", param4:int = 0)
      {
         super();
         this.rosterSize = param1;
         this.offset = param2;
         this.playerName = param3;
         this.playerRank = param4;
         this.loadingText = new SimpleText().setSize(22).setColor(11776947);
         this.loadingText.setBold(true);
         this.loadingText.setStringBuilder(new _dU_().setParams(_1O_I_._0jq));
         this.loadingText.filters = [new DropShadowFilter(0,0,0,1,8,8)];
         this.loadingText.setAutoSize(TextFieldAutoSize.CENTER).setVerticalAlign(SimpleText.MIDDLE);
         this.loadingText.x = 800 / 2;
         this.loadingText.y = 550;
         addChild(this.loadingText);
         var _loc5_:Account = GameContext.getInjector().getInstance(Account);
         var _loc6_:Object = {
            "num":param1,
            "offset":param2
         };
         _l5._0an(_loc6_,_loc5_.credentials());
         this.webRequest = GameContext.getInjector().getInstance(IWebRequest);
         this.webRequest._R_L_(2);
         this.webRequest.complete.addOnce(this.onComplete);
         this.webRequest.sendRequest("/guild/listMembers",_loc6_);
      }
      
      private function onComplete(param1:Boolean, param2:*) : void
      {
         if(param1)
         {
            this.onSuccess(param2);
         }
         else
         {
            this.onFail(param2);
         }
      }
      
      private function onSuccess(param1:String) : void
      {
         this.build(XML(param1));
      }
      
      private function onFail(param1:String) : void
      {
      }
      
      private function build(param1:XML) : void
      {
         var _loc2_:Graphics = null;
         var _loc3_:XML = null;
         var _loc4_:int = 0;
         var _loc5_:* = false;
         var _loc6_:int = 0;
         var _loc7_:_0sO_ = null;
         removeChild(this.loadingText);
         this.guildName = new _0H_R_(32,11776947,false,0,0);
         this.guildName.setBold(true);
         this.guildName.text = param1.@name;
         this.guildName._13s();
         this.guildName.filters = [new DropShadowFilter(0,0,0,1,8,8)];
         this.guildName.y = 24;
         stage;
         this.guildName.x = 800 / 2 - this.guildName.width / 2;
         addChild(this.guildName);
         this.guildFame = new _0H_R_(22,16777215,false,0,0);
         this.guildFame.text = param1.CurrentFame;
         this.guildFame._13s();
         this.guildFame.filters = [new DropShadowFilter(0,0,0,1,8,8)];
         this.guildFame.x = 768 - this.guildFame.width;
         this.guildFame.y = 32 / 2 - this.guildFame.height / 2;
         addChild(this.guildFame);
         this.guildFameIcon = new Bitmap(GuildUtil._0ge(40));
         this.guildFameIcon.x = 760;
         this.guildFameIcon.y = 32 / 2 - this.guildFameIcon.height / 2;
         addChild(this.guildFameIcon);
         this.separator = new Shape();
         _loc2_ = this.separator.graphics;
         _loc2_.clear();
         _loc2_.lineStyle(2,5526612);
         _loc2_.moveTo(0,100);
         stage;
         _loc2_.lineTo(800,100);
         _loc2_.lineStyle();
         addChild(this.separator);
         this.listContainer = new Sprite();
         this.listContainer.x = 10;
         this.listContainer.y = 110;
         var _loc8_:Shape = new Shape();
         _loc2_ = _loc8_.graphics;
         _loc2_.beginFill(0);
         _loc2_.drawRect(0,0,_0sO_.WIDTH,430);
         _loc2_.endFill();
         this.listContainer.addChild(_loc8_);
         this.listContainer.mask = _loc8_;
         addChild(this.listContainer);
         this.memberEntryList = new Sprite();
         var _loc9_:int = 0;
         for each(_loc3_ in param1.Member)
         {
            _loc5_ = this.playerName == _loc3_.Name;
            _loc6_ = _loc3_.Rank;
            _loc7_ = new _0sO_(this.offset + _loc9_ + 1,_loc3_.Name,_loc3_.Rank,_loc3_.Fame,_loc5_,this.playerRank,_loc3_.LastSeen);
            _loc7_.y = _loc9_ * _0sO_.HEIGHT;
            this.memberEntryList.addChild(_loc7_);
            _loc9_++;
         }
         _loc4_ = GuildUtil.getRosterSize(param1.HallType) - (this.offset + _loc9_);
         this.openSlotsText = new SimpleText().setSize(22).setColor(11776947);
         this.openSlotsText.setStringBuilder(new _dU_().setParams(_1O_I_._hC_,{"openSlots":_loc4_}));
         this.openSlotsText.filters = [new DropShadowFilter(0,0,0,1,8,8)];
         this.openSlotsText.setAutoSize(TextFieldAutoSize.CENTER);
         this.openSlotsText.x = _0sO_.WIDTH / 2;
         this.openSlotsText.y = _loc9_ * _0sO_.HEIGHT;
         this.memberEntryList.addChild(this.openSlotsText);
         this.listContainer.addChild(this.memberEntryList);
         if(this.memberEntryList.height > 400)
         {
            this.scrollBar = new ScrollBar(16,400);
            this.scrollBar.x = 800 - this.scrollBar.width - 4;
            this.scrollBar.y = 104;
            this.scrollBar._0jj(400,this.memberEntryList.height);
            this.scrollBar.addEventListener(Event.CHANGE,this._0f0);
            addChild(this.scrollBar);
         }
      }
      
      private function _0f0(param1:Event) : void
      {
         this.memberEntryList.y = -this.scrollBar._zH_() * (this.memberEntryList.height - 400);
      }
   }
}
