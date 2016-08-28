package _05g
{
   import _1O_R_.Dialog;
   import _f7.Signal;
   import _C_._1O_I_;
   import _1S_0.NativeMappedSignal;
   
   public class NotEnoughGoldDialog extends Dialog
   {
      
      private static const _0A_m:String = "/notEnoughGold";
       
      
      public var cancel:Signal;
      
      public var _1S_H_:Signal;
      
      public function NotEnoughGoldDialog()
      {
         super(_1O_I_._0T_9,_1O_I_._mm,_1O_I_._0cV_,_1O_I_._0eY_,_0A_m);
         this.cancel = new NativeMappedSignal(this,LEFT_BUTTON);
         this._1S_H_ = new NativeMappedSignal(this,RIGHT_BUTTON);
      }
   }
}
