package com.company.assembleegameclient.screens.charrects
{
   import flash.display.Bitmap;
   import com.company.assembleegameclient.objects.ObjectLibrary;
   import com.company.assembleegameclient.appengine.SavedCharacter;
   import com.company.assembleegameclient.util._Z_4;
   import flash.display.BitmapData;
   import com.company.util.BitmapUtil;
   import _v4.Client;
   import _1xa._dU_;
   import _C_._1O_I_;
   import com.company.assembleegameclient.util.Star;
   
   public class CreateNewCharacterRect extends CharacterRect
   {
       
      
      private var bitmap_:Bitmap;
      
      public function CreateNewCharacterRect(param1:Client)
      {
         var _loc2_:int = 0;
         super();
         super.className = new _dU_().setParams(_1O_I_._0D_p);
         super.color = 5526612;
         super.overColor = 7829367;
         super.init();
         this.makeBitmap();
         if(param1.getNumStars() != Star._0xr())
         {
            _loc2_ = Star._0xr() - param1.getNumStars();
            super.makeTaglineIcon();
            super.makeTaglineText(new _dU_().setParams(_1O_I_._0nX_,{"remainingStars":_loc2_}));
            taglineText.x = taglineText.x + taglineIcon.width;
         }
      }
      
      public function makeBitmap() : void
      {
         var _loc1_:XML = ObjectLibrary._1bS_[int(ObjectLibrary._1bS_.length * Math.random())];
         var _loc2_:BitmapData = SavedCharacter.getImage(null,_loc1_,_Z_4.RIGHT,_Z_4._M_J_,0,false,false);
         _loc2_ = BitmapUtil._0P_V_(_loc2_,6,6,_loc2_.width - 12,_loc2_.height - 6);
         this.bitmap_ = new Bitmap();
         this.bitmap_.bitmapData = _loc2_;
         this.bitmap_.x = CharacterRectConstants.ICON_POS_X;
         this.bitmap_.y = CharacterRectConstants.ICON_POS_Y;
         selectContainer.addChild(this.bitmap_);
      }
   }
}
