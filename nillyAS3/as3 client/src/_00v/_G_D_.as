package _00v
{
   import flash.errors.IllegalOperationError;
   import flash.display.DisplayObject;
   import flash.geom.Rectangle;
   
   public class _G_D_
   {
       
      
      public function _G_D_()
      {
         super();
      }
      
      public function layout(param1:int, ... rest) : void
      {
         var _loc3_:int = rest.length;
         switch(_loc3_)
         {
            case 1:
               this._0__n(param1,rest[0]);
               return;
            case 2:
               this._0G_P_(param1,rest[0],rest[1]);
               return;
            default:
               throw new IllegalOperationError("Currently unable to layout more than 2 buttons");
         }
      }
      
      private function _0__n(param1:int, param2:DisplayObject) : void
      {
         var _loc3_:Rectangle = param2.getRect(param2);
         param2.x = (param1 - _loc3_.width) * 0.5 - _loc3_.left;
      }
      
      private function _0G_P_(param1:int, param2:DisplayObject, param3:DisplayObject) : void
      {
         var _loc4_:Rectangle = null;
         var _loc5_:Rectangle = param2.getRect(param2);
         _loc4_ = param3.getRect(param3);
         param2.x = (param1 - 2 * param2.width) * 0.25 - _loc5_.left;
         param3.x = (3 * param1 - 2 * param3.width) * 0.25 - _loc4_.left;
      }
   }
}
