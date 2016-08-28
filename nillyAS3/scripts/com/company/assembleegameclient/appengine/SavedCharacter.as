package com.company.assembleegameclient.appengine
{
   import flash.display.BitmapData;
   import com.company.assembleegameclient.util.AnimatedLibrary;
   import com.company.assembleegameclient.util._Z_4;
   import com.company.assembleegameclient.util._18Q_;
   import com.company.assembleegameclient.util.TextureRedrawer;
   import _0R_W_._0R_c;
   import com.company.util._1eD_;
   import flash.geom.ColorTransform;
   import com.company.assembleegameclient.parameters.Parameters;
   import _1F_z._1Z_D_;
   import com.company.assembleegameclient.objects.ObjectLibrary;
   import _0H_6.GameContext;
   import _1F_z._0P_4;
   
   public class SavedCharacter
   {
       
      
      public var _19p:XML;
      
      public var name_:String = null;
      
      private var pet:_1Z_D_;
      
      public function SavedCharacter(param1:XML, param2:String)
      {
         var _loc3_:XML = null;
         var _loc4_:int = 0;
         var _loc5_:_1Z_D_ = null;
         super();
         this._19p = param1;
         this.name_ = param2;
         if(this._19p.hasOwnProperty("Pet"))
         {
            _loc3_ = new XML(this._19p.Pet);
            _loc4_ = _loc3_.@instanceId;
            _loc5_ = GameContext.getInjector().getInstance(_0P_4).getPetVO(_loc4_);
            _loc5_.apply(_loc3_);
            this._1jr(_loc5_);
         }
      }
      
      public static function getImage(param1:SavedCharacter, param2:XML, param3:int, param4:int, param5:Number, param6:Boolean, param7:Boolean) : BitmapData
      {
         var _loc8_:_Z_4 = AnimatedLibrary._0B_e(String(param2.AnimatedTexture.File),int(param2.AnimatedTexture.Index));
         var _loc9_:_18Q_ = _loc8_.imageFromDir(param3,param4,param5);
         var _loc10_:int = param1 != null?int(param1.tex1()):int(null);
         var _loc11_:int = param1 != null?int(param1.tex2()):int(null);
         var _loc12_:BitmapData = TextureRedrawer.resize(_loc9_.image_,_loc9_.mask_,100,false,_loc10_,_loc11_);
         _loc12_ = _0R_c._1iY_(_loc12_,0);
         if(!param6)
         {
            _loc12_ = _1eD_._6U_(_loc12_,new ColorTransform(0,0,0,0.5,0,0,0,0));
         }
         else if(!param7)
         {
            _loc12_ = _1eD_._6U_(_loc12_,new ColorTransform(0.75,0.75,0.75,1,0,0,0,0));
         }
         return _loc12_;
      }
      
      public static function _zg(param1:SavedCharacter, param2:SavedCharacter) : Number
      {
         var _loc3_:Number = !!Parameters.data_.charIdUseMap.hasOwnProperty(param1.charId())?Number(Parameters.data_.charIdUseMap[param1.charId()]):Number(0);
         var _loc4_:Number = !!Parameters.data_.charIdUseMap.hasOwnProperty(param2.charId())?Number(Parameters.data_.charIdUseMap[param2.charId()]):Number(0);
         if(_loc3_ != _loc4_)
         {
            return _loc4_ - _loc3_;
         }
         return param2._0bi() - param1._0bi();
      }
      
      public function charId() : int
      {
         return int(this._19p.@id);
      }
      
      public function name() : String
      {
         return this.name_;
      }
      
      public function objectType() : int
      {
         return int(this._19p.ObjectType);
      }
      
      public function skinType() : int
      {
         return int(this._19p.Texture);
      }
      
      public function level() : int
      {
         return int(this._19p.Level);
      }
      
      public function tex1() : int
      {
         return int(this._19p.Tex1);
      }
      
      public function tex2() : int
      {
         return int(this._19p.Tex2);
      }
      
      public function _0bi() : int
      {
         return int(this._19p.Exp);
      }
      
      public function fame() : int
      {
         return int(this._19p.CurrentFame);
      }
      
      public function _0rS_() : String
      {
         return ObjectLibrary._O_S_[this.objectType()];
      }
      
      public function getPetVO() : _1Z_D_
      {
         return this.pet;
      }
      
      public function _1jr(param1:_1Z_D_) : void
      {
         this.pet = param1;
      }
   }
}
