package _0T_b
{
   import flash.display.Sprite;
   import com.company.ui._0H_R_;
   import flash.display.LineScaleMode;
   import flash.display.CapsStyle;
   import flash.display.JointStyle;
   
   public class _44 extends Sprite
   {
      
      protected static const _0p0:uint = 3355443;
      
      protected static const _0G_N_:uint = 16549442;
      
      protected static const _br:uint = 4539717;
      
      protected static const _1nw:uint = 11776947;
       
      
      public function _44()
      {
         super();
      }
      
      public function getHeight() : Number
      {
         return 0;
      }
      
      protected function _2w(param1:_0H_R_, param2:int, param3:int, param4:Boolean) : void
      {
         var _loc5_:uint = !!param4?uint(_0G_N_):uint(_br);
         graphics.lineStyle(2,_loc5_,1,false,LineScaleMode.NORMAL,CapsStyle.ROUND,JointStyle.ROUND);
         graphics.beginFill(_0p0,1);
         graphics.drawRect(param1.x - param2 - 5,param1.y - param3,param1.width + param2 * 2,param1.height + param3 * 2);
         graphics.endFill();
         graphics.lineStyle();
      }
   }
}
