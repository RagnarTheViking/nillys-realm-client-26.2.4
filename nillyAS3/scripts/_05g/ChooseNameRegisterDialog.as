package _05g
{
   import _1O_R_.Dialog;
   import _f7.Signal;
   import _C_._1O_I_;
   import _1S_0.NativeMappedSignal;
   
   public class ChooseNameRegisterDialog extends Dialog
   {
      
      private static const _0A_m:String = "/chooseNameNeedRegister";
       
      
      public var cancel:Signal;
      
      public var register:Signal;
      
      public function ChooseNameRegisterDialog()
      {
         super(_1O_I_._1K_c,_1O_I_._19Q_,_1O_I_._0hQ_,_1O_I_._0kM_,_0A_m);
         this.cancel = new NativeMappedSignal(this,LEFT_BUTTON);
         this.register = new NativeMappedSignal(this,RIGHT_BUTTON);
      }
   }
}
