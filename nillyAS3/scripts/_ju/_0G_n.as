package _ju
{
   import flash.display.Sprite;
   import com.company.rotmg.graphics.ScreenGraphic;
   import _W_Q_.TextButton;
   import flash.geom.Rectangle;
   
   public class _0G_n extends Sprite
   {
      
      private static const _02H_:Number = 550;
      
      private static const _0N_m:int = 20;
      
      public static const CENTER:String = "CENTER";
      
      public static const RIGHT:String = "RIGHT";
      
      public static const LEFT:String = "LEFT";
       
      
      private const _1zu:Array = [];
      
      private const _or:Array = [];
      
      private var _R_:ScreenGraphic;
      
      public function _0G_n()
      {
         super();
         this._sN_();
      }
      
      private function _sN_() : void
      {
         this._R_ = new ScreenGraphic();
         addChild(this._R_);
      }
      
      public function _19d(param1:TextButton, param2:String) : void
      {
         this._R_.addChild(param1);
         switch(param2)
         {
            case CENTER:
               this._1zu[0] = this._or[0] = param1;
               param1.x = this._R_.width / 2;
               param1.y = _02H_;
               return;
            case LEFT:
               this._lY_(this._1zu[this._1zu.length - 1],param1);
               this._1zu.push(param1);
               param1._my.add(this._A_8);
               return;
            case RIGHT:
               this._1aH_(this._or[this._or.length - 1],param1);
               this._or.push(param1);
               param1._my.add(this._12N_);
               return;
            default:
               return;
         }
      }
      
      private function _A_8() : void
      {
         var _loc1_:int = 1;
         while(_loc1_ < this._1zu.length)
         {
            this._lY_(this._1zu[_loc1_ - 1],this._1zu[_loc1_]);
            _loc1_++;
         }
      }
      
      private function _lY_(param1:TextButton, param2:TextButton) : void
      {
         var _loc3_:Rectangle = param1.getBounds(param1);
         var _loc4_:Rectangle = param2.getBounds(param2);
         param2.x = param1.x + _loc3_.left - _loc4_.right - _0N_m;
         param2.y = _02H_;
      }
      
      private function _12N_() : void
      {
         var _loc1_:int = 1;
         while(_loc1_ < this._or.length)
         {
            this._1aH_(this._or[_loc1_ - 1],this._or[_loc1_]);
            _loc1_++;
         }
      }
      
      private function _1aH_(param1:TextButton, param2:TextButton) : void
      {
         var _loc3_:Rectangle = param1.getBounds(param1);
         var _loc4_:Rectangle = param2.getBounds(param2);
         param2.x = param1.x + _loc3_.right - _loc4_.left + _0N_m;
         param2.y = _02H_;
      }
   }
}
