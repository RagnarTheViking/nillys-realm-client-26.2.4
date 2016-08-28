package com.company.assembleegameclient.objects
{
   import flash.display.BitmapData;
   import _1xa._1eo;
   import _0H_6.GameContext;
   import _1gF_._0ke;
   import flash.display.IGraphicsData;
   import com.company.assembleegameclient.map.View;
   import _0Z_1.Panel;
   import com.company.assembleegameclient.game.GameSprite;
   import _0Z_1.PortalPanel;
   
   public class Portal extends GameObject implements _1kF_
   {
      
      private static const _0P_G_:RegExp = /(^\s+)\s\(([0-9]+)\/[0-9]+\)/;
       
      
      public var _D_z:Boolean;
      
      public var _0Z_9:Boolean;
      
      public var usable_:Boolean = true;
      
      public function Portal(param1:XML)
      {
         super(param1);
         _1kM_ = true;
         this._D_z = param1.hasOwnProperty("NexusPortal");
         this._0Z_9 = param1.hasOwnProperty("LockedPortal");
      }
      
      override protected function makeNameBitmapData() : BitmapData
      {
         var _loc1_:Array = name_.match(_0P_G_);
         var _loc2_:_1eo = new _0iZ_().makeBuilder(name_);
         var _loc3_:_0ke = GameContext.getInjector().getInstance(_0ke);
         return _loc3_.make(_loc2_,16,16777215,true,_0L_P_,true);
      }
      
      override public function draw(param1:Vector.<IGraphicsData>, param2:View, param3:int) : void
      {
         super.draw(param1,param2,param3);
         if(this._D_z)
         {
            _1si(param1,param2);
         }
      }
      
      public function getPanel(param1:GameSprite) : Panel
      {
         return new PortalPanel(param1,this);
      }
   }
}
