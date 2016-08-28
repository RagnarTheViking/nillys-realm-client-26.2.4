package kabam.rotmg.assets.services
{
   import com.company.assembleegameclient.util._Z_4;
   import kabam.rotmg.assets.model._0V_v;
   import com.company.assembleegameclient.util.AnimatedLibrary;
   import flash.display.BitmapData;
   import _0R_W_._0R_c;
   import com.company.util.BitmapUtil;
   import kabam.rotmg.assets.model.Animation;
   import com.company.assembleegameclient.util._18Q_;
   import com.company.assembleegameclient.util.TextureRedrawer;
   
   public class _0pW_
   {
       
      
      private var texture1:int;
      
      private var texture2:int;
      
      private var size:int;
      
      public function _0pW_()
      {
         super();
      }
      
      public function _0wx(param1:_0V_v) : _Z_4
      {
         return AnimatedLibrary._0B_e(param1.file,param1.index);
      }
      
      public function makeIcon(param1:_0V_v, param2:int = 100, param3:int = 0, param4:int = 0) : BitmapData
      {
         this.texture1 = param3;
         this.texture2 = param4;
         this.size = param2;
         var _loc5_:_Z_4 = this._0wx(param1);
         var _loc6_:BitmapData = this._w3(_loc5_,_Z_4._M_J_,0);
         _loc6_ = _0R_c._1iY_(_loc6_,0);
         _loc6_ = BitmapUtil._0P_V_(_loc6_,6,6,_loc6_.width - 12,_loc6_.height - 6);
         return _loc6_;
      }
      
      public function _1iy(param1:_0V_v, param2:int = 100, param3:int = 0, param4:int = 0) : Animation
      {
         this.texture1 = param3;
         this.texture2 = param4;
         this.size = param2;
         var _loc5_:_Z_4 = this._0wx(param1);
         var _loc6_:BitmapData = this._w3(_loc5_,_Z_4._E_S_,0.5);
         _loc6_ = _0R_c._1iY_(_loc6_,0);
         var _loc7_:BitmapData = this._w3(_loc5_,_Z_4._E_S_,0);
         _loc7_ = _0R_c._1iY_(_loc7_,0);
         var _loc8_:Animation = new Animation();
         _loc8_._B_4(_loc6_,_loc7_);
         return _loc8_;
      }
      
      private function _w3(param1:_Z_4, param2:int, param3:Number) : BitmapData
      {
         var _loc4_:_18Q_ = param1.imageFromDir(_Z_4.RIGHT,param2,param3);
         return TextureRedrawer.resize(_loc4_.image_,_loc4_.mask_,this.size,false,this.texture1,this.texture2);
      }
   }
}
