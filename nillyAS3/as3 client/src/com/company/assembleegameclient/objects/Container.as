package com.company.assembleegameclient.objects
{
   import com.company.assembleegameclient.map.Map;
   import com.company.util.PointUtil;
   import _ll.SFX;
   import _0Z_1.Panel;
   import com.company.assembleegameclient.game.GameSprite;
   import _1O_n._u0;
   
   public class Container extends GameObject implements _1kF_
   {
       
      
      public var _0M_z:Boolean;
      
      public var ownerId_:String;
      
      public function Container(param1:XML)
      {
         super(param1);
         _1kM_ = true;
         this._0M_z = param1.hasOwnProperty("Loot");
         this.ownerId_ = "";
      }
      
      public function _1e4(param1:String) : void
      {
         this.ownerId_ = param1;
         _1kM_ = this.ownerId_ == "" || this._1U_7();
      }
      
      public function _1U_7() : Boolean
      {
         return map_.player_.accountId_ == this.ownerId_;
      }
      
      override public function addTo(param1:Map, param2:Number, param3:Number) : Boolean
      {
         if(!super.addTo(param1,param2,param3))
         {
            return false;
         }
         if(map_.player_ == null)
         {
            return true;
         }
         var _loc4_:Number = PointUtil.getDistance(map_.player_.x_,map_.player_.y_,param2,param3);
         if(this._0M_z && _loc4_ < 10)
         {
            SFX.play("loot_appears");
         }
         return true;
      }
      
      public function getPanel(param1:GameSprite) : Panel
      {
         var _loc2_:Player = param1 && param1.map?param1.map.player_:null;
         return new _u0(this,_loc2_);
      }
   }
}
