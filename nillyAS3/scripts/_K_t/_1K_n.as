package _K_t
{
   import flash.display.Shape;
   
   public class _1K_n extends Shape
   {
       
      
      private var _1Y_4:int;
      
      private var _height:int;
      
      private var _color:int;
      
      public function _1K_n()
      {
         super();
      }
      
      public function setSize(param1:int, param2:int) : void
      {
         this._1Y_4 = param1;
         this._height = param2;
         this._zP_();
      }
      
      public function setColor(param1:int) : void
      {
         this._color = param1;
         this._zP_();
      }
      
      private function _zP_() : void
      {
         graphics.clear();
         graphics.beginFill(this._color);
         graphics.drawRect(0,0,this._1Y_4,this._height);
         graphics.endFill();
      }
   }
}
