package _0S_w
{
   import ToolTips.ToolTip;
   import flash.display.Shape;
   import com.company.assembleegameclient.map.RegionLibrary;
   
   public class _0yk extends _1oe
   {
       
      
      public var _C_n:XML;
      
      public function _0yk(param1:XML)
      {
         super(int(param1.@type));
         this._C_n = param1;
         var _loc2_:Shape = new Shape();
         _loc2_.graphics.beginFill(RegionLibrary.getColor(type_),0.5);
         _loc2_.graphics.drawRect(0,0,WIDTH - 8,HEIGHT - 8);
         _loc2_.graphics.endFill();
         _loc2_.x = WIDTH / 2 - _loc2_.width / 2;
         _loc2_.y = HEIGHT / 2 - _loc2_.height / 2;
         addChild(_loc2_);
      }
      
      override protected function getToolTip() : ToolTip
      {
         return new _0X_V_(this._C_n);
      }
   }
}
