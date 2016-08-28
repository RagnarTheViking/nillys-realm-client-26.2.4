package _01r
{
   import flash.utils.ByteArray;
   import _0B_y.AGALMiniAssembler;
   import flash.display3D.Context3DProgramType;
   
   public class _0E_9
   {
       
      
      private var _1q1:ByteArray;
      
      public function _0E_9()
      {
         super();
         var _loc1_:AGALMiniAssembler = new AGALMiniAssembler();
         _loc1_._11r(Context3DProgramType.FRAGMENT,"tex ft1, v0, fs0 <2d, repeat>\n" + "mul ft1.x, ft1.x, fc2.x\n" + "mul ft1.y, ft1.y, fc2.y\n" + "mul ft1.z, ft1.z, fc2.z\n" + "mul ft1.w, ft1.w, fc2.w\n" + "add ft1, ft1, fc3\n" + "mov oc, ft1");
         this._1q1 = _loc1_._1r0;
      }
      
      public function getVertexProgram() : ByteArray
      {
         return this._1q1;
      }
   }
}
