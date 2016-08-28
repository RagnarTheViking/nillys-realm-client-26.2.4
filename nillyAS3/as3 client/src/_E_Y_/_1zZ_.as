package _E_Y_
{
   import _1un.Layout;
   import flash.display.DisplayObject;
   
   public class _1zZ_ implements Layout
   {
       
      
      private var padding:int = 0;
      
      public function _1zZ_()
      {
         super();
      }
      
      public function _0G_7() : int
      {
         return this.padding;
      }
      
      public function _1gC_(param1:int) : void
      {
         this.padding = param1;
      }
      
      public function layout(param1:Vector.<DisplayObject>, param2:int = 0) : void
      {
         var _loc3_:DisplayObject = null;
         var _loc6_:int = 0;
         var _loc4_:int = param2;
         var _loc5_:int = param1.length;
         while(_loc6_ < _loc5_)
         {
            _loc3_ = param1[_loc6_];
            _loc3_.x = _loc4_;
            _loc4_ = _loc4_ + (_loc3_.width + this.padding);
            _loc6_++;
         }
      }
   }
}
