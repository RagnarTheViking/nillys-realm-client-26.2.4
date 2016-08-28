package _1dw
{
   import _1O_R_._0I_z;
   import _f7.Signal;
   import _1S_0.NativeMappedSignal;
   import _1O_R_.Dialog;
   
   public class _0yI_ extends _0I_z
   {
       
      
      public var ok:Signal;
      
      public function _0yI_()
      {
         super("Failed to retrieve valid Steam Credentials! Click to retry.");
         this.ok = new NativeMappedSignal(this,Dialog.LEFT_BUTTON);
      }
   }
}
