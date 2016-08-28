package _17B_
{
   import _1F_z._1Z_D_;
   import flash.display.BitmapData;
   import flash.display.Bitmap;
   import com.company.assembleegameclient.util.TextureRedrawer;
   import _0R_W_._0R_c;
   
   public class _0o
   {
       
      
      public var _0X_m:Number = 1.4;
      
      public function _0o()
      {
         super();
      }
      
      public function create(param1:_1Z_D_, param2:int) : _I_4
      {
         var _loc3_:BitmapData = this._0nY_(param1,param2);
         var _loc4_:Bitmap = new Bitmap(_loc3_);
         var _loc5_:_I_4 = new _I_4(param1);
         _loc5_._06K_(_loc4_);
         return _loc5_;
      }
      
      public function _0nY_(param1:_1Z_D_, param2:int) : BitmapData
      {
         var _loc3_:Number = NaN;
         var _loc4_:BitmapData = null;
         var _loc5_:BitmapData = !!param1._0eu()?param1._0eu().image_:null;
         if(_loc5_)
         {
            _loc3_ = (param2 - TextureRedrawer._13K_) / _loc5_.width;
            _loc4_ = TextureRedrawer.resize(_loc5_,param1._0eu().mask_,100,true,0,0,_loc3_);
            _loc4_ = _0R_c._1iY_(_loc4_,0,this._0X_m);
            return _loc4_;
         }
         return new _1wr(param2,param2);
      }
   }
}
