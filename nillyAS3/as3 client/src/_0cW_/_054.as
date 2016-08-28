package _0cW_
{
   import flash.display3D.IndexBuffer3D;
   
   public class _054
   {
       
      
      private var _1Q_H_:IndexBuffer3D;
      
      public function _054(param1:IndexBuffer3D)
      {
         super();
         this._1Q_H_ = param1;
      }
      
      public function uploadFromVector(param1:Vector.<uint>, param2:int, param3:int) : void
      {
         this._1Q_H_.uploadFromVector(param1,param2,param3);
      }
      
      public function _ok() : IndexBuffer3D
      {
         return this._1Q_H_;
      }
   }
}
