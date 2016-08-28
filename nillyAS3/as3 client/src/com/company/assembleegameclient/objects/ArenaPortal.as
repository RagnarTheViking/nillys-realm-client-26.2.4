package com.company.assembleegameclient.objects
{
   import _0Z_1.Panel;
   import com.company.assembleegameclient.game.GameSprite;
   import _0Z_1.ArenaPortalPanel;
   import flash.display.IGraphicsData;
   import com.company.assembleegameclient.map.View;
   import flash.display.BitmapData;
   import _1xa.SText;
   import _1xa._1eo;
   import _0H_6.GameContext;
   import _1gF_._0ke;
   
   public class ArenaPortal extends Portal implements _1kF_
   {
       
      
      public function ArenaPortal(param1:XML)
      {
         super(param1);
         _1kM_ = true;
         name_ = "";
      }
      
      override public function getPanel(param1:GameSprite) : Panel
      {
         return new ArenaPortalPanel(param1,this);
      }
      
      override public function draw(param1:Vector.<IGraphicsData>, param2:View, param3:int) : void
      {
         super.draw(param1,param2,param3);
         _1si(param1,param2);
      }
      
      override protected function makeNameBitmapData() : BitmapData
      {
         var _loc1_:_1eo = new SText(name_);
         var _loc2_:_0ke = GameContext.getInjector().getInstance(_0ke);
         return _loc2_.make(_loc1_,16,16777215,true,_0L_P_,true);
      }
   }
}
