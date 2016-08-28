package _1S_e
{
   import flash.display.Sprite;
   import _1R_o._Y_5;
   import _1R_o._0xf;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import _1gF_.SimpleText;
   import ToolTips._0bd;
   import com.company.assembleegameclient.game.GameSprite;
   import _1T_4._q6;
   import _1T_4._1K_2;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   import com.company.assembleegameclient.util.TextureRedrawer;
   import com.company.util.TextureLibrary;
   import _T_E_._0Z_v;
   import _1xa._dU_;
   import flash.filters.DropShadowFilter;
   
   public class ArenaDisplay extends Sprite implements _Y_5
   {
      
      public static const ICON_FILE:String = "lofiInterface2";
      
      public static const ICON_INDEX:int = 8;
       
      
      public var noIdeaWhatItIs:_0xf;
      
      private var icon:Bitmap;
      
      private var background:Sprite;
      
      private var iconBitmapData:BitmapData;
      
      private var text:SimpleText;
      
      private var tooltip:_0bd;
      
      private var gs:GameSprite;
      
      private var menu:ArenaMenu;
      
      public function ArenaDisplay(param1:GameSprite)
      {
         var _loc2_:Rectangle = null;
         var _loc3_:int = 0;
         this.gs = param1;
         this.noIdeaWhatItIs = new _0xf();
         this.tooltip = new _0bd(3552822,10197915,null,"Click to see if there are any running arena games.",160);
         super();
         mouseChildren = false;
         this.iconBitmapData = TextureRedrawer.redraw(TextureLibrary.getBitmap(ICON_FILE,ICON_INDEX),40,true,0);
         this.background = _0Z_v._1P_T_();
         this.icon = new Bitmap(this.iconBitmapData);
         this.icon.x = -5;
         this.icon.y = -8;
         this.text = new SimpleText().setSize(16).setColor(16777215);
         this.text.setStringBuilder(new _dU_().setParams("Arena"));
         this.text.filters = [new DropShadowFilter(0,0,0,1,4,4,2)];
         this.text.setVerticalAlign(SimpleText.BOTTOM);
         this.noIdeaWhatItIs._bD_(this);
         this.noIdeaWhatItIs.tooltip = this.tooltip;
         this.addChilds();
         _loc2_ = this.icon.getBounds(this);
         _loc3_ = 10;
         this.text.x = _loc2_.right - _loc3_;
         this.text.y = _loc2_.bottom - _loc3_ - 2;
         addEventListener(MouseEvent.CLICK,this.onClick);
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
         if(this.menu && this.gs.contains(this.menu))
         {
            this.gs.removeChild(this.menu);
         }
         this.menu = new ArenaMenu();
         this.menu.init(this.gs);
         this.gs.addChild(this.menu);
         if(this.tooltip && this.tooltip.parent)
         {
            this.tooltip.parent.removeChild(this.tooltip);
         }
      }
   }
}

import _Y_M_.Menu;
import com.company.assembleegameclient.game.GameSpriteBase;
import _Y_M_.MenuItem;
import _1gF_.SimpleText;
import _1S_e.ArenaInfoItem;
import _0H_6.GameContext;
import _1S_e.GlobalArenaInformation;
import _1xa.SText;
import com.company.util.TextureLibrary;
import flash.events.MouseEvent;
import Packets.PacketManagerBase;
import flash.events.Event;
import _1I_S_._0J_a;

class ArenaMenu extends Menu
{
    
   
   public var gs_:GameSpriteBase;
   
   function ArenaMenu()
   {
      super(3552822,16777215);
   }
   
   public function init(param1:GameSpriteBase) : void
   {
      var _loc2_:MenuItem = null;
      var _loc5_:* = null;
      var _loc6_:SimpleText = null;
      var _loc7_:ArenaInfoItem = null;
      var _loc8_:Function = null;
      this.gs_ = param1;
      this.nextMenuItemY = this.nextMenuItemY - 10;
      var _loc3_:GlobalArenaInformation = GameContext.getInjector().getInstance(GlobalArenaInformation);
      var _loc4_:int = 0;
      for(_loc5_ in _loc3_.games)
      {
         _loc4_++;
      }
      _loc6_ = new SimpleText().setSize(14).setColor(16777215).setStringBuilder(new SText((_loc4_ == 0?"No c":"C") + "urrent arena games"));
      addChild(_loc6_);
      for each(_loc7_ in _loc3_.games)
      {
         if(_loc7_.open)
         {
            _loc2_ = new MenuItem(TextureLibrary.getBitmap("lofiInterfaceBig",10),16777215,"Join " + _loc7_.name);
            switch(_loc7_.name)
            {
               case "Oryx Arena":
                  _loc8_ = this.onOryxArenaJoinClick;
                  break;
               case "Public Arena":
                  _loc8_ = this.onPublicArenaJoinClick;
            }
            if(_loc8_ != null)
            {
               _loc2_.addEventListener(MouseEvent.CLICK,_loc8_);
            }
            addMenuItem(_loc2_);
         }
         _loc2_ = new MenuItem(TextureLibrary.getBitmap("lofiInterfaceBig",6),16777215,"Spectate " + _loc7_.name);
         switch(_loc7_.name)
         {
            case "Oryx Arena":
               _loc8_ = this.onOryxArenaSpectateClick;
               break;
            case "Public Arena":
               _loc8_ = this.onPublicArenaSpectateClick;
         }
         if(_loc8_ != null)
         {
            _loc2_.addEventListener(MouseEvent.CLICK,_loc8_);
         }
         addMenuItem(_loc2_);
      }
      _loc2_ = new MenuItem(TextureLibrary.getBitmap("lofiInterfaceBig",8),16777215,"Close");
      _loc2_.addEventListener(MouseEvent.CLICK,this.onCloseClick);
      addMenuItem(_loc2_);
      this.nextMenuItemY = this.nextMenuItemY + 8;
   }
   
   private function onPublicArenaJoinClick(param1:MouseEvent) : void
   {
      PacketManagerBase.instance.playerText("/arena");
      remove();
   }
   
   private function onOryxArenaJoinClick(param1:MouseEvent) : void
   {
      PacketManagerBase.instance.playerText("/oa");
      remove();
   }
   
   private function onPublicArenaSpectateClick(param1:MouseEvent) : void
   {
      PacketManagerBase.instance.playerText("/spectate 1");
      remove();
   }
   
   private function onOryxArenaSpectateClick(param1:MouseEvent) : void
   {
      PacketManagerBase.instance.playerText("/spectate 0");
      remove();
   }
   
   private function _0ac(param1:Event) : void
   {
      var _loc2_:_0J_a = GameContext.getInjector().getInstance(_0J_a);
      _loc2_.dispatch(true,"/g ");
      remove();
   }
   
   private function onCloseClick(param1:MouseEvent) : void
   {
      remove();
   }
}
