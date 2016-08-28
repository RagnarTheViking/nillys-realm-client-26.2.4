package _00I_
{
   import _1O_R_._0I_z;
   import _f7.Signal;
   import _1S_0.NativeMappedSignal;
   
   public class _0B_g extends _0I_z
   {
      
      private static const MESSAGE:String = "Failed to retrieve valid Kabam request! Click to reload.";
       
      
      public var close:Signal;
      
      public function _0B_g()
      {
         super(MESSAGE);
         this.close = new NativeMappedSignal(this,LEFT_BUTTON);
      }
   }
}
