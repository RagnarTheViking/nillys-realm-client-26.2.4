package _1S_e
{
import _1uq.JSON;

import flash.display.Sprite;
   import _1R_o._Y_5;
   import com.company.assembleegameclient.parameters.Parameters;
   import _1R_o._0xf;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import _1gF_.SimpleText;
   import ToolTips._0bd;
   import com.company.assembleegameclient.game.GameSprite;
   import _1T_4._q6;
   import _1T_4._1K_2;
   import flash.events.MouseEvent;
   import PrivateMessages.SendMessageFrame;
   import PrivateMessages.ViewPrivateMessagesFrame;
   import flash.events.Event;
   import _0H_6.GameContext;
   import _4u.Account;
   import _aW_.IWebRequest;
   import flash.geom.Rectangle;
   import com.company.assembleegameclient.util.TextureRedrawer;
   import com.company.util.TextureLibrary;
   import _T_E_._0Z_v;
   import _1xa._dU_;
   import flash.filters.DropShadowFilter;
   
   public class PrivateMessageDisplay extends Sprite implements _Y_5
   {
      
      public static const ICON_FILE:String = "lofiInterface2";
      
      public static const ICON_INDEX:int = 32;
       
      
      public var noIdeaWhatItIs:_0xf;
      
      private var icon:Bitmap;
      
      private var background:Sprite;
      
      private var iconBitmapData:BitmapData;
      
      private var text:SimpleText;
      
      private var tooltip:_0bd;
      
      private var gs:GameSprite;
      
      private var messages:Array;
      
      public function PrivateMessageDisplay(param1:GameSprite)
      {
         this.gs = param1;
         this.noIdeaWhatItIs = new _0xf();
         this.tooltip = new _0bd(3552822,10197915,null,"Click to open the private messages screen.",150);
         super();
         mouseChildren = false;
         this.iconBitmapData = TextureRedrawer.redraw(TextureLibrary.getBitmap(ICON_FILE,ICON_INDEX),40,true,0);
         this.background = _0Z_v._1P_T_();
         this.icon = new Bitmap(this.iconBitmapData);
         this.icon.x = -5;
         this.icon.y = -8;
         this.text = new SimpleText().setSize(16).setColor(16777215);
         this.text.setStringBuilder(new _dU_().setParams("Messages"));
         this.text.filters = [new DropShadowFilter(0,0,0,1,4,4,2)];
         this.text.setVerticalAlign(SimpleText.BOTTOM);
         this.noIdeaWhatItIs._bD_(this);
         this.noIdeaWhatItIs.tooltip = this.tooltip;
         this.addChilds();
         addEventListener(MouseEvent.CLICK,this.onClick);
         this.reposition();
         this.refresh();
      }
      
      private static function countNewMessages(param1:Array) : int
      {
         var _loc2_:int = 0;
         var _loc3_:Object = null;
         if(!param1)
         {
            return 0;
         }
         for each(_loc3_ in param1)
         {
            if(!Parameters.data_.privateMessages[_loc3_.receiveTime])
            {
               _loc2_++;
            }
         }
         return _loc2_;
      }
      
      public function _0A_A_(param1:_q6) : void
      {
         this.noIdeaWhatItIs._0A_A_(param1);
      }
      
      public function _23() : _q6
      {
         return this.noIdeaWhatItIs._23();
      }
      
      public function _0hm(param1:_1K_2) : void
      {
         this.noIdeaWhatItIs._0hm(param1);
      }
      
      public function _fn() : _1K_2
      {
         return this.noIdeaWhatItIs._fn();
      }
      
      public function addChilds() : void
      {
         addChild(this.background);
         addChild(this.text);
         addChild(this.icon);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         if(SendMessageFrame.instance)
         {
            SendMessageFrame.instance.blink();
            return;
         }
         var _loc2_:ViewPrivateMessagesFrame = new ViewPrivateMessagesFrame(this.gs,this.messages);
         _loc2_.addEventListener(Event.REMOVED_FROM_STAGE,this.viewRemoved);
         this.gs.addChild(_loc2_);
      }
      
      private function viewRemoved(param1:Event) : void
      {
         this.reposition();
      }
      
      public function refresh() : void
      {
         var _loc1_:Account = GameContext.getInjector().getInstance(Account);
         var _loc2_:IWebRequest = GameContext.getInjector().getInstance(IWebRequest);
         _loc2_.complete.addOnce(this.onMessagesGet);
         _loc2_.sendRequest("/privateMessage/list",_loc1_.credentials());
      }
      
      private function onMessagesGet(param1:Boolean, param2:*) : void
      {
         if(!param1)
         {
            return;
         }
         var _loc3_:Object = _1uq.JSON.decode(param2.toString());
         this.messages = _loc3_.messages;
         this.reposition();
      }
      
      private function reposition() : void
      {
         var _loc1_:int = countNewMessages(this.messages);
         this.icon.visible = _loc1_ > 0;
         var _loc2_:Rectangle = this.icon.getBounds(this);
         var _loc3_:int = 10;
         this.text.x = _loc1_ == 0?Number(5):Number(_loc2_.right - _loc3_);
         this.text.y = _loc2_.bottom - _loc3_ - 2;
      }
   }
}
