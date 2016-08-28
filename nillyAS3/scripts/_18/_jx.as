package _18
{
   import flash.display.Sprite;
   import flash.display.Bitmap;
   import flash.geom.ColorTransform;
   
   public class _jx extends Sprite
   {
       
      
      public var index:int;
      
      private var background:Sprite;
      
      private var icon:Bitmap;
      
      public function _jx(param1:int, param2:Sprite, param3:Bitmap)
      {
         super();
         this.index = param1;
         this._U_O_(param2);
         if(param3)
         {
            this._vS_(param3);
         }
      }
      
      private function _U_O_(param1:Sprite) : void
      {
         this.background = param1;
         addChild(param1);
      }
      
      private function _vS_(param1:Bitmap) : void
      {
         this.icon = param1;
         param1.x = param1.x - 5;
         param1.y = param1.y - 11;
         addChild(param1);
      }
      
      public function setSelected(param1:Boolean) : void
      {
         var _loc2_:ColorTransform = this.background.transform.colorTransform;
         _loc2_.color = !!param1?uint(_0M_3._0p0):uint(_0M_3._0eb);
         this.background.transform.colorTransform = _loc2_;
      }
   }
}
