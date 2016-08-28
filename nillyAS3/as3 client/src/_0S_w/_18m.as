package _0S_w
{
   import ToolTips.ToolTip;
   import flash.display.Bitmap;
   import com.company.assembleegameclient.objects.ObjectLibrary;
   import flash.display.BitmapData;
   
   class _18m extends _1oe
   {
       
      
      public var _1J_x:XML;
      
      function _18m(param1:XML)
      {
         var _loc2_:Bitmap = null;
         super(int(param1.@type));
         this._1J_x = param1;
         var _loc3_:BitmapData = ObjectLibrary.getRedrawnTextureFromType(type_,100,true,false);
         _loc2_ = new Bitmap(_loc3_);
         var _loc4_:Number = (WIDTH - 4) / Math.max(_loc2_.width,_loc2_.height);
         _loc2_.scaleX = _loc2_.scaleY = _loc4_;
         _loc2_.x = WIDTH / 2 - _loc2_.width / 2;
         _loc2_.y = HEIGHT / 2 - _loc2_.height / 2;
         addChild(_loc2_);
      }
      
      override protected function getToolTip() : ToolTip
      {
         return new _18M_(this._1J_x);
      }
   }
}
