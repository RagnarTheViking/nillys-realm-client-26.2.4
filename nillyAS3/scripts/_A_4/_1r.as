package _A_4
{
   import kabam.rotmg.assets.services._0pW_;
   import flash.display.DisplayObject;
   import _0E_T_._0xK_;
   import _0E_T_._Y_F_;
   import com.company.util.TextureLibrary;
   import _T_n._1gJ_;
   import com.company.assembleegameclient.util.Currency;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   
   public class _1r
   {
       
      
      [Inject]
      public var characters:_0pW_;
      
      public function _1r()
      {
         super();
      }
      
      public function make(param1:_0xK_) : Vector.<DisplayObject>
      {
         var _loc2_:Vector.<_Y_F_> = null;
         var _loc3_:int = 0;
         var _loc5_:int = 0;
         _loc2_ = param1._0eX_();
         _loc3_ = _loc2_.length;
         var _loc4_:Vector.<DisplayObject> = new Vector.<DisplayObject>(_loc3_,true);
         while(_loc5_ < _loc3_)
         {
            _loc4_[_loc5_] = this._1fR_(_loc2_[_loc5_]);
            _loc5_++;
         }
         return _loc4_;
      }
      
      private function _1fR_(param1:_Y_F_) : CharacterSkinListItem
      {
         var _loc2_:CharacterSkinListItem = new CharacterSkinListItem();
         _loc2_._S_E_(this.makeIcon(param1));
         _loc2_._0P_L_(param1);
         _loc2_._1__9(TextureLibrary.getBitmap("lofiInterface2",5));
         _loc2_._up(this._6d());
         return _loc2_;
      }
      
      private function _6d() : _1gJ_
      {
         return new _1gJ_("",16,0,Currency.GOLD);
      }
      
      private function makeIcon(param1:_Y_F_) : Bitmap
      {
         var _loc2_:BitmapData = this.characters.makeIcon(param1._0C_3);
         return new Bitmap(_loc2_);
      }
   }
}
