package _T_n
{
   import flash.display.Sprite;
   import _00v._1cz;
   import _00v._1yN_;
   import flash.display.LineScaleMode;
   import flash.display.CapsStyle;
   import flash.display.JointStyle;
   
   public class _03K_ extends Sprite
   {
      
      private static const BEVEL:int = 4;
       
      
      public function _03K_()
      {
         super();
      }
      
      public function draw(param1:int, param2:int) : void
      {
         var _loc3_:_1cz = new _1cz(param1,param2,BEVEL);
         var _loc4_:_1yN_ = new _1yN_();
         graphics.lineStyle(1,16777215,1,false,LineScaleMode.NORMAL,CapsStyle.NONE,JointStyle.ROUND,3);
         graphics.beginFill(3552822);
         _loc4_._18h(0,0,_loc3_,graphics);
         graphics.endFill();
      }
   }
}
