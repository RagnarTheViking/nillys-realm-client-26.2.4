package _K_m
{
   import _wi.Injector;
   import flash.utils.Dictionary;
   
   public class _L_d extends _1J_K_
   {
       
      
      public function _L_d(param1:Array, param2:uint, param3:Dictionary)
      {
         super("ctor",param1,param2,false,param3);
      }
      
      public function createInstance(param1:Class, param2:Injector) : Object
      {
         var _loc3_:Object = null;
         var _loc4_:Array = _1Y_X_(param1,param1,param2);
         switch(_loc4_.length)
         {
            case 1:
               _loc3_ = new param1(_loc4_[0]);
               break;
            case 2:
               _loc3_ = new param1(_loc4_[0],_loc4_[1]);
               break;
            case 3:
               _loc3_ = new param1(_loc4_[0],_loc4_[1],_loc4_[2]);
               break;
            case 4:
               _loc3_ = new param1(_loc4_[0],_loc4_[1],_loc4_[2],_loc4_[3]);
               break;
            case 5:
               _loc3_ = new param1(_loc4_[0],_loc4_[1],_loc4_[2],_loc4_[3],_loc4_[4]);
               break;
            case 6:
               _loc3_ = new param1(_loc4_[0],_loc4_[1],_loc4_[2],_loc4_[3],_loc4_[4],_loc4_[5]);
               break;
            case 7:
               _loc3_ = new param1(_loc4_[0],_loc4_[1],_loc4_[2],_loc4_[3],_loc4_[4],_loc4_[5],_loc4_[6]);
               break;
            case 8:
               _loc3_ = new param1(_loc4_[0],_loc4_[1],_loc4_[2],_loc4_[3],_loc4_[4],_loc4_[5],_loc4_[6],_loc4_[7]);
               break;
            case 9:
               _loc3_ = new param1(_loc4_[0],_loc4_[1],_loc4_[2],_loc4_[3],_loc4_[4],_loc4_[5],_loc4_[6],_loc4_[7],_loc4_[8]);
               break;
            case 10:
               _loc3_ = new param1(_loc4_[0],_loc4_[1],_loc4_[2],_loc4_[3],_loc4_[4],_loc4_[5],_loc4_[6],_loc4_[7],_loc4_[8],_loc4_[9]);
         }
         _loc4_.length = 0;
         return _loc3_;
      }
   }
}
