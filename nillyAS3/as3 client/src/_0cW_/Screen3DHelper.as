package _0cW_
{
   import flash.display3D.Context3D;
   import flash.geom.Matrix3D;
   
   public class Screen3DHelper
   {
       
      
      private var context3D:Context3D;
      
      public function Screen3DHelper(param1:Context3D)
      {
         super();
         this.context3D = param1;
      }
      
      public function getContext() : Context3D
      {
         return this.context3D;
      }
      
      public function configureBackBuffer(param1:int, param2:int, param3:int, param4:Boolean = true) : void
      {
         this.context3D.configureBackBuffer(param1,param2,param3,param4);
      }
      
      public function createProgram() : _0r6
      {
         return new _0r6(this.context3D.createProgram());
      }
      
      public function clear() : void
      {
         this.context3D.clear(0.05,0.05,0.05);
      }
      
      public function present() : void
      {
         this.context3D.present();
      }
      
      public function createIndexBuffer(param1:int) : _054
      {
         return new _054(this.context3D.createIndexBuffer(param1));
      }
      
      public function createVertexBuffer(param1:int, param2:int) : _0iA_
      {
         return new _0iA_(this.context3D.createVertexBuffer(param1,param2));
      }
      
      public function setVertexBufferAt(param1:int, param2:_0iA_, param3:int, param4:String = "float4") : void
      {
         this.context3D.setVertexBufferAt(param1,param2._2Z_(),param3,param4);
      }
      
      public function setProgramConstantsFromMatrix(param1:String, param2:int, param3:Matrix3D, param4:Boolean = false) : void
      {
         this.context3D.setProgramConstantsFromMatrix(param1,param2,param3,param4);
      }
      
      public function setProgramConstantsFromVector(param1:String, param2:int, param3:Vector.<Number>, param4:int = -1) : void
      {
         this.context3D.setProgramConstantsFromVector(param1,param2,param3,param4);
      }
      
      public function createTexture(param1:int, param2:int, param3:String, param4:Boolean) : _1rz
      {
         return new _1rz(this.context3D.createTexture(param1,param2,param3,param4));
      }
      
      public function setTextureAt(param1:int, param2:_1rz) : void
      {
         this.context3D.setTextureAt(param1,param2.getTexture());
      }
      
      public function setProgram(param1:_0r6) : void
      {
         this.context3D.setProgram(param1._1O_r());
      }
      
      public function drawTriangles(param1:_054) : void
      {
         this.context3D.drawTriangles(param1._ok());
      }
      
      public function setBlendFactors(param1:String, param2:String) : void
      {
         this.context3D.setBlendFactors(param1,param2);
      }
      
      public function setDepthTest(param1:Boolean, param2:String) : void
      {
         this.context3D.setDepthTest(param1,param2);
      }
   }
}
