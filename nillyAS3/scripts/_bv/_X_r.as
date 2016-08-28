package _bv
{
   import flash.display.Sprite;
   import flash.text.TextField;
   import _0H_6.GameContext;
   import _C_._0C_J_;
   import flash.filters.DropShadowFilter;
   import _1gF_.SimpleText;
   
   public class _X_r extends Sprite
   {
      
      public static const _1Y_6:int = 22;
      
      public static const _1U_i:int = 26;
       
      
      public function _X_r(param1:String, param2:String)
      {
         var _loc3_:TextField = null;
         super();
         this.doubleClickEnabled = false;
         this.mouseEnabled = false;
         _loc3_ = new TextField();
         var _loc4_:_0C_J_ = GameContext.getInjector().getInstance(_0C_J_);
         _loc4_.apply(_loc3_,16,15792127,false,true);
         _loc3_.width = _19k._0W_P_ - _1U_i * 2;
         _loc3_.height = _19k._0kV_ - 101;
         _loc3_.multiline = true;
         _loc3_.wordWrap = true;
         _loc3_.htmlText = param2;
         _loc3_.x = _1U_i;
         _loc3_.y = 53;
         _loc3_.filters = [new DropShadowFilter(0,0,0)];
         _0__a(_loc3_);
         addChild(_loc3_);
         var _loc5_:SimpleText = _19k._1g8(param1,_1Y_6,6,true);
         addChild(_loc5_);
      }
      
      private static function _0__a(param1:TextField) : void
      {
         param1.mouseWheelEnabled = false;
      }
   }
}
