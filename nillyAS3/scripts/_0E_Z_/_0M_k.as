package _0E_Z_
{
   import flash.display.Sprite;
   import flash.display.DisplayObject;
   
   public class _0M_k extends Sprite
   {
       
      
      public var _A_y:DisplayObject;
      
      public function _0M_k(param1:DisplayObject, param2:Number, param3:Number)
      {
         super();
         this._A_y = param1;
         addChild(param1);
         this.width = param2;
         this.height = param3;
      }
      
      public function setXPos(param1:Number) : void
      {
         this.x = param1 - this.width / 2;
      }
      
      public function setYPos(param1:Number) : void
      {
         this.y = param1 - this.height / 2;
      }
      
      public function getCenterX() : Number
      {
         return this.x + this.width / 2;
      }
      
      public function getCenterY() : Number
      {
         return this.y + this.height / 2;
      }
   }
}
