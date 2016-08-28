package _17B_
{
   import flash.display.Sprite;
   import _00v._1cz;
   import _00v._1yN_;
   import flash.display.LineScaleMode;
   import flash.display.CapsStyle;
   import flash.display.JointStyle;
   
   public class _1dh extends Sprite
   {
      
      public static const HORIZONTAL_DIVISION:String = "HORIZONTAL_DIVISION";
      
      public static const VERTICAL_DIVISION:String = "VERTICAL_DIVISION";
      
      private static const BEVEL:int = 4;
      
      public static const _v3:int = 0;
      
      public static const _1rP_:int = 1;
      
      public static const _1b7:int = 2;
      
      public static const _H_2:int = 3;
       
      
      public function _1dh()
      {
         super();
      }
      
      public function draw(param1:int, param2:int, param3:int = 0) : void
      {
         var _loc4_:_1cz = new _1cz(param1,param2,BEVEL);
         var _loc5_:_1yN_ = new _1yN_();
         graphics.lineStyle(1,16777215,1,false,LineScaleMode.NORMAL,CapsStyle.NONE,JointStyle.ROUND,3);
         if(param3 == _1rP_)
         {
            graphics.lineStyle(1,3552822,1,false,LineScaleMode.NORMAL,CapsStyle.NONE,JointStyle.ROUND,3);
            graphics.beginFill(3552822,1);
            _loc5_._18h(1,1,new _1cz(param1 - 2,29,BEVEL),graphics);
            graphics.endFill();
            graphics.beginFill(3552822,1);
            graphics.drawRect(1,15,param1 - 2,15);
            graphics.endFill();
            graphics.lineStyle(2,16777215,1,false,LineScaleMode.NORMAL,CapsStyle.NONE,JointStyle.ROUND,3);
            graphics.beginFill(3552822,0);
            _loc5_._18h(0,0,_loc4_,graphics);
            graphics.endFill();
         }
         else if(param3 == _1b7)
         {
            graphics.lineStyle(2,16777215,1,false,LineScaleMode.NORMAL,CapsStyle.NONE,JointStyle.ROUND,3);
            graphics.beginFill(3552822,0);
            _loc5_._18h(0,0,_loc4_,graphics);
            graphics.endFill();
         }
         else if(param3 == _v3)
         {
            graphics.beginFill(3552822);
            _loc5_._18h(0,0,_loc4_,graphics);
            graphics.endFill();
         }
         else if(param3 == _H_2)
         {
            graphics.beginFill(0);
            _loc5_._18h(0,0,_loc4_,graphics);
            graphics.endFill();
         }
      }
      
      public function _0yq(param1:String, param2:int) : void
      {
         if(param1 == HORIZONTAL_DIVISION)
         {
            this._0B_q(param2);
         }
         else if(param1 == VERTICAL_DIVISION)
         {
            this._0tr(param2);
         }
      }
      
      private function _0B_q(param1:int) : void
      {
         graphics.lineStyle();
         graphics.endFill();
         graphics.moveTo(1,param1);
         graphics.beginFill(6710886,1);
         graphics.drawRect(1,param1,width - 2,2);
      }
      
      private function _0tr(param1:int) : void
      {
         graphics.lineStyle();
         graphics.moveTo(param1,1);
         graphics.lineStyle(2,6710886);
         graphics.lineTo(param1,height - 1);
      }
   }
}
