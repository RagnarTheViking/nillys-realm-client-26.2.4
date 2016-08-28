package _0cW_
{
   import flash.display3D.Program3D;
   import flash.utils.ByteArray;
   
   public class _0r6
   {
       
      
      private var _P_q:Program3D;
      
      public function _0r6(param1:Program3D)
      {
         super();
         this._P_q = param1;
      }
      
      public function upload(param1:ByteArray, param2:ByteArray) : void
      {
         this._P_q.upload(param1,param2);
      }
      
      public function _1O_r() : Program3D
      {
         return this._P_q;
      }
   }
}
