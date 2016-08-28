package _0J_8
{
   import _1O_R_.Dialog;
   import _f7.Signal;
   import _C_._1O_I_;
   import _1S_0.NativeMappedSignal;
   
   public class NeedRegistrationDialog extends Dialog
   {
       
      
      public var cancel:Signal;
      
      public var register:Signal;
      
      public function NeedRegistrationDialog(param1:String, param2:Object = null)
      {
         super(_1O_I_._1K_c,param1,_1O_I_._0hQ_,_1O_I_._0kM_,"/needRegister",param2);
         this.cancel = new NativeMappedSignal(this,LEFT_BUTTON);
         this.register = new NativeMappedSignal(this,RIGHT_BUTTON);
      }
   }
}
