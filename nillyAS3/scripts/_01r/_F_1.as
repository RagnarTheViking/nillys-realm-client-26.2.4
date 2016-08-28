package _01r
{
   import _0B_y.AGALMiniAssembler;
   import flash.utils.ByteArray;
   import flash.display3D.Context3DProgramType;
   
   public class _F_1 extends AGALMiniAssembler
   {
       
      
      private var _1q1:ByteArray;
      
      public function _F_1()
      {
         super();
         var _loc1_:AGALMiniAssembler = new AGALMiniAssembler();
         _loc1_._11r(Context3DProgramType.VERTEX,"m44 op, va0, vc0\n" + "add vt1, va1, vc4\n" + "mov v0, vt1");
         this._1q1 = _loc1_._1r0;
      }
      
      public function getVertexProgram() : ByteArray
      {
         return this._1q1;
      }
   }
}
