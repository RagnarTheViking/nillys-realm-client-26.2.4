package _0xn
{
   import _17B_._1dh;
   import _17B_._0P_T_;
   import _17B_._3X_;
   import _17B_.PetAbilityMeter;
   import _1gF_.SimpleText;
   import _1xa._dU_;
   import _C_._1O_I_;
   import flash.text.TextFormatAlign;
   import flash.filters.DropShadowFilter;
   import _17B_.PetFeeder;
   import _17B_.PetFuser;
   import _17B_._0rX_;
   import _4Z_._6z;
   import _4Z_._1T_i;
   import flash.display.Shape;
   import _17B_.XImageButton;
   import com.company.assembleegameclient.ui._0fL_;
   import flash.display.Bitmap;
   import com.company.assembleegameclient.objects.ObjectLibrary;
   import flash.display.BitmapData;
   import com.company.util.BitmapUtil;
   import _17B_.FusionStrength;
   
   public class _1uk
   {
       
      
      public function _1uk()
      {
         super();
      }
      
      public static function _0P_d(param1:uint, param2:uint) : _1dh
      {
         var _loc3_:_1dh = new _1dh();
         _loc3_.draw(param1,param2);
         _loc3_._0yq(_1dh.HORIZONTAL_DIVISION,_bf._0zv);
         _loc3_._0yq(_1dh.HORIZONTAL_DIVISION,_bf._0H_E_);
         return _loc3_;
      }
      
      public static function _1H_() : _1dh
      {
         var _loc1_:_1dh = new _1dh();
         _loc1_.draw(_bf._0Y_O_,_bf._108);
         _loc1_._0yq(_1dh.HORIZONTAL_DIVISION,_bf._0zv);
         _loc1_._0yq(_1dh.HORIZONTAL_DIVISION,_bf._dD_);
         return _loc1_;
      }
      
      public static function _0N_s(param1:String, param2:uint) : _0P_T_
      {
         var _loc3_:_0P_T_ = new _0P_T_();
         _loc3_.y = param2;
         _loc3_.setPrefix(param1);
         return _loc3_;
      }
      
      public static function _pE_() : _3X_
      {
         var _loc1_:_3X_ = null;
         _loc1_ = new _3X_();
         _loc1_.y = _bf._L_v - 35;
         return _loc1_;
      }
      
      private static function _0jM_() : PetAbilityMeter
      {
         var _loc1_:PetAbilityMeter = null;
         _loc1_ = new PetAbilityMeter();
         _loc1_.y = _bf._1y6;
         return _loc1_;
      }
      
      public static function _0R_k() : Vector.<PetAbilityMeter>
      {
         return Vector.<PetAbilityMeter>([_0jM_(),_0jM_(),_0jM_()]);
      }
      
      public static function _1P_t() : SimpleText
      {
         var _loc1_:SimpleText = new SimpleText();
         _loc1_.setStringBuilder(new _dU_().setParams(_1O_I_._W_s));
         _loc1_.setTextWidth(_bf._0Y_O_ - 20).setWordWrap(true).setHorizontalAlign(TextFormatAlign.CENTER).setSize(_bf._1g1).setColor(11776947);
         _loc1_.y = 42;
         return _loc1_;
      }
      
      public static function _1P_k() : SimpleText
      {
         var _loc1_:SimpleText = null;
         _loc1_ = new SimpleText();
         _loc1_.setSize(_bf._1g1).setColor(11776947).setBold(true).setHorizontalAlign(TextFormatAlign.CENTER).setWordWrap(true).setTextWidth(100);
         _loc1_.filters = [new DropShadowFilter(0,0,0)];
         _loc1_.y = _bf._vz;
         return _loc1_;
      }
      
      public static function _gZ_(param1:uint, param2:uint) : SimpleText
      {
         var _loc3_:SimpleText = new SimpleText();
         _loc3_.setSize(_bf._1g1).setColor(param1).setBold(true).setHorizontalAlign(TextFormatAlign.CENTER).setWordWrap(true).setTextWidth(param2);
         return _loc3_;
      }
      
      public static function _120() : PetFeeder
      {
         var _loc1_:PetFeeder = new PetFeeder();
         _loc1_.y = _bf._175;
         return _loc1_;
      }
      
      public static function _00w() : PetFuser
      {
         var _loc1_:PetFuser = new PetFuser();
         _loc1_.y = _bf._175 + 50;
         return _loc1_;
      }
      
      public static function _1U_a() : _0rX_
      {
         var _loc1_:_0rX_ = null;
         _loc1_ = new _0rX_();
         _loc1_.x = _bf._16m;
         _loc1_.y = _bf._1qy;
         return _loc1_;
      }
      
      public static function _0O_Z_() : _6z
      {
         var _loc1_:_6z = new _6z();
         _loc1_.x = _bf._16m + 35;
         _loc1_._1vP_(true);
         return _loc1_;
      }
      
      public static function _8p() : _1T_i
      {
         var _loc1_:_1T_i = null;
         _loc1_ = new _1T_i();
         _loc1_.x = _bf._16m + 35;
         _loc1_._1vP_(true);
         _loc1_._R_6 = true;
         return _loc1_;
      }
      
      public static function _17F_(param1:uint, param2:uint, param3:int, param4:Boolean, param5:Boolean, param6:int = 2) : Shape
      {
         var _loc7_:Shape = null;
         _loc7_ = new Shape();
         param4 && _loc7_.graphics.beginFill(4605510,1);
         param5 && _loc7_.graphics.lineStyle(param6,param2);
         _loc7_.graphics.drawRoundRect(0,param3,param1,param1,16,16);
         _loc7_.x = (100 - param1) * 0.5;
         return _loc7_;
      }
      
      public static function _V_w(param1:int) : XImageButton
      {
         var _loc2_:XImageButton = null;
         _loc2_ = new XImageButton();
         _loc2_.y = 4;
         _loc2_.x = param1 - _loc2_.width - 5;
         return _loc2_;
      }
      
      public static function _0S_d() : _0fL_
      {
         var _loc1_:_0fL_ = null;
         _loc1_ = new _0fL_(173,0);
         _loc1_.x = 5;
         _loc1_.y = 64;
         return _loc1_;
      }
      
      public static function _Z_q(param1:uint, param2:uint = 80) : Bitmap
      {
         return new Bitmap(ObjectLibrary.getRedrawnTextureFromType(param1,param2,true));
      }
      
      public static function _0N_Z_() : Bitmap
      {
         return _1pu(6466);
      }
      
      public static function _q2(param1:uint) : Bitmap
      {
         return new Bitmap(ObjectLibrary.getRedrawnTextureFromType(param1,80,true));
      }
      
      private static function _1pu(param1:uint) : Bitmap
      {
         var _loc2_:Bitmap = new Bitmap();
         var _loc3_:XML = ObjectLibrary.XmlData[param1];
         var _loc4_:int = 5;
         if(_loc3_.hasOwnProperty("ScaleValue"))
         {
            _loc4_ = _loc3_.ScaleValue;
         }
         var _loc5_:BitmapData = ObjectLibrary.getRedrawnTextureFromType(param1,80,true,true,_loc4_);
         _loc5_ = BitmapUtil._0P_V_(_loc5_,4,4,_loc5_.width - 8,_loc5_.height - 8);
         return new Bitmap(_loc5_);
      }
      
      public static function _1zG_() : FusionStrength
      {
         var _loc1_:FusionStrength = null;
         _loc1_ = new FusionStrength();
         _loc1_.y = _bf._o5;
         _loc1_.x = (_bf._0Y_O_ - _loc1_.width) * 0.5;
         return _loc1_;
      }
      
      public static function _01t(param1:int, param2:int, param3:Boolean, param4:Boolean = false) : SimpleText
      {
         var _loc5_:SimpleText = new SimpleText();
         _loc5_.setSize(param2).setColor(param1).setBold(param3);
         _loc5_.filters = !!param4?[new DropShadowFilter(0,0,0)]:[];
         return _loc5_;
      }
      
      public static function _0M_n(param1:int, param2:int, param3:Boolean, param4:Boolean = false) : SimpleText
      {
         var _loc5_:SimpleText = new SimpleText();
         _loc5_.setSize(param2).setColor(param1).setBold(param3);
         _loc5_.setVerticalAlign(SimpleText.BOTTOM);
         _loc5_.filters = !!param4?[new DropShadowFilter(0,0,0)]:[];
         return _loc5_;
      }
      
      public static function _vL_(param1:uint, param2:uint) : _1dh
      {
         var _loc3_:_1dh = new _1dh();
         _loc3_.draw(param1,param2);
         _loc3_._0yq(_1dh.HORIZONTAL_DIVISION,30);
         _loc3_._0yq(_1dh.HORIZONTAL_DIVISION,212);
         _loc3_._0yq(_1dh.HORIZONTAL_DIVISION,349);
         return _loc3_;
      }
      
      public static function _0aY_(param1:uint, param2:uint) : _1dh
      {
         var _loc3_:_1dh = new _1dh();
         _loc3_.draw(param1,param2);
         _loc3_._0yq(_1dh.HORIZONTAL_DIVISION,30);
         _loc3_._0yq(_1dh.HORIZONTAL_DIVISION,206);
         return _loc3_;
      }
   }
}
