package _1F_z
{
   import com.company.assembleegameclient.objects.ObjectLibrary;
   import _f7.Signal;
   import com.company.assembleegameclient.util._Z_4;
   import flash.display.Bitmap;
   import com.company.assembleegameclient.util._18Q_;
   import com.company.assembleegameclient.util.TextureRedrawer;
   import flash.display.BitmapData;
   import _0R_W_._0R_c;
   import com.company.assembleegameclient.util.AnimatedLibrary;
   
   public class _1Z_D_
   {
       
      
      public const _aL_:Signal = new Signal();
      
      private var _1gP_:XML;
      
      private var id:int;
      
      private var type:int;
      
      private var rarity:String;
      
      private var name:String;
      
      private var _1jb:int;
      
      public var _0qB_:Array;
      
      private var skinID:int;
      
      private var skin:_Z_4;
      
      public function _1Z_D_(param1:int = undefined)
      {
         this._0qB_ = [new _gC_(),new _gC_(),new _gC_()];
         super();
         this.id = param1;
         this._1gP_ = <data/>;
         this._0zk();
      }
      
      private static function _1C_A_(param1:int) : String
      {
         return ObjectLibrary._0W_A_(param1).Description;
      }
      
      private static function _045(param1:int) : String
      {
         return ObjectLibrary._0W_A_(param1).DisplayId;
      }
      
      public static function clone(param1:_1Z_D_) : _1Z_D_
      {
         return new _1Z_D_(param1.id);
      }
      
      private function _0zk() : void
      {
         var _loc1_:_gC_ = null;
         for each(_loc1_ in this._0qB_)
         {
            _loc1_._aL_.add(this._01a);
         }
      }
      
      public function _0bZ_() : Boolean
      {
         var _loc1_:_gC_ = null;
         var _loc2_:int = 0;
         for each(_loc1_ in this._0qB_)
         {
            if(_loc1_.level == 100)
            {
               _loc2_++;
            }
         }
         return _loc2_ == this._0qB_.length;
      }
      
      private function _01a(param1:_gC_) : void
      {
         this._aL_.dispatch();
      }
      
      public function apply(param1:XML) : void
      {
         this._0tH_(param1);
         this._0lV_(param1);
      }
      
      private function _0tH_(param1:XML) : void
      {
         param1.@type && this.setType(param1.@type);
         param1.@name && this.setName(param1.@name);
         param1.@skin && this._S_E_(param1.@skin);
         param1.@rarity && this._d(param1.@rarity);
      }
      
      public function _0lV_(param1:XML) : void
      {
         var _loc2_:uint = 0;
         var _loc3_:_gC_ = null;
         var _loc4_:int = 0;
         var _loc5_:uint = this._0qB_.length;
         _loc2_ = 0;
         while(_loc2_ < _loc5_)
         {
            _loc3_ = this._0qB_[_loc2_];
            _loc4_ = param1.Abilities.Ability[_loc2_].@type;
            _loc3_.name = _045(_loc4_);
            _loc3_.description = _1C_A_(_loc4_);
            _loc3_.level = param1.Abilities.Ability[_loc2_].@power;
            _loc3_.points = param1.Abilities.Ability[_loc2_].@points;
            _loc2_++;
         }
      }
      
      public function _1lu() : String
      {
         return this._1gP_.Family;
      }
      
      public function setID(param1:int) : void
      {
         this.id = param1;
      }
      
      public function _0__5() : int
      {
         return this.id;
      }
      
      public function setType(param1:int) : void
      {
         this.type = param1;
         this._1gP_ = ObjectLibrary.XmlData[this.type];
      }
      
      public function getType() : int
      {
         return this.type;
      }
      
      public function _d(param1:uint) : void
      {
         this.rarity = _1r__._162(param1).value;
         this._1nM_(param1);
         this._aL_.dispatch();
      }
      
      private function _1nM_(param1:uint) : void
      {
         this._0qB_[0].setUnlocked(true);
         this._0qB_[1].setUnlocked(param1 >= _1r__._b0._V_B_);
         this._0qB_[2].setUnlocked(param1 >= _1r__._1Z_n._V_B_);
      }
      
      public function _1b8() : String
      {
         return this.rarity;
      }
      
      public function setName(param1:String) : void
      {
         this.name = param1;
         this._aL_.dispatch();
      }
      
      public function getName() : String
      {
         return this.name;
      }
      
      public function _r5(param1:int) : void
      {
         this._1jb = param1;
         this._aL_.dispatch();
      }
      
      public function _0he() : int
      {
         return this._1jb;
      }
      
      public function _S_E_(param1:int) : void
      {
         this.skinID = param1;
         this._aL_.dispatch();
      }
      
      public function _0G_I_() : int
      {
         return this.skinID;
      }
      
      public function _nV_() : Bitmap
      {
         this._0R_v();
         var _loc1_:_18Q_ = this.skin.imageFromAngle(0,_Z_4._M_J_,0);
         var _loc2_:int = this.rarity == _1r__._99.value?40:80;
         var _loc3_:BitmapData = TextureRedrawer.resize(_loc1_.image_,_loc1_.mask_,_loc2_,true,0,0);
         _loc3_ = _0R_c._1iY_(_loc3_,0);
         return new Bitmap(_loc3_);
      }
      
      public function _0eu() : _18Q_
      {
         this._0R_v();
         return !!this.skin?this.skin.imageFromAngle(0,_Z_4._M_J_,0):null;
      }
      
      private function _0R_v() : void
      {
         var _loc1_:XML = ObjectLibrary._0W_b(ObjectLibrary._M_(this.skinID));
         var _loc2_:String = _loc1_.AnimatedTexture.File;
         var _loc3_:int = _loc1_.AnimatedTexture.Index;
         this.skin = AnimatedLibrary._0B_e(_loc2_,_loc3_);
      }
   }
}
