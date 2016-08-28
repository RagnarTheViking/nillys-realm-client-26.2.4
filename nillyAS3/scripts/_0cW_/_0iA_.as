package _0cW_
{
   import flash.display3D.VertexBuffer3D;
   
   public class _0iA_
   {
       
      
      private var _0pq:VertexBuffer3D;
      
      protected var data:Vector.<Number>;
      
      public function _0iA_(param1:VertexBuffer3D)
      {
         super();
         this._0pq = param1;
      }
      
      public function uploadFromVector(param1:Vector.<Number>, param2:int, param3:int) : void
      {
         this.data = param1;
         this._0pq.uploadFromVector(param1,param2,param3);
      }
      
      public function _2Z_() : VertexBuffer3D
      {
         return this._0pq;
      }
      
      public function _C_o() : Vector.<Number>
      {
         return this.data;
      }
   }
}
