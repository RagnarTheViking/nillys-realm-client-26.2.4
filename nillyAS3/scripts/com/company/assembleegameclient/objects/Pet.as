package com.company.assembleegameclient.objects
{
   import _0jo._1aV_;
   import _1F_z._1Z_D_;
   import com.company.assembleegameclient.util._Z_4;
   import _1F_z._0P_4;
   import ToolTips.ToolTip;
   import ToolTips._0bd;
   import _C_._1O_I_;
   import _0Z_1.Panel;
   import com.company.assembleegameclient.game.GameSprite;
   import _1oP_.PetPanel;
   import com.company.assembleegameclient.util._18Q_;
   import com.company.assembleegameclient.util.AnimatedLibrary;
   import _0H_6.GameContext;
   
   public class Pet extends GameObject implements _1kF_
   {
       
      
      private var _1K_4:_1aV_;
      
      public var _W_d:_1Z_D_;
      
      public var skin:_Z_4;
      
      public var _0hk:_Z_4;
      
      public var _0yP_:int;
      
      public var _08X_:Boolean = false;
      
      private var _0xI_:_0P_4;
      
      public function Pet(param1:XML)
      {
         super(param1);
         _1kM_ = true;
         this._1K_4 = GameContext.getInjector().getInstance(_1aV_);
         this._0xI_ = GameContext.getInjector().getInstance(_0P_4);
         this._0xI_._0T_T_();
      }
      
      public function getTooltip() : ToolTip
      {
         return new _0bd(3552822,10197915,_1O_I_._0py,_1O_I_._185,200);
      }
      
      public function getPanel(param1:GameSprite) : Panel
      {
         return new PetPanel(param1,this._W_d);
      }
      
      public function _S_E_(param1:int) : void
      {
         var _loc2_:_18Q_ = null;
         this._0yP_ = param1;
         var _loc3_:XML = ObjectLibrary._0W_b(ObjectLibrary._M_(param1));
         var _loc4_:String = _loc3_.AnimatedTexture.File;
         var _loc5_:int = _loc3_.AnimatedTexture.Index;
         if(this.skin == null)
         {
            this._08X_ = true;
            this.skin = AnimatedLibrary._0B_e(_loc4_,_loc5_);
            this._0hk = this.skin;
         }
         else
         {
            this.skin = AnimatedLibrary._0B_e(_loc4_,_loc5_);
         }
         this._08X_ = this.skin == this._0hk;
         _loc2_ = this.skin.imageFromAngle(0,_Z_4._M_J_,0);
         _1vr = this.skin;
         texture_ = _loc2_.image_;
         mask_ = _loc2_.mask_;
      }
      
      public function _gM_() : void
      {
         var _loc1_:_18Q_ = null;
         this._0yP_ = -1;
         if(this._0hk == null)
         {
            return;
         }
         _loc1_ = this._0hk.imageFromAngle(0,_Z_4._M_J_,0);
         this._08X_ = true;
         _1vr = this._0hk;
         texture_ = _loc1_.image_;
         mask_ = _loc1_.mask_;
      }
   }
}
