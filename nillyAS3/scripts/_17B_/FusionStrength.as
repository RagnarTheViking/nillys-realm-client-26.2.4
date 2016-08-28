package _17B_
{
   import flash.display.Sprite;
   import _1gF_.SimpleText;
   import _1xa._dU_;
   
   public class FusionStrength extends Sprite
   {
      
      public static const _0iv:uint = 8768801;
      
      public static const _05t:uint = 16711680;
      
      public static const _15__:int = 11776947;
      
      public static const LOW:String = "FusionStrength.Low";
      
      public static const _1P_i:String = "FusionStrength.Bad";
      
      public static const _S_9:String = "FusionStrength.Good";
      
      public static const _0Q_f:String = "FusionStrength.Great";
      
      public static const _154:String = "FusionStrength.Fantastic";
      
      public static const _190:String = "FusionStrength.Maxed";
      
      public static const NONE:String = "FusionStrength.None";
      
      private static const _0ci:Number = 16;
       
      
      public var _V_2:SimpleText;
      
      public function FusionStrength()
      {
         super();
         addChild(_0I_C_._Z_h());
         this._3Y_();
         this._1A_t();
      }
      
      private static function _0mI_(param1:Number) : String
      {
         if(_1z6(param1))
         {
            return _190;
         }
         if(param1 > 0.8)
         {
            return _154;
         }
         if(param1 > 0.6)
         {
            return _0Q_f;
         }
         if(param1 > 0.4)
         {
            return _S_9;
         }
         if(param1 > 0.2)
         {
            return LOW;
         }
         return _1P_i;
      }
      
      private static function _1z6(param1:Number) : Boolean
      {
         return Math.abs(param1 - 1) < 0.001;
      }
      
      private static function _1F_m(param1:Number) : Boolean
      {
         return param1 < 0.2;
      }
      
      public function reset() : void
      {
         this._V_2.setStringBuilder(new _dU_().setParams(NONE));
         this._V_2.setColor(_15__);
      }
      
      private function _3Y_() : void
      {
         var _loc1_:SimpleText = null;
         _loc1_ = _0I_C_.makeText();
         _loc1_.x = _0ci;
         _loc1_.y = this._J_K_();
         addChild(_loc1_);
      }
      
      private function _1A_t() : void
      {
         this._V_2 = _0I_C_._wE_();
         this._V_2.x = width - _0ci;
         this._V_2.y = this._J_K_();
         this._V_2.setStringBuilder(new _dU_().setParams(NONE));
         this._V_2.setColor(_15__);
         addChild(this._V_2);
      }
      
      private function _J_K_() : Number
      {
         return height / 2;
      }
      
      public function _S_f(param1:Number) : void
      {
         var _loc2_:String = _0mI_(param1);
         this._V_2.setStringBuilder(new _dU_().setParams(_loc2_));
         this._0X_j(param1);
      }
      
      private function _0X_j(param1:Number) : void
      {
         if(_1z6(param1))
         {
            this._V_2.setColor(_0iv);
         }
         else if(_1F_m(param1))
         {
            this._V_2.setColor(_05t);
         }
         else
         {
            this._V_2.setColor(_15__);
         }
      }
   }
}
